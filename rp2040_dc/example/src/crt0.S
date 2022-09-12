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
        .word __TIMER_IRQ_0_handler /* 0 */
        .word __TIMER_IRQ_1_handler /* 1 */
        .word __TIMER_IRQ_2_handler /* 2 */
        .word __TIMER_IRQ_3_handler /* 3 */
        .word __PWM_IRQ_WRAP_handler /* 4 */
        .word __USBCTRL_IRQ_handler /* 5 */
        .word __XIP_IRQ_handler /* 6 */
        .word __PIO0_IRQ_0_handler /* 7 */
        .word __PIO0_IRQ_1_handler /* 8 */
        .word __PIO1_IRQ_0_handler /* 9 */
        .word __PIO1_IRQ_1_handler /* 10 */
        .word __DMA_IRQ_0_handler /* 11 */
        .word __DMA_IRQ_1_handler /* 12 */
        .word __IO_IRQ_BANK0_handler /* 13 */
        .word __IO_IRQ_QSPI_handler /* 14 */
        .word __SIO_IRQ_PROC0_handler /* 15 */
        .word __SIO_IRQ_PROC1_handler /* 16 */
        .word __CLOCKS_IRQ_handler /* 17 */
        .word __SPI0_IRQ_handler /* 18 */
        .word __SPI1_IRQ_handler /* 19 */
        .word __UART0_IRQ_handler /* 20 */
        .word __UART1_IRQ_handler /* 21 */
        .word __ADC_IRQ_FIFO_handler /* 22 */
        .word __I2C0_IRQ_handler /* 23 */
        .word __I2C1_IRQ_handler /* 24 */
        .word __RTC_IRQ_handler /* 25 */

   .weak      __TIMER_IRQ_0_handler
   .thumb_set __TIMER_IRQ_0_handler,__common_int_handler
   .weak      __TIMER_IRQ_1_handler
   .thumb_set __TIMER_IRQ_1_handler,__common_int_handler
   .weak      __TIMER_IRQ_2_handler
   .thumb_set __TIMER_IRQ_2_handler,__common_int_handler
   .weak      __TIMER_IRQ_3_handler
   .thumb_set __TIMER_IRQ_3_handler,__common_int_handler
   .weak      __PWM_IRQ_WRAP_handler
   .thumb_set __PWM_IRQ_WRAP_handler,__common_int_handler
   .weak      __USBCTRL_IRQ_handler
   .thumb_set __USBCTRL_IRQ_handler,__common_int_handler
   .weak      __XIP_IRQ_handler
   .thumb_set __XIP_IRQ_handler,__common_int_handler
   .weak      __PIO0_IRQ_0_handler
   .thumb_set __PIO0_IRQ_0_handler,__common_int_handler
   .weak      __PIO0_IRQ_1_handler
   .thumb_set __PIO0_IRQ_1_handler,__common_int_handler
   .weak      __PIO1_IRQ_0_handler
   .thumb_set __PIO1_IRQ_0_handler,__common_int_handler
   .weak      __PIO1_IRQ_1_handler
   .thumb_set __PIO1_IRQ_1_handler,__common_int_handler
   .weak      __DMA_IRQ_0_handler
   .thumb_set __DMA_IRQ_0_handler,__common_int_handler
   .weak      __DMA_IRQ_1_handler
   .thumb_set __DMA_IRQ_1_handler,__common_int_handler
   .weak      __IO_IRQ_BANK0_handler
   .thumb_set __IO_IRQ_BANK0_handler,__common_int_handler
   .weak      __IO_IRQ_QSPI_handler
   .thumb_set __IO_IRQ_QSPI_handler,__common_int_handler
   .weak      __SIO_IRQ_PROC0_handler
   .thumb_set __SIO_IRQ_PROC0_handler,__common_int_handler
   .weak      __SIO_IRQ_PROC1_handler
   .thumb_set __SIO_IRQ_PROC1_handler,__common_int_handler
   .weak      __CLOCKS_IRQ_handler
   .thumb_set __CLOCKS_IRQ_handler,__common_int_handler
   .weak      __SPI0_IRQ_handler
   .thumb_set __SPI0_IRQ_handler,__common_int_handler
   .weak      __SPI1_IRQ_handler
   .thumb_set __SPI1_IRQ_handler,__common_int_handler
   .weak      __UART0_IRQ_handler
   .thumb_set __UART0_IRQ_handler,__common_int_handler
   .weak      __UART1_IRQ_handler
   .thumb_set __UART1_IRQ_handler,__common_int_handler
   .weak      __ADC_IRQ_FIFO_handler
   .thumb_set __ADC_IRQ_FIFO_handler,__common_int_handler
   .weak      __I2C0_IRQ_handler
   .thumb_set __I2C0_IRQ_handler,__common_int_handler
   .weak      __I2C1_IRQ_handler
   .thumb_set __I2C1_IRQ_handler,__common_int_handler
   .weak      __RTC_IRQ_handler
   .thumb_set __RTC_IRQ_handler,__common_int_handler

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

	/* Copy .core1_data */
	.thumb_func
_startup_copy_core1_data:
	ldr	r0,=__core1_data_start
	ldr	r1,=__core1_data_words
	ldr	r2,=__core1_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_core1_data, . - _startup_copy_core1_data

	/* Copy .core0_data */
	.thumb_func
_startup_copy_core0_data:
	ldr	r0,=__core0_data_start
	ldr	r1,=__core0_data_words
	ldr	r2,=__core0_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_core0_data, . - _startup_copy_core0_data

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

	/* Clear .core1_bss */
	.thumb_func
_startup_clear_core1_bss:
	ldr	r0,=__core1_bss_start
	ldr	r1,=__core1_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_core1_bss, . - _startup_clear_core1_bss


	/* Clear .core0_bss */
	.thumb_func
_startup_clear_core0_bss:
	ldr	r0,=__core0_bss_start
	ldr	r1,=__core0_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_core0_bss, . - _startup_clear_core0_bss


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