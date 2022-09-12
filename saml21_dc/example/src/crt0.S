	.syntax unified

#if defined(__SOFTFP__)
	.cpu cortex-m0
#else
        /* FPU support means at least cortex-m4 compatibility */
        .cpu cortex-m4
#endif

        .thumb

	.text
	.globl __vectors
	.p2align 9
	.section .vectors,"a"
__vectors:
	/* Cortex-M core interrupts */
	.word   __stack_end              /* stack top address */
	.word   Reset_Handler            /* 1 Reset */
	.word   NMI_Handler              /* 2 NMI. */
	.word   HardFault_Handler        /* 3 Hard fault. */
	.word   MemoryManagement_Handler /* 4 Mem manage. */
	.word   BusFault_Handler         /* 5 Bus fault. */
	.word   UsageFault_Handler       /* 6 Usage fault. */
	.word   Reserved_Handler         /* 7 reserved. */
	.word   Reserved_Handler         /* 8 reserved. */
	.word   Reserved_Handler         /* 9 reserved. */
	.word   Reserved_Handler         /* 10 reserved. */
	.word   SVC_Handler              /* 11 SVCall. */
	.word   DebugMon_Handler         /* 12 Breakpoint. */
	.word   Reserved_Handler         /* 13 reserved. */
	.word   PendSV_Handler           /* 14 PendSV. */
	.word   SysTick_Handler          /* 15 Systick. */
	/* MCU interrupts */
        .word __SYSTEM_handler /* 0 */
        .word __WDT_handler /* 1 */
        .word __RTC_handler /* 2 */
        .word __EIC_handler /* 3 */
        .word __NVMCTRL_handler /* 4 */
        .word __DMAC_handler /* 5 */
        .word __USB_handler /* 6 */
        .word __EVSYS_handler /* 7 */
        .word __SERCOM0_handler /* 8 */
        .word __SERCOM1_handler /* 9 */
        .word __SERCOM2_handler /* 10 */
        .word __SERCOM3_handler /* 11 */
        .word __SERCOM4_handler /* 12 */
        .word __SERCOM5_handler /* 13 */
        .word __TCC0_handler /* 14 */
        .word __TCC1_handler /* 15 */
        .word __TCC2_handler /* 16 */
        .word __TC0_handler /* 17 */
        .word __TC1_handler /* 18 */
        .word __unknown_interrupt_handler /* 19 */
        .word __unknown_interrupt_handler /* 20 */
        .word __TC4_handler /* 21 */
        .word __ADC_handler /* 22 */
        .word __AC_handler /* 23 */
        .word __DAC_handler /* 24 */
        .word __PTC_handler /* 25 */
        .word __AES_handler /* 26 */
        .word __TRNG_handler /* 27 */

   .weak      __SYSTEM_handler
   .thumb_set __SYSTEM_handler,__common_int_handler
   .weak      __WDT_handler
   .thumb_set __WDT_handler,__common_int_handler
   .weak      __RTC_handler
   .thumb_set __RTC_handler,__common_int_handler
   .weak      __EIC_handler
   .thumb_set __EIC_handler,__common_int_handler
   .weak      __NVMCTRL_handler
   .thumb_set __NVMCTRL_handler,__common_int_handler
   .weak      __DMAC_handler
   .thumb_set __DMAC_handler,__common_int_handler
   .weak      __USB_handler
   .thumb_set __USB_handler,__common_int_handler
   .weak      __EVSYS_handler
   .thumb_set __EVSYS_handler,__common_int_handler
   .weak      __SERCOM0_handler
   .thumb_set __SERCOM0_handler,__common_int_handler
   .weak      __SERCOM1_handler
   .thumb_set __SERCOM1_handler,__common_int_handler
   .weak      __SERCOM2_handler
   .thumb_set __SERCOM2_handler,__common_int_handler
   .weak      __SERCOM3_handler
   .thumb_set __SERCOM3_handler,__common_int_handler
   .weak      __SERCOM4_handler
   .thumb_set __SERCOM4_handler,__common_int_handler
   .weak      __SERCOM5_handler
   .thumb_set __SERCOM5_handler,__common_int_handler
   .weak      __TCC0_handler
   .thumb_set __TCC0_handler,__common_int_handler
   .weak      __TCC1_handler
   .thumb_set __TCC1_handler,__common_int_handler
   .weak      __TCC2_handler
   .thumb_set __TCC2_handler,__common_int_handler
   .weak      __TC0_handler
   .thumb_set __TC0_handler,__common_int_handler
   .weak      __TC1_handler
   .thumb_set __TC1_handler,__common_int_handler
   .weak      __TC4_handler
   .thumb_set __TC4_handler,__common_int_handler
   .weak      __ADC_handler
   .thumb_set __ADC_handler,__common_int_handler
   .weak      __AC_handler
   .thumb_set __AC_handler,__common_int_handler
   .weak      __DAC_handler
   .thumb_set __DAC_handler,__common_int_handler
   .weak      __PTC_handler
   .thumb_set __PTC_handler,__common_int_handler
   .weak      __AES_handler
   .thumb_set __AES_handler,__common_int_handler
   .weak      __TRNG_handler
   .thumb_set __TRNG_handler,__common_int_handler

	.text

   .weak      __unknown_interrupt_handler
   .thumb_set __unknown_interrupt_handler,__common_int_handler

