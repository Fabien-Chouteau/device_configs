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
        .word __RTC_handler /* 2 */
        .word __RTC_S_handler /* 3 */
        .word __TAMP_handler /* 4 */
        .word __RAMCFG_handler /* 5 */
        .word __FLASH_handler /* 6 */
        .word __FLASH_S_handler /* 7 */
        .word __GTZC_handler /* 8 */
        .word __RCC_handler /* 9 */
        .word __RCC_S_handler /* 10 */
        .word __EXTI0_handler /* 11 */
        .word __EXTI1_handler /* 12 */
        .word __EXTI2_handler /* 13 */
        .word __EXTI3_handler /* 14 */
        .word __EXTI4_handler /* 15 */
        .word __EXTI5_handler /* 16 */
        .word __EXTI6_handler /* 17 */
        .word __EXTI7_handler /* 18 */
        .word __EXTI8_handler /* 19 */
        .word __EXTI9_handler /* 20 */
        .word __EXTI10_handler /* 21 */
        .word __EXTI11_handler /* 22 */
        .word __EXTI12_handler /* 23 */
        .word __EXTI13_handler /* 24 */
        .word __EXTI14_handler /* 25 */
        .word __EXTI15_handler /* 26 */
        .word __IWDG_handler /* 27 */
        .word __unknown_interrupt_handler /* 28 */
        .word __GPDMA1_Channel0_handler /* 29 */
        .word __GPDMA1_Channel1_handler /* 30 */
        .word __GPDMA1_Channel2_handler /* 31 */
        .word __GPDMA1_Channel3_handler /* 32 */
        .word __GPDMA1_Channel4_handler /* 33 */
        .word __GPDMA1_Channel5_handler /* 34 */
        .word __GPDMA1_Channel6_handler /* 35 */
        .word __GPDMA1_Channel7_handler /* 36 */
        .word __ADC1_handler /* 37 */
        .word __DAC1_handler /* 38 */
        .word __FDCAN1_IT0_handler /* 39 */
        .word __FDCAN1_IT1_handler /* 40 */
        .word __TIM1_BRK_handler /* 41 */
        .word __TIM1_UP_handler /* 42 */
        .word __TIM1_TRG_COM_handler /* 43 */
        .word __TIM1_CC_handler /* 44 */
        .word __TIM2_handler /* 45 */
        .word __TIM3_handler /* 46 */
        .word __TIM4_handler /* 47 */
        .word __TIM5_handler /* 48 */
        .word __TIM6_handler /* 49 */
        .word __TIM7_handler /* 50 */
        .word __TIM8_BRK_handler /* 51 */
        .word __TIM8_UP_handler /* 52 */
        .word __TIM8_TRG_COM_handler /* 53 */
        .word __TIM8_CC_handler /* 54 */
        .word __I2C1_EV_handler /* 55 */
        .word __I2C1_ER_handler /* 56 */
        .word __I2C2_EV_handler /* 57 */
        .word __I2C2_ER_handler /* 58 */
        .word __SPI1_handler /* 59 */
        .word __SPI2_handler /* 60 */
        .word __USART1_handler /* 61 */
        .word __USART2_handler /* 62 */
        .word __USART3_handler /* 63 */
        .word __UART4_handler /* 64 */
        .word __UART5_handler /* 65 */
        .word __LPUART1_handler /* 66 */
        .word __LPTIM1_handler /* 67 */
        .word __LPTIM2_handler /* 68 */
        .word __TIM15_handler /* 69 */
        .word __TIM16_handler /* 70 */
        .word __TIM17_handler /* 71 */
        .word __COMP_handler /* 72 */
        .word __OTG_FS_handler /* 73 */
        .word __CRS_handler /* 74 */
        .word __FMC_handler /* 75 */
        .word __OCTOSPI1_handler /* 76 */
        .word __PWR_S3WU_handler /* 77 */
        .word __SDMMC1_handler /* 78 */
        .word __SDMMC2_handler /* 79 */
        .word __GPDMA1_Channel8_handler /* 80 */
        .word __GPDMA1_Channel9_handler /* 81 */
        .word __GPDMA1_Channel10_handler /* 82 */
        .word __GPDMA1_Channel11_handler /* 83 */
        .word __GPDMA1_Channel12_handler /* 84 */
        .word __GPDMA1_Channel13_handler /* 85 */
        .word __GPDMA1_Channel14_handler /* 86 */
        .word __GPDMA1_Channel15_handler /* 87 */
        .word __I2C3_EV_handler /* 88 */
        .word __I2C3_ER_handler /* 89 */
        .word __SAI1_handler /* 90 */
        .word __SAI2_handler /* 91 */
        .word __TSC_handler /* 92 */
        .word __unknown_interrupt_handler /* 93 */
        .word __RNG_handler /* 94 */
        .word __FPU_handler /* 95 */
        .word __HASH_handler /* 96 */
        .word __unknown_interrupt_handler /* 97 */
        .word __LPTIM3_handler /* 98 */
        .word __SPI3_handler /* 99 */
        .word __I2C4_ER_handler /* 100 */
        .word __I2C4_EV_handler /* 101 */
        .word __MDF1_FLT0_handler /* 102 */
        .word __MDF1_FLT1_handler /* 103 */
        .word __MDF1_FLT2_handler /* 104 */
        .word __MDF1_FLT3_handler /* 105 */
        .word __UCPD1_handler /* 106 */
        .word __ICACHE_handler /* 107 */
        .word __unknown_interrupt_handler /* 108 */
        .word __unknown_interrupt_handler /* 109 */
        .word __LPTIM4_handler /* 110 */
        .word __DCACHE1_handler /* 111 */
        .word __ADF1_handler /* 112 */
        .word __ADC4_handler /* 113 */
        .word __LPDMA1_Channel0_handler /* 114 */
        .word __LPDMA1_Channel1_handler /* 115 */
        .word __LPDMA1_Channel2_handler /* 116 */
        .word __LPDMA1_Channel3_handler /* 117 */
        .word __DMA2D_handler /* 118 */
        .word __DCMI_PSSI_handler /* 119 */
        .word __OCTOSPI2_handler /* 120 */
        .word __MDF1_FLT4_handler /* 121 */
        .word __MDF1_FLT5_handler /* 122 */
        .word __CORDIC_handler /* 123 */
        .word __FMAC_handler /* 124 */

   .weak      __WWDG_handler
   .thumb_set __WWDG_handler,__common_int_handler
   .weak      __PVD_PVM_handler
   .thumb_set __PVD_PVM_handler,__common_int_handler
   .weak      __RTC_handler
   .thumb_set __RTC_handler,__common_int_handler
   .weak      __RTC_S_handler
   .thumb_set __RTC_S_handler,__common_int_handler
   .weak      __TAMP_handler
   .thumb_set __TAMP_handler,__common_int_handler
   .weak      __RAMCFG_handler
   .thumb_set __RAMCFG_handler,__common_int_handler
   .weak      __FLASH_handler
   .thumb_set __FLASH_handler,__common_int_handler
   .weak      __FLASH_S_handler
   .thumb_set __FLASH_S_handler,__common_int_handler
   .weak      __GTZC_handler
   .thumb_set __GTZC_handler,__common_int_handler
   .weak      __RCC_handler
   .thumb_set __RCC_handler,__common_int_handler
   .weak      __RCC_S_handler
   .thumb_set __RCC_S_handler,__common_int_handler
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
   .weak      __EXTI5_handler
   .thumb_set __EXTI5_handler,__common_int_handler
   .weak      __EXTI6_handler
   .thumb_set __EXTI6_handler,__common_int_handler
   .weak      __EXTI7_handler
   .thumb_set __EXTI7_handler,__common_int_handler
   .weak      __EXTI8_handler
   .thumb_set __EXTI8_handler,__common_int_handler
   .weak      __EXTI9_handler
   .thumb_set __EXTI9_handler,__common_int_handler
   .weak      __EXTI10_handler
   .thumb_set __EXTI10_handler,__common_int_handler
   .weak      __EXTI11_handler
   .thumb_set __EXTI11_handler,__common_int_handler
   .weak      __EXTI12_handler
   .thumb_set __EXTI12_handler,__common_int_handler
   .weak      __EXTI13_handler
   .thumb_set __EXTI13_handler,__common_int_handler
   .weak      __EXTI14_handler
   .thumb_set __EXTI14_handler,__common_int_handler
   .weak      __EXTI15_handler
   .thumb_set __EXTI15_handler,__common_int_handler
   .weak      __IWDG_handler
   .thumb_set __IWDG_handler,__common_int_handler
   .weak      __GPDMA1_Channel0_handler
   .thumb_set __GPDMA1_Channel0_handler,__common_int_handler
   .weak      __GPDMA1_Channel1_handler
   .thumb_set __GPDMA1_Channel1_handler,__common_int_handler
   .weak      __GPDMA1_Channel2_handler
   .thumb_set __GPDMA1_Channel2_handler,__common_int_handler
   .weak      __GPDMA1_Channel3_handler
   .thumb_set __GPDMA1_Channel3_handler,__common_int_handler
   .weak      __GPDMA1_Channel4_handler
   .thumb_set __GPDMA1_Channel4_handler,__common_int_handler
   .weak      __GPDMA1_Channel5_handler
   .thumb_set __GPDMA1_Channel5_handler,__common_int_handler
   .weak      __GPDMA1_Channel6_handler
   .thumb_set __GPDMA1_Channel6_handler,__common_int_handler
   .weak      __GPDMA1_Channel7_handler
   .thumb_set __GPDMA1_Channel7_handler,__common_int_handler
   .weak      __ADC1_handler
   .thumb_set __ADC1_handler,__common_int_handler
   .weak      __DAC1_handler
   .thumb_set __DAC1_handler,__common_int_handler
   .weak      __FDCAN1_IT0_handler
   .thumb_set __FDCAN1_IT0_handler,__common_int_handler
   .weak      __FDCAN1_IT1_handler
   .thumb_set __FDCAN1_IT1_handler,__common_int_handler
   .weak      __TIM1_BRK_handler
   .thumb_set __TIM1_BRK_handler,__common_int_handler
   .weak      __TIM1_UP_handler
   .thumb_set __TIM1_UP_handler,__common_int_handler
   .weak      __TIM1_TRG_COM_handler
   .thumb_set __TIM1_TRG_COM_handler,__common_int_handler
   .weak      __TIM1_CC_handler
   .thumb_set __TIM1_CC_handler,__common_int_handler
   .weak      __TIM2_handler
   .thumb_set __TIM2_handler,__common_int_handler
   .weak      __TIM3_handler
   .thumb_set __TIM3_handler,__common_int_handler
   .weak      __TIM4_handler
   .thumb_set __TIM4_handler,__common_int_handler
   .weak      __TIM5_handler
   .thumb_set __TIM5_handler,__common_int_handler
   .weak      __TIM6_handler
   .thumb_set __TIM6_handler,__common_int_handler
   .weak      __TIM7_handler
   .thumb_set __TIM7_handler,__common_int_handler
   .weak      __TIM8_BRK_handler
   .thumb_set __TIM8_BRK_handler,__common_int_handler
   .weak      __TIM8_UP_handler
   .thumb_set __TIM8_UP_handler,__common_int_handler
   .weak      __TIM8_TRG_COM_handler
   .thumb_set __TIM8_TRG_COM_handler,__common_int_handler
   .weak      __TIM8_CC_handler
   .thumb_set __TIM8_CC_handler,__common_int_handler
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
   .weak      __UART4_handler
   .thumb_set __UART4_handler,__common_int_handler
   .weak      __UART5_handler
   .thumb_set __UART5_handler,__common_int_handler
   .weak      __LPUART1_handler
   .thumb_set __LPUART1_handler,__common_int_handler
   .weak      __LPTIM1_handler
   .thumb_set __LPTIM1_handler,__common_int_handler
   .weak      __LPTIM2_handler
   .thumb_set __LPTIM2_handler,__common_int_handler
   .weak      __TIM15_handler
   .thumb_set __TIM15_handler,__common_int_handler
   .weak      __TIM16_handler
   .thumb_set __TIM16_handler,__common_int_handler
   .weak      __TIM17_handler
   .thumb_set __TIM17_handler,__common_int_handler
   .weak      __COMP_handler
   .thumb_set __COMP_handler,__common_int_handler
   .weak      __OTG_FS_handler
   .thumb_set __OTG_FS_handler,__common_int_handler
   .weak      __CRS_handler
   .thumb_set __CRS_handler,__common_int_handler
   .weak      __FMC_handler
   .thumb_set __FMC_handler,__common_int_handler
   .weak      __OCTOSPI1_handler
   .thumb_set __OCTOSPI1_handler,__common_int_handler
   .weak      __PWR_S3WU_handler
   .thumb_set __PWR_S3WU_handler,__common_int_handler
   .weak      __SDMMC1_handler
   .thumb_set __SDMMC1_handler,__common_int_handler
   .weak      __SDMMC2_handler
   .thumb_set __SDMMC2_handler,__common_int_handler
   .weak      __GPDMA1_Channel8_handler
   .thumb_set __GPDMA1_Channel8_handler,__common_int_handler
   .weak      __GPDMA1_Channel9_handler
   .thumb_set __GPDMA1_Channel9_handler,__common_int_handler
   .weak      __GPDMA1_Channel10_handler
   .thumb_set __GPDMA1_Channel10_handler,__common_int_handler
   .weak      __GPDMA1_Channel11_handler
   .thumb_set __GPDMA1_Channel11_handler,__common_int_handler
   .weak      __GPDMA1_Channel12_handler
   .thumb_set __GPDMA1_Channel12_handler,__common_int_handler
   .weak      __GPDMA1_Channel13_handler
   .thumb_set __GPDMA1_Channel13_handler,__common_int_handler
   .weak      __GPDMA1_Channel14_handler
   .thumb_set __GPDMA1_Channel14_handler,__common_int_handler
   .weak      __GPDMA1_Channel15_handler
   .thumb_set __GPDMA1_Channel15_handler,__common_int_handler
   .weak      __I2C3_EV_handler
   .thumb_set __I2C3_EV_handler,__common_int_handler
   .weak      __I2C3_ER_handler
   .thumb_set __I2C3_ER_handler,__common_int_handler
   .weak      __SAI1_handler
   .thumb_set __SAI1_handler,__common_int_handler
   .weak      __SAI2_handler
   .thumb_set __SAI2_handler,__common_int_handler
   .weak      __TSC_handler
   .thumb_set __TSC_handler,__common_int_handler
   .weak      __RNG_handler
   .thumb_set __RNG_handler,__common_int_handler
   .weak      __FPU_handler
   .thumb_set __FPU_handler,__common_int_handler
   .weak      __HASH_handler
   .thumb_set __HASH_handler,__common_int_handler
   .weak      __LPTIM3_handler
   .thumb_set __LPTIM3_handler,__common_int_handler
   .weak      __SPI3_handler
   .thumb_set __SPI3_handler,__common_int_handler
   .weak      __I2C4_ER_handler
   .thumb_set __I2C4_ER_handler,__common_int_handler
   .weak      __I2C4_EV_handler
   .thumb_set __I2C4_EV_handler,__common_int_handler
   .weak      __MDF1_FLT0_handler
   .thumb_set __MDF1_FLT0_handler,__common_int_handler
   .weak      __MDF1_FLT1_handler
   .thumb_set __MDF1_FLT1_handler,__common_int_handler
   .weak      __MDF1_FLT2_handler
   .thumb_set __MDF1_FLT2_handler,__common_int_handler
   .weak      __MDF1_FLT3_handler
   .thumb_set __MDF1_FLT3_handler,__common_int_handler
   .weak      __UCPD1_handler
   .thumb_set __UCPD1_handler,__common_int_handler
   .weak      __ICACHE_handler
   .thumb_set __ICACHE_handler,__common_int_handler
   .weak      __LPTIM4_handler
   .thumb_set __LPTIM4_handler,__common_int_handler
   .weak      __DCACHE1_handler
   .thumb_set __DCACHE1_handler,__common_int_handler
   .weak      __ADF1_handler
   .thumb_set __ADF1_handler,__common_int_handler
   .weak      __ADC4_handler
   .thumb_set __ADC4_handler,__common_int_handler
   .weak      __LPDMA1_Channel0_handler
   .thumb_set __LPDMA1_Channel0_handler,__common_int_handler
   .weak      __LPDMA1_Channel1_handler
   .thumb_set __LPDMA1_Channel1_handler,__common_int_handler
   .weak      __LPDMA1_Channel2_handler
   .thumb_set __LPDMA1_Channel2_handler,__common_int_handler
   .weak      __LPDMA1_Channel3_handler
   .thumb_set __LPDMA1_Channel3_handler,__common_int_handler
   .weak      __DMA2D_handler
   .thumb_set __DMA2D_handler,__common_int_handler
   .weak      __DCMI_PSSI_handler
   .thumb_set __DCMI_PSSI_handler,__common_int_handler
   .weak      __OCTOSPI2_handler
   .thumb_set __OCTOSPI2_handler,__common_int_handler
   .weak      __MDF1_FLT4_handler
   .thumb_set __MDF1_FLT4_handler,__common_int_handler
   .weak      __MDF1_FLT5_handler
   .thumb_set __MDF1_FLT5_handler,__common_int_handler
   .weak      __CORDIC_handler
   .thumb_set __CORDIC_handler,__common_int_handler
   .weak      __FMAC_handler
   .thumb_set __FMAC_handler,__common_int_handler

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

	/* Copy .sram2_data */
	.thumb_func
