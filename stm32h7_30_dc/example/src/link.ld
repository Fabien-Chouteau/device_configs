/* This is a ARM specific version of this file */

/* This script replaces ld's default linker script, providing the
   appropriate memory map and output format. */

SEARCH_DIR(.)
__DYNAMIC  =  0;

_DEFAULT_STACK_SIZE = 0x400;

ENTRY(Reset_Handler);

MEMORY
{
  itcm (rwx) : ORIGIN = 0x0, LENGTH = 0x10000
  flash (rx) : ORIGIN = 0x8000000, LENGTH = 0x20000
  dtcm (rwx) : ORIGIN = 0x20000000, LENGTH = 0x20000
  d1_sram (rwx) : ORIGIN = 0x24000000, LENGTH = 0x50000
  d2_sram1 (rwx) : ORIGIN = 0x30000000, LENGTH = 0x4000
  d2_sram2 (rwx) : ORIGIN = 0x30004000, LENGTH = 0x4000
  d3_sram (rwx) : ORIGIN = 0x38000000, LENGTH = 0x4000
  backup (rwx) : ORIGIN = 0x38800000, LENGTH = 0x1000
}

/*
 * Boot memory (.text, .ro_data, interrupt vector): itcm
 * Main RAM memory (.data, .bss, stacks, interrupt stacks): itcm
 */

