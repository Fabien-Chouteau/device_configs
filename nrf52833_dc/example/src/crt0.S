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
        .word __POWER_CLOCK_handler /* 0 */
        .word __RADIO_handler /* 1 */
        .word __UARTE0_UART0_handler /* 2 */
        .word __SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_handler /* 3 */
        .word __SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_handler /* 4 */
        .word __NFCT_handler /* 5 */
        .word __GPIOTE_handler /* 6 */
        .word __SAADC_handler /* 7 */
        .word __TIMER0_handler /* 8 */
        .word __TIMER1_handler /* 9 */
        .word __TIMER2_handler /* 10 */
        .word __RTC0_handler /* 11 */
        .word __TEMP_handler /* 12 */
        .word __RNG_handler /* 13 */
        .word __ECB_handler /* 14 */
        .word __CCM_AAR_handler /* 15 */
        .word __WDT_handler /* 16 */
        .word __RTC1_handler /* 17 */
        .word __QDEC_handler /* 18 */
        .word __COMP_LPCOMP_handler /* 19 */
        .word __SWI0_EGU0_handler /* 20 */
        .word __SWI1_EGU1_handler /* 21 */
        .word __SWI2_EGU2_handler /* 22 */
        .word __SWI3_EGU3_handler /* 23 */
        .word __SWI4_EGU4_handler /* 24 */
        .word __SWI5_EGU5_handler /* 25 */
        .word __TIMER3_handler /* 26 */
        .word __TIMER4_handler /* 27 */
        .word __PWM0_handler /* 28 */
        .word __PDM_handler /* 29 */
        .word __unknown_interrupt_handler /* 30 */
        .word __unknown_interrupt_handler /* 31 */
        .word __MWU_handler /* 32 */
        .word __PWM1_handler /* 33 */
        .word __PWM2_handler /* 34 */
        .word __SPIM2_SPIS2_SPI2_handler /* 35 */
        .word __RTC2_handler /* 36 */
        .word __I2S_handler /* 37 */
        .word __FPU_handler /* 38 */
        .word __USBD_handler /* 39 */
        .word __UARTE1_handler /* 40 */
        .word __unknown_interrupt_handler /* 41 */
        .word __unknown_interrupt_handler /* 42 */
        .word __unknown_interrupt_handler /* 43 */
        .word __unknown_interrupt_handler /* 44 */
        .word __PWM3_handler /* 45 */
        .word __unknown_interrupt_handler /* 46 */
        .word __SPIM3_handler /* 47 */

   .weak      __POWER_CLOCK_handler
   .thumb_set __POWER_CLOCK_handler,__common_int_handler
   .weak      __RADIO_handler
   .thumb_set __RADIO_handler,__common_int_handler
   .weak      __UARTE0_UART0_handler
   .thumb_set __UARTE0_UART0_handler,__common_int_handler
   .weak      __SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_handler
   .thumb_set __SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_handler,__common_int_handler
   .weak      __SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_handler
   .thumb_set __SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_handler,__common_int_handler
   .weak      __NFCT_handler
   .thumb_set __NFCT_handler,__common_int_handler
   .weak      __GPIOTE_handler
   .thumb_set __GPIOTE_handler,__common_int_handler
   .weak      __SAADC_handler
   .thumb_set __SAADC_handler,__common_int_handler
   .weak      __TIMER0_handler
   .thumb_set __TIMER0_handler,__common_int_handler
   .weak      __TIMER1_handler
   .thumb_set __TIMER1_handler,__common_int_handler
   .weak      __TIMER2_handler
   .thumb_set __TIMER2_handler,__common_int_handler
   .weak      __RTC0_handler
   .thumb_set __RTC0_handler,__common_int_handler
   .weak      __TEMP_handler
   .thumb_set __TEMP_handler,__common_int_handler
   .weak      __RNG_handler
   .thumb_set __RNG_handler,__common_int_handler
   .weak      __ECB_handler
   .thumb_set __ECB_handler,__common_int_handler
   .weak      __CCM_AAR_handler
   .thumb_set __CCM_AAR_handler,__common_int_handler
   .weak      __WDT_handler
   .thumb_set __WDT_handler,__common_int_handler
   .weak      __RTC1_handler
   .thumb_set __RTC1_handler,__common_int_handler
   .weak      __QDEC_handler
   .thumb_set __QDEC_handler,__common_int_handler
   .weak      __COMP_LPCOMP_handler
   .thumb_set __COMP_LPCOMP_handler,__common_int_handler
   .weak      __SWI0_EGU0_handler
   .thumb_set __SWI0_EGU0_handler,__common_int_handler
   .weak      __SWI1_EGU1_handler
   .thumb_set __SWI1_EGU1_handler,__common_int_handler
   .weak      __SWI2_EGU2_handler
   .thumb_set __SWI2_EGU2_handler,__common_int_handler
   .weak      __SWI3_EGU3_handler
   .thumb_set __SWI3_EGU3_handler,__common_int_handler
   .weak      __SWI4_EGU4_handler
   .thumb_set __SWI4_EGU4_handler,__common_int_handler
   .weak      __SWI5_EGU5_handler
   .thumb_set __SWI5_EGU5_handler,__common_int_handler
   .weak      __TIMER3_handler
   .thumb_set __TIMER3_handler,__common_int_handler
   .weak      __TIMER4_handler
   .thumb_set __TIMER4_handler,__common_int_handler
   .weak      __PWM0_handler
   .thumb_set __PWM0_handler,__common_int_handler
   .weak      __PDM_handler
   .thumb_set __PDM_handler,__common_int_handler
   .weak      __MWU_handler
   .thumb_set __MWU_handler,__common_int_handler
   .weak      __PWM1_handler
   .thumb_set __PWM1_handler,__common_int_handler
   .weak      __PWM2_handler
   .thumb_set __PWM2_handler,__common_int_handler
   .weak      __SPIM2_SPIS2_SPI2_handler
   .thumb_set __SPIM2_SPIS2_SPI2_handler,__common_int_handler
   .weak      __RTC2_handler
   .thumb_set __RTC2_handler,__common_int_handler
   .weak      __I2S_handler
   .thumb_set __I2S_handler,__common_int_handler
   .weak      __FPU_handler
   .thumb_set __FPU_handler,__common_int_handler
   .weak      __USBD_handler
   .thumb_set __USBD_handler,__common_int_handler
   .weak      __UARTE1_handler
   .thumb_set __UARTE1_handler,__common_int_handler
   .weak      __PWM3_handler
   .thumb_set __PWM3_handler,__common_int_handler
   .weak      __SPIM3_handler
   .thumb_set __SPIM3_handler,__common_int_handler

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

	/* Copy .ram_data */
	.thumb_func
_startup_copy_ram_data:
	ldr	r0,=__ram_data_start
	ldr	r1,=__ram_data_words
	ldr	r2,=__ram_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_ram_data, . - _startup_copy_ram_data

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

	/* Clear .ram_bss */
	.thumb_func
_startup_clear_ram_bss:
	ldr	r0,=__ram_bss_start
	ldr	r1,=__ram_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_ram_bss, . - _startup_clear_ram_bss


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