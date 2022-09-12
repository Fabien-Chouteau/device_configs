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
        .word __WWDG_handler /* 0 */
        .word __PVD_PVM_handler /* 1 */
        .word __TAMP_STAMP_handler /* 2 */
        .word __RTC_WKUP_handler /* 3 */
        .word __FLASH_handler /* 4 */
        .word __RCC_handler /* 5 */
        .word __EXTI0_handler /* 6 */
        .word __EXTI1_handler /* 7 */
        .word __EXTI2_handler /* 8 */
        .word __EXTI3_handler /* 9 */
        .word __EXTI4_handler /* 10 */
        .word __DMA1_Channel1_handler /* 11 */
        .word __DMA1_Channel2_handler /* 12 */
        .word __DMA1_Channel3_handler /* 13 */
        .word __DMA1_Channel4_handler /* 14 */
        .word __DMA1_Channel5_handler /* 15 */
        .word __DMA1_Channel6_handler /* 16 */
        .word __DMA1_Channel7_handler /* 17 */
        .word __ADC1_handler /* 18 */
        .word __CAN1_TX_handler /* 19 */
        .word __CAN1_RX0_handler /* 20 */
        .word __CAN1_RX1_handler /* 21 */
        .word __CAN1_SCE_handler /* 22 */
        .word __EXTI9_5_handler /* 23 */
        .word __TIM1_BRK_TIM15_handler /* 24 */
        .word __TIM1_UP_TIM16_handler /* 25 */
        .word __TIM1_TRG_COM_handler /* 26 */
        .word __TIM1_CC_handler /* 27 */
        .word __TIM2_handler /* 28 */
        .word __unknown_interrupt_handler /* 29 */
        .word __unknown_interrupt_handler /* 30 */
        .word __I2C1_EV_handler /* 31 */
        .word __I2C1_ER_handler /* 32 */
        .word __I2C2_EV_handler /* 33 */
        .word __I2C2_ER_handler /* 34 */
        .word __SPI1_handler /* 35 */
        .word __SPI2_handler /* 36 */
        .word __USART1_handler /* 37 */
        .word __USART2_handler /* 38 */
        .word __USART3_handler /* 39 */
        .word __EXTI15_10_handler /* 40 */
        .word __RTC_Alarm_handler /* 41 */
        .word __unknown_interrupt_handler /* 42 */
        .word __unknown_interrupt_handler /* 43 */
        .word __unknown_interrupt_handler /* 44 */
        .word __unknown_interrupt_handler /* 45 */
        .word __unknown_interrupt_handler /* 46 */
        .word __unknown_interrupt_handler /* 47 */
        .word __unknown_interrupt_handler /* 48 */
        .word __SDMMC1_handler /* 49 */
        .word __unknown_interrupt_handler /* 50 */
        .word __SPI3_handler /* 51 */
        .word __unknown_interrupt_handler /* 52 */
        .word __unknown_interrupt_handler /* 53 */
        .word __TIM6_DAC_handler /* 54 */
        .word __TIM7_handler /* 55 */
        .word __DMA2_Channel1_handler /* 56 */
        .word __DMA2_Channel2_handler /* 57 */
        .word __DMA2_Channel3_handler /* 58 */
        .word __DMA2_Channel4_handler /* 59 */
        .word __DMA2_Channel5_handler /* 60 */
        .word __unknown_interrupt_handler /* 61 */
        .word __unknown_interrupt_handler /* 62 */
        .word __unknown_interrupt_handler /* 63 */
        .word __COMP_handler /* 64 */
        .word __LPTIM1_handler /* 65 */
        .word __LPTIM2_handler /* 66 */
        .word __unknown_interrupt_handler /* 67 */
        .word __DMA2_Channel6_handler /* 68 */
        .word __DMA2_Channel7_handler /* 69 */
        .word __LPUART1_handler /* 70 */
        .word __QUADSPI_handler /* 71 */
        .word __I2C3_EV_handler /* 72 */
        .word __I2C3_ER_handler /* 73 */
        .word __SAI1_handler /* 74 */
        .word __unknown_interrupt_handler /* 75 */
        .word __SWPMI1_handler /* 76 */
        .word __TSC_handler /* 77 */
        .word __unknown_interrupt_handler /* 78 */
        .word __unknown_interrupt_handler /* 79 */
        .word __RNG_handler /* 80 */
        .word __FPU_handler /* 81 */
        .word __CRS_handler /* 82 */

   .weak      __WWDG_handler
   .thumb_set __WWDG_handler,__common_int_handler
   .weak      __PVD_PVM_handler
   .thumb_set __PVD_PVM_handler,__common_int_handler
   .weak      __TAMP_STAMP_handler
   .thumb_set __TAMP_STAMP_handler,__common_int_handler
   .weak      __RTC_WKUP_handler
   .thumb_set __RTC_WKUP_handler,__common_int_handler
   .weak      __FLASH_handler
   .thumb_set __FLASH_handler,__common_int_handler
   .weak      __RCC_handler
   .thumb_set __RCC_handler,__common_int_handler
   .weak      __EXTI0_handler
   .thumb_set __EXTI0_handler,__common_int_handler
   .weak      __EXTI1_handler
   .thumb_set __EXTI1_handler,__common_int_handler
   .weak      __EXTI2_handler
   .thumb_set __EXTI2_handler,__common_int_handler
   .weak      __EXTI3_handler
   .thumb_set __EXTI3_handler,__common_int_handler
   .weak      __EXTI4_handler
   .thumb_set __EXTI4_handler,__common_int_handler
   .weak      __DMA1_Channel1_handler
   .thumb_set __DMA1_Channel1_handler,__common_int_handler
   .weak      __DMA1_Channel2_handler
   .thumb_set __DMA1_Channel2_handler,__common_int_handler
   .weak      __DMA1_Channel3_handler
   .thumb_set __DMA1_Channel3_handler,__common_int_handler
   .weak      __DMA1_Channel4_handler
   .thumb_set __DMA1_Channel4_handler,__common_int_handler
   .weak      __DMA1_Channel5_handler
   .thumb_set __DMA1_Channel5_handler,__common_int_handler
   .weak      __DMA1_Channel6_handler
   .thumb_set __DMA1_Channel6_handler,__common_int_handler
   .weak      __DMA1_Channel7_handler
   .thumb_set __DMA1_Channel7_handler,__common_int_handler
   .weak      __ADC1_handler
   .thumb_set __ADC1_handler,__common_int_handler
   .weak      __CAN1_TX_handler
   .thumb_set __CAN1_TX_handler,__common_int_handler
   .weak      __CAN1_RX0_handler
   .thumb_set __CAN1_RX0_handler,__common_int_handler
   .weak      __CAN1_RX1_handler
   .thumb_set __CAN1_RX1_handler,__common_int_handler
   .weak      __CAN1_SCE_handler
   .thumb_set __CAN1_SCE_handler,__common_int_handler
   .weak      __EXTI9_5_handler
   .thumb_set __EXTI9_5_handler,__common_int_handler
   .weak      __TIM1_BRK_TIM15_handler
   .thumb_set __TIM1_BRK_TIM15_handler,__common_int_handler
   .weak      __TIM1_UP_TIM16_handler
   .thumb_set __TIM1_UP_TIM16_handler,__common_int_handler
   .weak      __TIM1_TRG_COM_handler
   .thumb_set __TIM1_TRG_COM_handler,__common_int_handler
   .weak      __TIM1_CC_handler
   .thumb_set __TIM1_CC_handler,__common_int_handler
   .weak      __TIM2_handler
   .thumb_set __TIM2_handler,__common_int_handler
   .weak      __I2C1_EV_handler
   .thumb_set __I2C1_EV_handler,__common_int_handler
   .weak      __I2C1_ER_handler
   .thumb_set __I2C1_ER_handler,__common_int_handler
   .weak      __I2C2_EV_handler
   .thumb_set __I2C2_EV_handler,__common_int_handler
   .weak      __I2C2_ER_handler
   .thumb_set __I2C2_ER_handler,__common_int_handler
   .weak      __SPI1_handler
   .thumb_set __SPI1_handler,__common_int_handler
   .weak      __SPI2_handler
   .thumb_set __SPI2_handler,__common_int_handler
   .weak      __USART1_handler
   .thumb_set __USART1_handler,__common_int_handler
   .weak      __USART2_handler
   .thumb_set __USART2_handler,__common_int_handler
   .weak      __USART3_handler
   .thumb_set __USART3_handler,__common_int_handler
   .weak      __EXTI15_10_handler
   .thumb_set __EXTI15_10_handler,__common_int_handler
   .weak      __RTC_Alarm_handler
   .thumb_set __RTC_Alarm_handler,__common_int_handler
   .weak      __SDMMC1_handler
   .thumb_set __SDMMC1_handler,__common_int_handler
   .weak      __SPI3_handler
   .thumb_set __SPI3_handler,__common_int_handler
   .weak      __TIM6_DAC_handler
   .thumb_set __TIM6_DAC_handler,__common_int_handler
   .weak      __TIM7_handler
   .thumb_set __TIM7_handler,__common_int_handler
   .weak      __DMA2_Channel1_handler
   .thumb_set __DMA2_Channel1_handler,__common_int_handler
   .weak      __DMA2_Channel2_handler
   .thumb_set __DMA2_Channel2_handler,__common_int_handler
   .weak      __DMA2_Channel3_handler
   .thumb_set __DMA2_Channel3_handler,__common_int_handler
   .weak      __DMA2_Channel4_handler
   .thumb_set __DMA2_Channel4_handler,__common_int_handler
   .weak      __DMA2_Channel5_handler
   .thumb_set __DMA2_Channel5_handler,__common_int_handler
   .weak      __COMP_handler
   .thumb_set __COMP_handler,__common_int_handler
   .weak      __LPTIM1_handler
   .thumb_set __LPTIM1_handler,__common_int_handler
   .weak      __LPTIM2_handler
   .thumb_set __LPTIM2_handler,__common_int_handler
   .weak      __DMA2_Channel6_handler
   .thumb_set __DMA2_Channel6_handler,__common_int_handler
   .weak      __DMA2_Channel7_handler
   .thumb_set __DMA2_Channel7_handler,__common_int_handler
   .weak      __LPUART1_handler
   .thumb_set __LPUART1_handler,__common_int_handler
   .weak      __QUADSPI_handler
   .thumb_set __QUADSPI_handler,__common_int_handler
   .weak      __I2C3_EV_handler
   .thumb_set __I2C3_EV_handler,__common_int_handler
   .weak      __I2C3_ER_handler
   .thumb_set __I2C3_ER_handler,__common_int_handler
   .weak      __SAI1_handler
   .thumb_set __SAI1_handler,__common_int_handler
   .weak      __SWPMI1_handler
   .thumb_set __SWPMI1_handler,__common_int_handler
   .weak      __TSC_handler
   .thumb_set __TSC_handler,__common_int_handler
   .weak      __RNG_handler
   .thumb_set __RNG_handler,__common_int_handler
   .weak      __FPU_handler
   .thumb_set __FPU_handler,__common_int_handler
   .weak      __CRS_handler
   .thumb_set __CRS_handler,__common_int_handler

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

	/* Copy .sram1_data */
	.thumb_func
_startup_copy_sram1_data:
	ldr	r0,=__sram1_data_start
	ldr	r1,=__sram1_data_words
	ldr	r2,=__sram1_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_sram1_data, . - _startup_copy_sram1_data

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

	/* Clear .sram1_bss */
	.thumb_func
_startup_clear_sram1_bss:
	ldr	r0,=__sram1_bss_start
	ldr	r1,=__sram1_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_sram1_bss, . - _startup_clear_sram1_bss


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