SECTIONS
{

  /********/
  /* itcm */
  /********/
  .text :
  {
    KEEP (*(.vectors))
    *(.text .text.* .gnu.linkonce.t*)
    *(.gnu.warning)
  } > itcm

  .ARM.extab   : { *(.ARM.extab* .gnu.linkonce.armextab.*) } > itcm
  /* .ARM.exidx is 4-bytes aligned, so __exidx_start needs to be
     aligned too. Note that assigning the location counter also makes
     ld attach the following symbols to the next section (instead of the
     previous section which is the default), so will properly
     consider the location counter of .ARM.exidx for __exidx_start and
      __exidx_end and not the previous section's one. */
  . = ALIGN(0x4);
  PROVIDE_HIDDEN (__exidx_start = .);
  .ARM.exidx   : { *(.ARM.exidx* .gnu.linkonce.armexidx.*) } > itcm
  PROVIDE_HIDDEN (__exidx_end = .);

  .preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  } > itcm

  .init_array :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
  } > itcm

  .fini_array :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } > itcm

  .rodata :
  {
    *(.lit)
    *(.rodata .rodata.* .gnu.linkonce.r*)
    . = ALIGN(0x4);
    __rom_end = .;
  } > itcm
  /***************/
  /* End of itcm */
  /***************/

  /********/
  /* itcm */
  /********/
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
  } > itcm AT> itcm
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
   __heap_end = ORIGIN(itcm) + LENGTH(itcm);
  } > itcm
  __bss_words = (__bss_end - __bss_start) >> 2;
  /***************/
  /* End of itcm */
  /***************/

  /*********/
  /* flash */
  /*********/
  .flash_rodata :
  {
    __flash_rom_start = .;

    *(.flash_rodata .flash_rodata.*)
    . = ALIGN(0x4);
    __flash_rom_end = .;
  } > flash
  /****************/
  /* End of flash */
  /****************/

  /********/
  /* dtcm */
  /********/
  __dtcm_data_load = LOADADDR(.dtcm_data);
  .dtcm_data :
  {
    __dtcm_data_start = .;
    *(.dtcm_data .dtcm_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __dtcm_data_end = .;
  } >  dtcm AT> itcm
  __dtcm_data_words = (__dtcm_data_end - __dtcm_data_start) >> 2;

  .dtcm_bss (NOLOAD): {
    . = ALIGN(0x8);
    __dtcm_bss_start = .;

    *(.dtcm_bss .dtcm_bss.*)


    __dtcm_bss_end = .;
    __dtcm_heap_start = .;
    __dtcm_heap_end = ORIGIN(dtcm) + LENGTH(dtcm);
  } > dtcm
  __dtcm_bss_words = (__dtcm_bss_end - __dtcm_bss_start) >> 2;
  /***************/
  /* End of dtcm */
  /***************/

  /***********/
  /* d1_sram */
  /***********/
  __d1_sram_data_load = LOADADDR(.d1_sram_data);
  .d1_sram_data :
  {
    __d1_sram_data_start = .;
    *(.d1_sram_data .d1_sram_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __d1_sram_data_end = .;
  } >  d1_sram AT> 
  __d1_sram_data_words = (__d1_sram_data_end - __d1_sram_data_start) >> 2;

  .d1_sram_bss (NOLOAD): {
    . = ALIGN(0x8);
    __d1_sram_bss_start = .;

    *(.d1_sram_bss .d1_sram_bss.*)


    __d1_sram_bss_end = .;
    __d1_sram_heap_start = .;
    __d1_sram_heap_end = ORIGIN(d1_sram) + LENGTH(d1_sram);
  } > d1_sram
  __d1_sram_bss_words = (__d1_sram_bss_end - __d1_sram_bss_start) >> 2;
  /******************/
  /* End of d1_sram */
  /******************/

  /************/
  /* d2_sram1 */
  /************/
  __d2_sram1_data_load = LOADADDR(.d2_sram1_data);
  .d2_sram1_data :
  {
    __d2_sram1_data_start = .;
    *(.d2_sram1_data .d2_sram1_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __d2_sram1_data_end = .;
  } >  d2_sram1 AT> 
  __d2_sram1_data_words = (__d2_sram1_data_end - __d2_sram1_data_start) >> 2;

  .d2_sram1_bss (NOLOAD): {
    . = ALIGN(0x8);
    __d2_sram1_bss_start = .;

    *(.d2_sram1_bss .d2_sram1_bss.*)


    __d2_sram1_bss_end = .;
    __d2_sram1_heap_start = .;
    __d2_sram1_heap_end = ORIGIN(d2_sram1) + LENGTH(d2_sram1);
  } > d2_sram1
  __d2_sram1_bss_words = (__d2_sram1_bss_end - __d2_sram1_bss_start) >> 2;
  /*******************/
  /* End of d2_sram1 */
  /*******************/

  /************/
  /* d2_sram2 */
  /************/
  __d2_sram2_data_load = LOADADDR(.d2_sram2_data);
  .d2_sram2_data :
  {
    __d2_sram2_data_start = .;
    *(.d2_sram2_data .d2_sram2_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __d2_sram2_data_end = .;
  } >  d2_sram2 AT> 
  __d2_sram2_data_words = (__d2_sram2_data_end - __d2_sram2_data_start) >> 2;

  .d2_sram2_bss (NOLOAD): {
    . = ALIGN(0x8);
    __d2_sram2_bss_start = .;

    *(.d2_sram2_bss .d2_sram2_bss.*)


    __d2_sram2_bss_end = .;
    __d2_sram2_heap_start = .;
    __d2_sram2_heap_end = ORIGIN(d2_sram2) + LENGTH(d2_sram2);
  } > d2_sram2
  __d2_sram2_bss_words = (__d2_sram2_bss_end - __d2_sram2_bss_start) >> 2;
  /*******************/
  /* End of d2_sram2 */
  /*******************/

  /***********/
  /* d3_sram */
  /***********/
  __d3_sram_data_load = LOADADDR(.d3_sram_data);
  .d3_sram_data :
  {
    __d3_sram_data_start = .;
    *(.d3_sram_data .d3_sram_data.*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __d3_sram_data_end = .;
  } >  d3_sram AT> 
  __d3_sram_data_words = (__d3_sram_data_end - __d3_sram_data_start) >> 2;

  .d3_sram_bss (NOLOAD): {
    . = ALIGN(0x8);
    __d3_sram_bss_start = .;

    *(.d3_sram_bss .d3_sram_bss.*)


    __d3_sram_bss_end = .;
    __d3_sram_heap_start = .;
    __d3_sram_heap_end = ORIGIN(d3_sram) + LENGTH(d3_sram);
  } > d3_sram
  __d3_sram_bss_words = (__d3_sram_bss_end - __d3_sram_bss_start) >> 2;
  /******************/
  /* End of d3_sram */
  /******************/

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