_startup_copy_sram2_data:
	ldr	r0,=__sram2_data_start
	ldr	r1,=__sram2_data_words
	ldr	r2,=__sram2_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_sram2_data, . - _startup_copy_sram2_data

	/* Copy .sram3_data */
	.thumb_func
_startup_copy_sram3_data:
	ldr	r0,=__sram3_data_start
	ldr	r1,=__sram3_data_words
	ldr	r2,=__sram3_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_sram3_data, . - _startup_copy_sram3_data

	/* Copy .sram4_data */
	.thumb_func
_startup_copy_sram4_data:
	ldr	r0,=__sram4_data_start
	ldr	r1,=__sram4_data_words
	ldr	r2,=__sram4_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_sram4_data, . - _startup_copy_sram4_data

	/* Copy .bkpsram_data */
	.thumb_func
_startup_copy_bkpsram_data:
	ldr	r0,=__bkpsram_data_start
	ldr	r1,=__bkpsram_data_words
	ldr	r2,=__bkpsram_data_load
	cmp     r1,#0
	beq     1f
0:	ldr	r4,[r2]
	str	r4,[r0]
        adds    r2,#4
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_copy_bkpsram_data, . - _startup_copy_bkpsram_data

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

	/* Clear .sram2_bss */
	.thumb_func
_startup_clear_sram2_bss:
	ldr	r0,=__sram2_bss_start
	ldr	r1,=__sram2_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_sram2_bss, . - _startup_clear_sram2_bss


	/* Clear .sram3_bss */
	.thumb_func
_startup_clear_sram3_bss:
	ldr	r0,=__sram3_bss_start
	ldr	r1,=__sram3_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_sram3_bss, . - _startup_clear_sram3_bss


	/* Clear .sram4_bss */
	.thumb_func
_startup_clear_sram4_bss:
	ldr	r0,=__sram4_bss_start
	ldr	r1,=__sram4_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_sram4_bss, . - _startup_clear_sram4_bss


	/* Clear .bkpsram_bss */
	.thumb_func
_startup_clear_bkpsram_bss:
	ldr	r0,=__bkpsram_bss_start
	ldr	r1,=__bkpsram_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_bkpsram_bss, . - _startup_clear_bkpsram_bss


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