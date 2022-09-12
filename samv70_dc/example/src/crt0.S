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
        .word __SUPC_handler /* 0 */
        .word __RSTC_handler /* 1 */
        .word __RTC_handler /* 2 */
        .word __RTT_handler /* 3 */
        .word __WDT_handler /* 4 */
        .word __PMC_handler /* 5 */
        .word __EFC_handler /* 6 */
        .word __UART0_handler /* 7 */
        .word __UART1_handler /* 8 */
        .word __unknown_interrupt_handler /* 9 */
        .word __PIOA_handler /* 10 */
        .word __PIOB_handler /* 11 */
        .word __unknown_interrupt_handler /* 12 */
        .word __USART0_handler /* 13 */
        .word __USART1_handler /* 14 */
        .word __unknown_interrupt_handler /* 15 */
        .word __PIOD_handler /* 16 */
        .word __unknown_interrupt_handler /* 17 */
        .word __HSMCI_handler /* 18 */
        .word __TWIHS0_handler /* 19 */
        .word __TWIHS1_handler /* 20 */
        .word __unknown_interrupt_handler /* 21 */
        .word __SSC_handler /* 22 */
        .word __TC0_handler /* 23 */
        .word __TC1_handler /* 24 */
        .word __TC2_handler /* 25 */
        .word __TC3_handler /* 26 */
        .word __TC4_handler /* 27 */
        .word __TC5_handler /* 28 */
        .word __AFEC0_handler /* 29 */
        .word __DACC_handler /* 30 */
        .word __PWM0_handler /* 31 */
        .word __ICM_handler /* 32 */
        .word __ACC_handler /* 33 */
        .word __USBHS_handler /* 34 */
        .word __MCAN0_INT0_handler /* 35 */
        .word __MCAN0_INT1_handler /* 36 */
        .word __MCAN1_INT0_handler /* 37 */
        .word __MCAN1_INT1_handler /* 38 */
        .word __unknown_interrupt_handler /* 39 */
        .word __AFEC1_handler /* 40 */
        .word __unknown_interrupt_handler /* 41 */
        .word __unknown_interrupt_handler /* 42 */
        .word __QSPI_handler /* 43 */
        .word __UART2_handler /* 44 */
        .word __unknown_interrupt_handler /* 45 */
        .word __unknown_interrupt_handler /* 46 */
        .word __TC6_handler /* 47 */
        .word __TC7_handler /* 48 */
        .word __TC8_handler /* 49 */
        .word __TC9_handler /* 50 */
        .word __TC10_handler /* 51 */
        .word __TC11_handler /* 52 */
        .word __MLB_handler /* 53 */
        .word __unknown_interrupt_handler /* 54 */
        .word __unknown_interrupt_handler /* 55 */
        .word __AES_handler /* 56 */
        .word __TRNG_handler /* 57 */
        .word __XDMAC_handler /* 58 */
        .word __ISI_handler /* 59 */
        .word __PWM1_handler /* 60 */
        .word __FPU_handler /* 61 */
        .word __unknown_interrupt_handler /* 62 */
        .word __RSWDT_handler /* 63 */
        .word __CCW_handler /* 64 */
        .word __CCF_handler /* 65 */
        .word __unknown_interrupt_handler /* 66 */
        .word __unknown_interrupt_handler /* 67 */
        .word __IXC_handler /* 68 */

   .weak      __SUPC_handler
   .thumb_set __SUPC_handler,__common_int_handler
   .weak      __RSTC_handler
   .thumb_set __RSTC_handler,__common_int_handler
   .weak      __RTC_handler
   .thumb_set __RTC_handler,__common_int_handler
   .weak      __RTT_handler
   .thumb_set __RTT_handler,__common_int_handler
   .weak      __WDT_handler
   .thumb_set __WDT_handler,__common_int_handler
   .weak      __PMC_handler
   .thumb_set __PMC_handler,__common_int_handler
   .weak      __EFC_handler
   .thumb_set __EFC_handler,__common_int_handler
   .weak      __UART0_handler
   .thumb_set __UART0_handler,__common_int_handler
   .weak      __UART1_handler
   .thumb_set __UART1_handler,__common_int_handler
   .weak      __PIOA_handler
   .thumb_set __PIOA_handler,__common_int_handler
   .weak      __PIOB_handler
   .thumb_set __PIOB_handler,__common_int_handler
   .weak      __USART0_handler
   .thumb_set __USART0_handler,__common_int_handler
   .weak      __USART1_handler
   .thumb_set __USART1_handler,__common_int_handler
   .weak      __PIOD_handler
   .thumb_set __PIOD_handler,__common_int_handler
   .weak      __HSMCI_handler
   .thumb_set __HSMCI_handler,__common_int_handler
   .weak      __TWIHS0_handler
   .thumb_set __TWIHS0_handler,__common_int_handler
   .weak      __TWIHS1_handler
   .thumb_set __TWIHS1_handler,__common_int_handler
   .weak      __SSC_handler
   .thumb_set __SSC_handler,__common_int_handler
   .weak      __TC0_handler
   .thumb_set __TC0_handler,__common_int_handler
   .weak      __TC1_handler
   .thumb_set __TC1_handler,__common_int_handler
   .weak      __TC2_handler
   .thumb_set __TC2_handler,__common_int_handler
   .weak      __TC3_handler
   .thumb_set __TC3_handler,__common_int_handler
   .weak      __TC4_handler
   .thumb_set __TC4_handler,__common_int_handler
   .weak      __TC5_handler
   .thumb_set __TC5_handler,__common_int_handler
   .weak      __AFEC0_handler
   .thumb_set __AFEC0_handler,__common_int_handler
   .weak      __DACC_handler
   .thumb_set __DACC_handler,__common_int_handler
   .weak      __PWM0_handler
   .thumb_set __PWM0_handler,__common_int_handler
   .weak      __ICM_handler
   .thumb_set __ICM_handler,__common_int_handler
   .weak      __ACC_handler
   .thumb_set __ACC_handler,__common_int_handler
   .weak      __USBHS_handler
   .thumb_set __USBHS_handler,__common_int_handler
   .weak      __MCAN0_INT0_handler
   .thumb_set __MCAN0_INT0_handler,__common_int_handler
   .weak      __MCAN0_INT1_handler
   .thumb_set __MCAN0_INT1_handler,__common_int_handler
   .weak      __MCAN1_INT0_handler
   .thumb_set __MCAN1_INT0_handler,__common_int_handler
   .weak      __MCAN1_INT1_handler
   .thumb_set __MCAN1_INT1_handler,__common_int_handler
   .weak      __AFEC1_handler
   .thumb_set __AFEC1_handler,__common_int_handler
   .weak      __QSPI_handler
   .thumb_set __QSPI_handler,__common_int_handler
   .weak      __UART2_handler
   .thumb_set __UART2_handler,__common_int_handler
   .weak      __TC6_handler
   .thumb_set __TC6_handler,__common_int_handler
   .weak      __TC7_handler
   .thumb_set __TC7_handler,__common_int_handler
   .weak      __TC8_handler
   .thumb_set __TC8_handler,__common_int_handler
   .weak      __TC9_handler
   .thumb_set __TC9_handler,__common_int_handler
   .weak      __TC10_handler
   .thumb_set __TC10_handler,__common_int_handler
   .weak      __TC11_handler
   .thumb_set __TC11_handler,__common_int_handler
   .weak      __MLB_handler
   .thumb_set __MLB_handler,__common_int_handler
   .weak      __AES_handler
   .thumb_set __AES_handler,__common_int_handler
   .weak      __TRNG_handler
   .thumb_set __TRNG_handler,__common_int_handler
   .weak      __XDMAC_handler
   .thumb_set __XDMAC_handler,__common_int_handler
   .weak      __ISI_handler
   .thumb_set __ISI_handler,__common_int_handler
   .weak      __PWM1_handler
   .thumb_set __PWM1_handler,__common_int_handler
   .weak      __FPU_handler
   .thumb_set __FPU_handler,__common_int_handler
   .weak      __RSWDT_handler
   .thumb_set __RSWDT_handler,__common_int_handler
   .weak      __CCW_handler
   .thumb_set __CCW_handler,__common_int_handler
   .weak      __CCF_handler
   .thumb_set __CCF_handler,__common_int_handler
   .weak      __IXC_handler
   .thumb_set __IXC_handler,__common_int_handler

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