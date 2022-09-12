/* This is a ARM specific version of this file */

/* This script replaces ld's default linker script, providing the
   appropriate memory map and output format. */

SEARCH_DIR(.)
__DYNAMIC  =  0;

_DEFAULT_STACK_SIZE = 0x400;

ENTRY(Reset_Handler);

MEMORY
{
  flash (rx) : ORIGIN = 0x10000000, LENGTH = 0x200000
  ram (rwx) : ORIGIN = 0x20000000, LENGTH = 0x40000
  core1 (rwx) : ORIGIN = 0x20040000, LENGTH = 0x1000
  core0 (rwx) : ORIGIN = 0x20041000, LENGTH = 0x1000
}

/*
 * Boot memory (.text, .ro_data, interrupt vector): flash
 * Main RAM memory (.data, .bss, stacks, interrupt stacks): flash
 */

SECTIONS
{

  /*********/
  /* flash */
  /*********/
  .text :
  {
    KEEP (*(.vectors))
    *(.text .text.* .gnu.linkonce.t*)
    *(.gnu.warning)
  } > flash

  .ARM.extab   : { *(.ARM.extab* .gnu.linkonce.armextab.*) } > flash
  /* .ARM.exidx is 4-bytes aligned, so __exidx_start needs to be
     aligned too. Note that assigning the location counter also makes
     ld attach the following symbols to the next section (instead of the
     previous section which is the default), so will properly
     consider the location counter of .ARM.exidx for __exidx_start and
      __exidx_end and not the previous section's one. */
  . = ALIGN(0x4);
  PROVIDE_HIDDEN (__exidx_start = .);
  .ARM.exidx   : { *(.ARM.exidx* .gnu.linkonce.armexidx.*) } > flash
  PROVIDE_HIDDEN (__exidx_end = .);

  .preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  } > flash

  .init_array :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
  } > flash

  .fini_array :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } > flash

  .rodata :
  {
    *(.lit)
    *(.rodata .rodata.* .gnu.linkonce.r*)
    . = ALIGN(0x4);
    __rom_end = .;
  } > flash
  /****************/
  /* End of flash */
  /****************/

  /*******/
  /* ram */
  /*******/
  __data_load = LOADADDR(.data);
  .data :
  {
    __data_start = .;
    *(.data .data.* .gnu.linkonce.d*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __data_end = .;
  } > ram AT> flash
  __data_words = (__data_end - __data_start) >> 2;

  .bss (NOLOAD): {
   . = ALIGN(0x8);
   __bss_start = .;

   *(.bss .bss.*)
   *(COMMON)

   . = ALIGN(0x8);    /* Align the stack to 64 bits */
   __bss_end = .;

    __interrupt_stack_start = .;
    *(.interrupt_stacks)
    . = ALIGN(0x8);
    __interrupt_stack_end = .;

    __stack_start = .;
    . += DEFINED (__stack_size) ? __stack_size : _DEFAULT_STACK_SIZE;
    . = ALIGN(0x8);
    __stack_end = .;

   _end = .;
   __heap_start = .;
   __heap_end = ORIGIN(ram) + LENGTH(ram);
  } > ram
  __bss_words = (__bss_end - __bss_start) >> 2;
  /**************/
  /* End of ram */
  /**************/

  /*********/
  /* core1 */
  /*********/
  __core1_data_load = LOADADDR(.core1_data);
  .core1_data :
  {
    __core1_data_start = .;
    *(.core1_data .core1_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __core1_data_end = .;
  } >  core1 AT> flash
  __core1_data_words = (__core1_data_end - __core1_data_start) >> 2;

  .core1_bss (NOLOAD): {
    . = ALIGN(0x8);
    __core1_bss_start = .;

    *(.core1_bss .core1_bss.*)


    __core1_bss_end = .;
    __core1_heap_start = .;
    __core1_heap_end = ORIGIN(core1) + LENGTH(core1);
  } > core1
  __core1_bss_words = (__core1_bss_end - __core1_bss_start) >> 2;
  /****************/
  /* End of core1 */
  /****************/

  /*********/
  /* core0 */
  /*********/
  __core0_data_load = LOADADDR(.core0_data);
  .core0_data :
  {
    __core0_data_start = .;
    *(.core0_data .core0_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __core0_data_end = .;
  } >  core0 AT> 
  __core0_data_words = (__core0_data_end - __core0_data_start) >> 2;

  .core0_bss (NOLOAD): {
    . = ALIGN(0x8);
    __core0_bss_start = .;

    *(.core0_bss .core0_bss.*)


    __core0_bss_end = .;
    __core0_heap_start = .;
    __core0_heap_end = ORIGIN(core0) + LENGTH(core0);
  } > core0
  __core0_bss_words = (__core0_bss_end - __core0_bss_start) >> 2;
  /****************/
  /* End of core0 */
  /****************/

  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }
}