.macro weak_handler name
	.thumb_func
.weak \name
.type \name, %function
\name:
0:	b 0b
	.size \name, . - \name
.endm

weak_handler NMI_Handler
weak_handler HardFault_Handler
weak_handler MemoryManagement_Handler
weak_handler BusFault_Handler
weak_handler UsageFault_Handler
weak_handler Reserved_Handler
weak_handler SVC_Handler
weak_handler DebugMon_Handler
weak_handler PendSV_Handler
weak_handler SysTick_Handler
weak_handler __common_int_handler

        /*********/
        /* .data */
        /*********/
        .section .data.argv
argv_str:
        .ascii  "main\0"

        .align 4
argv:
        .word argv_str
        .word 0

        /*****************/
        /* Reset_Handler */
        /*****************/

	.text
	.thumb_func
	.globl Reset_Handler

Reset_Handler:

	/* Set the stack pointer */
	ldr	r1,=__stack_end
	mov     sp, r1

	/* Copy .data */
	.thumb_func
_startup_copy_data:
	ldr	r0,=__data_start
	ldr	r1,=__data_words
	ldr	r2,=__data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_data, . - _startup_copy_data

	/* Copy .lpram_data */
	.thumb_func
_startup_copy_lpram_data:
	ldr	r0,=__lpram_data_start
	ldr	r1,=__lpram_data_words
	ldr	r2,=__lpram_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_lpram_data, . - _startup_copy_lpram_data

	/* Clear .bss */
	.thumb_func
_startup_clear_bss:
	ldr	r0,=__bss_start
	ldr	r1,=__bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_bss, . - _startup_clear_bss

	/* Clear .lpram_bss */
	.thumb_func
_startup_clear_lpram_bss:
	ldr	r0,=__lpram_bss_start
	ldr	r1,=__lpram_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_lpram_bss, . - _startup_clear_lpram_bss


#if !defined(__SOFTFP__)
        /**************/
        /* Enable FPU */
        /**************/

        movw     r0,#0xED88
        movt     r0,#0xE000
        ldr      r1,[r0]
        orr      r1,r1,#(0xF << 20)
        str      r1,[r0]

        dsb
        isb
#endif

        /* Call static constructors */
.weak __libc_init_array
        ldr     r5,=__libc_init_array
        cmp     r5,#0
        beq     .skip_libc_init
        blx     r5
.skip_libc_init:

        /* Call main, with argc, argv */
        movs    r0,#1
        ldr	r1,=argv
        bl	main

        /* Save main's return value */
        mov r4, r0

        /* static destructors */
.weak __libc_fini_array
        ldr     r5,=__libc_fini_array
        cmp     r5,#0
        beq     .skip_libc_fini
        blx     r5
.skip_libc_fini:

        /* Restore main's return value */
        mov r0, r4

        bl	_exit
        bl	Reset_Handler
	.size Reserved_Handler, . - Reset_Handler