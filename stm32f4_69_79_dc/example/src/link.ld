/* This is a ARM specific version of this file */

/* This script replaces ld's default linker script, providing the
   appropriate memory map and output format. */

SEARCH_DIR(.)
__DYNAMIC  =  0;

_DEFAULT_STACK_SIZE = 0x400;

ENTRY(Reset_Handler);

MEMORY
{
  flash (rx) : ORIGIN = 0x8000000, LENGTH = 0x80000
  ccm (rwx) : ORIGIN = 0x10000000, LENGTH = 0x10000
  sram1 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x28000
  sram2 (rwx) : ORIGIN = 0x20028000, LENGTH = 0x8000
  sram3 (rwx) : ORIGIN = 0x20030000, LENGTH = 0x20000
  backup (rwx) : ORIGIN = 0x40024000, LENGTH = 0x1000
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
  /* ccm */
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
  } > ccm AT> flash
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
   __heap_end = ORIGIN(ccm) + LENGTH(ccm);
  } > ccm
  __bss_words = (__bss_end - __bss_start) >> 2;
  /**************/
  /* End of ccm */
  /**************/

  /*********/
  /* sram1 */
  /*********/
  __sram1_data_load = LOADADDR(.sram1_data);
  .sram1_data :
  {
    __sram1_data_start = .;
    *(.sram1_data .sram1_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __sram1_data_end = .;
  } >  sram1 AT> flash
  __sram1_data_words = (__sram1_data_end - __sram1_data_start) >> 2;

  .sram1_bss (NOLOAD): {
    . = ALIGN(0x8);
    __sram1_bss_start = .;

    *(.sram1_bss .sram1_bss.*)


    __sram1_bss_end = .;
    __sram1_heap_start = .;
    __sram1_heap_end = ORIGIN(sram1) + LENGTH(sram1);
  } > sram1
  __sram1_bss_words = (__sram1_bss_end - __sram1_bss_start) >> 2;
  /****************/
  /* End of sram1 */
  /****************/

  /*********/
  /* sram2 */
  /*********/
  __sram2_data_load = LOADADDR(.sram2_data);
  .sram2_data :
  {
    __sram2_data_start = .;
    *(.sram2_data .sram2_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __sram2_data_end = .;
  } >  sram2 AT> 
  __sram2_data_words = (__sram2_data_end - __sram2_data_start) >> 2;

  .sram2_bss (NOLOAD): {
    . = ALIGN(0x8);
    __sram2_bss_start = .;

    *(.sram2_bss .sram2_bss.*)


    __sram2_bss_end = .;
    __sram2_heap_start = .;
    __sram2_heap_end = ORIGIN(sram2) + LENGTH(sram2);
  } > sram2
  __sram2_bss_words = (__sram2_bss_end - __sram2_bss_start) >> 2;
  /****************/
  /* End of sram2 */
  /****************/

  /*********/
  /* sram3 */
  /*********/
  __sram3_data_load = LOADADDR(.sram3_data);
  .sram3_data :
  {
    __sram3_data_start = .;
    *(.sram3_data .sram3_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __sram3_data_end = .;
  } >  sram3 AT> 
  __sram3_data_words = (__sram3_data_end - __sram3_data_start) >> 2;

  .sram3_bss (NOLOAD): {
    . = ALIGN(0x8);
    __sram3_bss_start = .;

    *(.sram3_bss .sram3_bss.*)


    __sram3_bss_end = .;
    __sram3_heap_start = .;
    __sram3_heap_end = ORIGIN(sram3) + LENGTH(sram3);
  } > sram3
  __sram3_bss_words = (__sram3_bss_end - __sram3_bss_start) >> 2;
  /****************/
  /* End of sram3 */
  /****************/

  /**********/
  /* backup */
  /**********/
  __backup_data_load = LOADADDR(.backup_data);
  .backup_data :
  {
    __backup_data_start = .;
    *(.backup_data .backup_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __backup_data_end = .;
  } >  backup AT> 
  __backup_data_words = (__backup_data_end - __backup_data_start) >> 2;

  .backup_bss (NOLOAD): {
    . = ALIGN(0x8);
    __backup_bss_start = .;

    *(.backup_bss .backup_bss.*)


    __backup_bss_end = .;
    __backup_heap_start = .;
    __backup_heap_end = ORIGIN(backup) + LENGTH(backup);
  } > backup
  __backup_bss_words = (__backup_bss_end - __backup_bss_start) >> 2;
  /*****************/
  /* End of backup */
  /*****************/

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