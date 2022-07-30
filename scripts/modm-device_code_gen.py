#!/usr/bin/python3

# Using the pack: http://packs.download.atmel.com/Atmel.SAMD51_DFP.1.2.139.atpack

# This script can be used to generate code from an atdf file:
# - peripheral IDs for the GCLK device
# - GPIO functions
# - Device package with peripheral instances
# - Main_Clock on/off procedures for peripherals
# - Interrupt Names

import sys
import pathlib
import os
import json
import itertools
import string
import re
from collections import defaultdict
from xml.dom.minidom import parse, parseString
from pathlib import Path

MAINTAINER_LOGIN = "Fabien-Chouteau"
MAINTAINER_EMAIL = "Fabien Chouteau <chouteau@adacore.com>"

def mkdirs(path):
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)


def write_file(path, content):
    with open(path, 'w') as filetowrite:
        filetowrite.write(content)


def append_file(path, content):
    with open(path, 'a') as filetowrite:
        filetowrite.write(content)


def insert_file(path, line, content):
    with open(path, "r") as f:
        contents = f.readlines()

    contents.insert(line, content)

    with open(path, "w") as f:
        f.write("".join(contents))


class cd:
    """Context manager for changing the current working directory"""
    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


def runtime_from_core_type(typ):
    prefix = "light-"
    if typ == "cortex-m7fd":
        return prefix + "cortex-m7df"
    else:
        return prefix + typ


def target_from_core_type(typ):
    return "arm-elf"


def parse_core_driver(core, driver_name):
    _PREFIX_ATTRIBUTE_DEVICE = 'device-'
    elements = []
    for driver in core.getElementsByTagName(driver_name):
        conditions = {}
        attributes = {}
        for attr in driver.attributes.keys():
            if attr.startswith(_PREFIX_ATTRIBUTE_DEVICE):
                strip = attr[len(_PREFIX_ATTRIBUTE_DEVICE):]
                conditions[strip] = driver.getAttribute(attr).split('|')
            else:
                attributes[attr] = driver.getAttribute(attr)

        elements.append({'attributes': attributes, 'conditions': conditions})

    return elements


def parse_core(core):
    int_vectors = parse_core_driver(core, 'vector')
    memories = parse_core_driver(core, 'memory')
    core_type = core.getAttribute('type')

    return {'core_type': core_type,
            'int_vectors': int_vectors,
            'memories': memories}


def conditions_match(conds, ident):
    for k, v in conds.items():
        if ident[k] not in v:
            return False
    return True


def gen_vector(indentation, vect):
    name = vect['attributes']['name']
    pos  = vect['attributes']['position']
    return (" " * indentation ) + f'for Interrupt ("{pos}") use "{name}";\n'


def gen_memory(indentation, mem):
    ident = " " * indentation
    name = mem['attributes']['name']
    start = mem['attributes']['start']
    size = mem['attributes']['size']
    access = mem['attributes']['access']
    if access == "rx":
        kind = "ROM"
    elif access == "rwx" or access == "rw":
        kind = "RAM"
    else:
        return ""

    out = ''
    out += ident + f'Mem_List := Mem_List & ("{name}");\n'
    out += ident + f'for Mem_Kind ("{name}") use "{kind}";\n'
    out += ident + f'for Address  ("{name}") use "{start}";\n'
    out += ident + f'for Size     ("{name}") use "{size}";\n'
    return out

def gen_from_conditions(gen_fn, elements, valid_idents):
    out = ''
    for elt in elements:
        if len(elt['conditions']) == 0:
            out += gen_fn(3 * 2, elt)

    for elt in elements:
        if len(elt['conditions']) != 0:
            matching = [ident['name'] for ident in valid_idents\
                        if conditions_match(elt['conditions'], ident)]

            matching = '" |\n              "'.join(matching)
            out += '      case Device_Name is\n'
            out += f'         when "{matching}" =>\n'
            out += gen_fn(3 * 4, elt)
            out += f'         when others => null;\n'
            out += f'      end case;\n'

    return out


def gen_from_core(core, gpr_name, naming_attributes, valid_idents):
    core_type = core['core_type']

    out = ''
    out += f'with "config/{gpr_name.lower()}_config.gpr";\n'
    out += f'abstract project {gpr_name} is\n'
    out += f'   for Target use "{target_from_core_type(core_type)}";\n'
    out += f'   for Runtime ("Ada") use "{runtime_from_core_type(core_type)}";\n'
    out += '   package Device_Configuration is\n'
    out += f'      Device_Name := {gpr_name.lower()}_Config.Device;\n'
    out += f'      for CPU_Name use "{core_type}";\n'
    out += '\n'

    out += gen_from_conditions(gen_vector, core['int_vectors'], valid_idents)
    out += '\n'

    out += '      Mem_List := ();\n'
    out += gen_from_conditions(gen_memory, core['memories'], valid_idents)
    out += '      for Memories use Mem_List;\n'
    out += f'      for Boot_Memory use {gpr_name.lower()}_Config.Boot_Memory;\n'
    out += f'      for Main_Stack_Size use {gpr_name.lower()}_Config.Stack_Size;\n'
    out += '\n'
    out += '   end Device_Configuration;\n'
    out += f'end {gpr_name};\n'
    return out


def get_valid_identifiers(device, naming_attributes, naming_schema):
    """
    Generate valid identifiers from all posible combinations of name attributes
    and only keep the valid ones.
    """

    # Generate a list of all possible combinations of attributes
    attributes = list(itertools.product(*naming_attributes.values()))

    # Make identifiers from the combinations
    all_identifiers = []
    for attr in attributes:
        iden = {}
        for ii, k in enumerate(naming_attributes.keys()):
            iden[k] = attr[ii]
        name = string.Formatter().vformat(naming_schema, (),
                                          defaultdict(str, **iden))
        iden['name'] = name
        all_identifiers.append(iden)

    # Get an optional list of valid identifiers
    valid_devices = []
    for dev in device.getElementsByTagName('valid-device'):
        valid_devices.append(dev.firstChild.nodeValue)

    # Get an optional list of invalid identifiers
    invalid_devices = []
    for dev in device.getElementsByTagName('invalid-device'):
        invalid_devices.append(dev.firstChild.nodeValue)

    # Filter either from valid or invalid identifier depending on what's
    # available.
    if len(valid_devices) != 0:
        filtered_identifiers = []
        for iden in all_identifiers:
            if iden['name'] in valid_devices:
                filtered_identifiers.append(iden)
    else:
        filtered_identifiers = []
        for iden in all_identifiers:
            if iden['name'] not in invalid_devices:
                filtered_identifiers.append(iden)

    return filtered_identifiers


def gen_manifest(crate_name, valid_idents, core):
    out = ''
    out += f'name = "{crate_name}"\n'
    out += f'description = "Device configuration for {crate_name} micro-controllers"\n'
    out += 'version = "0.1.0-dev"\n'
    out += 'authors = ["a script"]\n'
    out += f'maintainers = ["{MAINTAINER_EMAIL}"]\n'
    out += f'maintainers-logins = ["{MAINTAINER_LOGIN}"]\n'

    out += '[configuration.variables]\n'

    device_values = '", "'.join(ident['name'] for ident in valid_idents)
    out += f'Device = {{type = "Enum", values = ["{device_values}"]}}\n'

    mem_values = '", "'.join(set(mem['attributes']['name'] for mem in core['memories']))
    out += f'Boot_Memory = {{type = "Enum", values = ["{mem_values}"]}}\n'

    out += 'Stack_Size = {type = "Integer", first = 1, default = 1024}\n'
    return out


def make_example(crate_name, valid_idents, core):
    example_dir = os.path.join (crate_name, 'example')
    mkdirs(example_dir)

    with cd(example_dir):
        ret = os.system(f'alr -n init --bin --in-place example')
        if ret != 0:
            os.sys.exit(ret)

    first_device = valid_idents[0]['name']

    out = ''
    out +=  '[[depends-on]]\n'
    out += f'{crate_name} = "*"\n'
    out +=  'gnat_arm_elf = ">=12"\n'
    out +=  '\n'
    out +=  '[[pins]]\n'
    out += f'{crate_name} = {{ path = ".." }}\n'
    out +=  '\n'
    out +=  '[configuration.values]\n'
    out += f'{crate_name}.Device = "{first_device}"\n'

    boot_mem = core['memories'][0]['attributes']['name']
    out += f'{crate_name}.Boot_Memory = "{boot_mem}"\n'

    append_file(os.path.join (example_dir, 'alire.toml'), out)


    gpr_file = os.path.join(example_dir, "example.gpr")
    insert_file(gpr_file, 0, f'with "{crate_name}.gpr";\n')

    insert_file(gpr_file, 4, '\n')
    insert_file(gpr_file, 4, f'   package Device_Configuration renames {crate_name}.Device_Configuration;\n')
    insert_file(gpr_file, 4, f'   for Runtime ("Ada") use {crate_name}\'Runtime ("Ada");\n')
    insert_file(gpr_file, 4, f'   for Target use {crate_name}\'Target;\n')
    insert_file(gpr_file, 4, '   for Languages use ("Ada", "Asm_CPP");\n')
    insert_file(gpr_file, 4, """
   package Linker is
      for Switches ("Ada") use ("-T", Project'Project_dir & "/src/link.ld",
                                 "-Wl,--print-memory-usage",
                                 "-Wl,--gc-sections");
   end Linker;
""");

    with cd(example_dir):
        ret = os.system(f'alr -n update')
        if ret != 0:
            os.sys.exit(ret)

        ret = os.system(f'alr exec -P -- startup-gen -s src/crt0.S -l src/link.ld')
        if ret != 0:
            os.sys.exit(ret)

        ret = os.system(f'alr -n build')
        if ret != 0:
            os.sys.exit(ret)

def gen_from_xml(xml):
    dom = parse(xml)

    device = dom.getElementsByTagName('device')[0]
    naming_schema = dom.getElementsByTagName('naming-schema')[0].firstChild.nodeValue

    naming_attributes = {k:v.split('|') for k,v in device.attributes.items()}

    filename = Path(xml).stem
    gpr_name = re.sub('[^0-9a-zA-Z]+', '_', filename) + "_dc"
    gpr_filename = gpr_name.lower() + ".gpr"
    crate_name = gpr_name.lower()

    valid_idents = get_valid_identifiers(device, naming_attributes, naming_schema)

    gpr_out = ""
    for driver in dom.getElementsByTagName('driver'):
        if driver.getAttribute('name') == 'core':
            core = parse_core(driver)
            gpr_out = gen_from_core(core, gpr_name, naming_attributes, valid_idents)

    alire_out = gen_manifest(crate_name, valid_idents, core)

    mkdirs(crate_name)
    write_file(os.path.join (crate_name, gpr_filename), gpr_out)
    write_file(os.path.join (crate_name, 'alire.toml'), alire_out)

    make_example(crate_name, valid_idents, core)

if ( __name__ == "__main__"):
    gen_from_xml(sys.argv[1])
