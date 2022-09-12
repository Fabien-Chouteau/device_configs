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
        .word __PVD_AVD_handler /* 1 */
        .word __TAMP_STAMP_handler /* 2 */
        .word __RTC_WKUP_handler /* 3 */
        .word __FLASH_handler /* 4 */
        .word __RCC_handler /* 5 */
        .word __EXTI0_handler /* 6 */
        .word __EXTI1_handler /* 7 */
        .word __EXTI2_handler /* 8 */
        .word __EXTI3_handler /* 9 */
        .word __EXTI4_handler /* 10 */
        .word __DMA1_Stream0_handler /* 11 */
        .word __DMA1_Stream1_handler /* 12 */
        .word __DMA1_Stream2_handler /* 13 */
        .word __DMA1_Stream3_handler /* 14 */
        .word __DMA1_Stream4_handler /* 15 */
        .word __DMA1_Stream5_handler /* 16 */
        .word __DMA1_Stream6_handler /* 17 */
        .word __ADC_handler /* 18 */
        .word __FDCAN1_IT0_handler /* 19 */
        .word __FDCAN2_IT0_handler /* 20 */
        .word __FDCAN1_IT1_handler /* 21 */
        .word __FDCAN2_IT1_handler /* 22 */
        .word __EXTI9_5_handler /* 23 */
        .word __TIM1_BRK_handler /* 24 */
        .word __TIM1_UP_handler /* 25 */
        .word __TIM1_TRG_COM_handler /* 26 */
        .word __TIM1_CC_handler /* 27 */
        .word __TIM2_handler /* 28 */
        .word __TIM3_handler /* 29 */
        .word __TIM4_handler /* 30 */
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
        .word __TIM8_BRK_TIM12_handler /* 43 */
        .word __TIM8_UP_TIM13_handler /* 44 */
        .word __TIM8_TRG_COM_TIM14_handler /* 45 */
        .word __TIM8_CC_handler /* 46 */
        .word __DMA1_Stream7_handler /* 47 */
        .word __FMC_handler /* 48 */
        .word __SDMMC1_handler /* 49 */
        .word __TIM5_handler /* 50 */
        .word __SPI3_handler /* 51 */
        .word __UART4_handler /* 52 */
        .word __UART5_handler /* 53 */
        .word __TIM6_DAC_handler /* 54 */
        .word __TIM7_handler /* 55 */
        .word __DMA2_Stream0_handler /* 56 */
        .word __DMA2_Stream1_handler /* 57 */
        .word __DMA2_Stream2_handler /* 58 */
        .word __DMA2_Stream3_handler /* 59 */
        .word __DMA2_Stream4_handler /* 60 */
        .word __ETH_handler /* 61 */
        .word __ETH_WKUP_handler /* 62 */
        .word __FDCAN_CAL_handler /* 63 */
        .word __unknown_interrupt_handler /* 64 */
        .word __unknown_interrupt_handler /* 65 */
        .word __unknown_interrupt_handler /* 66 */
        .word __unknown_interrupt_handler /* 67 */
        .word __DMA2_Stream5_handler /* 68 */
        .word __DMA2_Stream6_handler /* 69 */
        .word __DMA2_Stream7_handler /* 70 */
        .word __USART6_handler /* 71 */
        .word __I2C3_EV_handler /* 72 */
        .word __I2C3_ER_handler /* 73 */
        .word __OTG_HS_EP1_OUT_handler /* 74 */
        .word __OTG_HS_EP1_IN_handler /* 75 */
        .word __OTG_HS_WKUP_handler /* 76 */
        .word __OTG_HS_handler /* 77 */
        .word __DCMI_handler /* 78 */
        .word __unknown_interrupt_handler /* 79 */
        .word __unknown_interrupt_handler /* 80 */
        .word __FPU_handler /* 81 */
        .word __UART7_handler /* 82 */
        .word __UART8_handler /* 83 */
        .word __SPI4_handler /* 84 */
        .word __SPI5_handler /* 85 */
        .word __SPI6_handler /* 86 */
        .word __SAI1_handler /* 87 */
        .word __LTDC_handler /* 88 */
        .word __LTDC_ER_handler /* 89 */
        .word __DMA2D_handler /* 90 */
        .word __SAI2_handler /* 91 */
        .word __QUADSPI_handler /* 92 */
        .word __LPTIM1_handler /* 93 */
        .word __CEC_handler /* 94 */
        .word __I2C4_EV_handler /* 95 */
        .word __I2C4_ER_handler /* 96 */
        .word __SPDIF_RX_handler /* 97 */
        .word __OTG_FS_EP1_OUT_handler /* 98 */
        .word __OTG_FS_EP1_IN_handler /* 99 */
        .word __OTG_FS_WKUP_handler /* 100 */
        .word __OTG_FS_handler /* 101 */
        .word __DMAMUX1_OVR_handler /* 102 */
        .word __HRTIM1_Master_handler /* 103 */
        .word __HRTIM1_TIMA_handler /* 104 */
        .word __HRTIM1_TIMB_handler /* 105 */
        .word __HRTIM1_TIMC_handler /* 106 */
        .word __HRTIM1_TIMD_handler /* 107 */
        .word __HRTIM1_TIME_handler /* 108 */
        .word __HRTIM1_FLT_handler /* 109 */
        .word __DFSDM1_FLT0_handler /* 110 */
        .word __DFSDM1_FLT1_handler /* 111 */
        .word __DFSDM1_FLT2_handler /* 112 */
        .word __DFSDM1_FLT3_handler /* 113 */
        .word __SAI3_handler /* 114 */
        .word __SWPMI1_handler /* 115 */
        .word __TIM15_handler /* 116 */
        .word __TIM16_handler /* 117 */
        .word __TIM17_handler /* 118 */
        .word __MDIOS_WKUP_handler /* 119 */
        .word __MDIOS_handler /* 120 */
        .word __JPEG_handler /* 121 */
        .word __MDMA_handler /* 122 */
        .word __unknown_interrupt_handler /* 123 */
        .word __SDMMC2_handler /* 124 */
        .word __HSEM1_handler /* 125 */
        .word __unknown_interrupt_handler /* 126 */
        .word __ADC3_handler /* 127 */
        .word __DMAMUX2_OVR_handler /* 128 */
        .word __BDMA_Channel0_handler /* 129 */
        .word __BDMA_Channel1_handler /* 130 */
        .word __BDMA_Channel2_handler /* 131 */
        .word __BDMA_Channel3_handler /* 132 */
        .word __BDMA_Channel4_handler /* 133 */
        .word __BDMA_Channel5_handler /* 134 */
        .word __BDMA_Channel6_handler /* 135 */
        .word __BDMA_Channel7_handler /* 136 */
        .word __COMP_handler /* 137 */
        .word __LPTIM2_handler /* 138 */
        .word __LPTIM3_handler /* 139 */
        .word __LPTIM4_handler /* 140 */
        .word __LPTIM5_handler /* 141 */
        .word __LPUART1_handler /* 142 */
        .word __unknown_interrupt_handler /* 143 */
        .word __CRS_handler /* 144 */
        .word __ECC_handler /* 145 */
        .word __SAI4_handler /* 146 */
        .word __unknown_interrupt_handler /* 147 */
        .word __unknown_interrupt_handler /* 148 */
        .word __WAKEUP_PIN_handler /* 149 */

   .weak      __WWDG_handler
   .thumb_set __WWDG_handler,__common_int_handler
   .weak      __PVD_AVD_handler
   .thumb_set __PVD_AVD_handler,__common_int_handler
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
   .weak      __DMA1_Stream0_handler
   .thumb_set __DMA1_Stream0_handler,__common_int_handler
   .weak      __DMA1_Stream1_handler
   .thumb_set __DMA1_Stream1_handler,__common_int_handler
   .weak      __DMA1_Stream2_handler
   .thumb_set __DMA1_Stream2_handler,__common_int_handler
   .weak      __DMA1_Stream3_handler
   .thumb_set __DMA1_Stream3_handler,__common_int_handler
   .weak      __DMA1_Stream4_handler
   .thumb_set __DMA1_Stream4_handler,__common_int_handler
   .weak      __DMA1_Stream5_handler
   .thumb_set __DMA1_Stream5_handler,__common_int_handler
   .weak      __DMA1_Stream6_handler
   .thumb_set __DMA1_Stream6_handler,__common_int_handler
   .weak      __ADC_handler
   .thumb_set __ADC_handler,__common_int_handler
   .weak      __FDCAN1_IT0_handler
   .thumb_set __FDCAN1_IT0_handler,__common_int_handler
   .weak      __FDCAN2_IT0_handler
   .thumb_set __FDCAN2_IT0_handler,__common_int_handler
   .weak      __FDCAN1_IT1_handler
   .thumb_set __FDCAN1_IT1_handler,__common_int_handler
   .weak      __FDCAN2_IT1_handler
   .thumb_set __FDCAN2_IT1_handler,__common_int_handler
   .weak      __EXTI9_5_handler
   .thumb_set __EXTI9_5_handler,__common_int_handler
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
   .weak      __TIM8_BRK_TIM12_handler
   .thumb_set __TIM8_BRK_TIM12_handler,__common_int_handler
   .weak      __TIM8_UP_TIM13_handler
   .thumb_set __TIM8_UP_TIM13_handler,__common_int_handler
   .weak      __TIM8_TRG_COM_TIM14_handler
   .thumb_set __TIM8_TRG_COM_TIM14_handler,__common_int_handler
   .weak      __TIM8_CC_handler
   .thumb_set __TIM8_CC_handler,__common_int_handler
   .weak      __DMA1_Stream7_handler
   .thumb_set __DMA1_Stream7_handler,__common_int_handler
   .weak      __FMC_handler
   .thumb_set __FMC_handler,__common_int_handler
   .weak      __SDMMC1_handler
   .thumb_set __SDMMC1_handler,__common_int_handler
   .weak      __TIM5_handler
   .thumb_set __TIM5_handler,__common_int_handler
   .weak      __SPI3_handler
   .thumb_set __SPI3_handler,__common_int_handler
   .weak      __UART4_handler
   .thumb_set __UART4_handler,__common_int_handler
   .weak      __UART5_handler
   .thumb_set __UART5_handler,__common_int_handler
   .weak      __TIM6_DAC_handler
   .thumb_set __TIM6_DAC_handler,__common_int_handler
   .weak      __TIM7_handler
   .thumb_set __TIM7_handler,__common_int_handler
   .weak      __DMA2_Stream0_handler
   .thumb_set __DMA2_Stream0_handler,__common_int_handler
   .weak      __DMA2_Stream1_handler
   .thumb_set __DMA2_Stream1_handler,__common_int_handler
   .weak      __DMA2_Stream2_handler
   .thumb_set __DMA2_Stream2_handler,__common_int_handler
   .weak      __DMA2_Stream3_handler
   .thumb_set __DMA2_Stream3_handler,__common_int_handler
   .weak      __DMA2_Stream4_handler
   .thumb_set __DMA2_Stream4_handler,__common_int_handler
   .weak      __ETH_handler
   .thumb_set __ETH_handler,__common_int_handler
   .weak      __ETH_WKUP_handler
   .thumb_set __ETH_WKUP_handler,__common_int_handler
   .weak      __FDCAN_CAL_handler
   .thumb_set __FDCAN_CAL_handler,__common_int_handler
   .weak      __DMA2_Stream5_handler
   .thumb_set __DMA2_Stream5_handler,__common_int_handler
   .weak      __DMA2_Stream6_handler
   .thumb_set __DMA2_Stream6_handler,__common_int_handler
   .weak      __DMA2_Stream7_handler
   .thumb_set __DMA2_Stream7_handler,__common_int_handler
   .weak      __USART6_handler
   .thumb_set __USART6_handler,__common_int_handler
   .weak      __I2C3_EV_handler
   .thumb_set __I2C3_EV_handler,__common_int_handler
   .weak      __I2C3_ER_handler
   .thumb_set __I2C3_ER_handler,__common_int_handler
   .weak      __OTG_HS_EP1_OUT_handler
   .thumb_set __OTG_HS_EP1_OUT_handler,__common_int_handler
   .weak      __OTG_HS_EP1_IN_handler
   .thumb_set __OTG_HS_EP1_IN_handler,__common_int_handler
   .weak      __OTG_HS_WKUP_handler
   .thumb_set __OTG_HS_WKUP_handler,__common_int_handler
   .weak      __OTG_HS_handler
   .thumb_set __OTG_HS_handler,__common_int_handler
   .weak      __DCMI_handler
   .thumb_set __DCMI_handler,__common_int_handler
   .weak      __FPU_handler
   .thumb_set __FPU_handler,__common_int_handler
   .weak      __UART7_handler
   .thumb_set __UART7_handler,__common_int_handler
   .weak      __UART8_handler
   .thumb_set __UART8_handler,__common_int_handler
   .weak      __SPI4_handler
   .thumb_set __SPI4_handler,__common_int_handler
   .weak      __SPI5_handler
   .thumb_set __SPI5_handler,__common_int_handler
   .weak      __SPI6_handler
   .thumb_set __SPI6_handler,__common_int_handler
   .weak      __SAI1_handler
   .thumb_set __SAI1_handler,__common_int_handler
   .weak      __LTDC_handler
   .thumb_set __LTDC_handler,__common_int_handler
   .weak      __LTDC_ER_handler
   .thumb_set __LTDC_ER_handler,__common_int_handler
   .weak      __DMA2D_handler
   .thumb_set __DMA2D_handler,__common_int_handler
   .weak      __SAI2_handler
   .thumb_set __SAI2_handler,__common_int_handler
   .weak      __QUADSPI_handler
   .thumb_set __QUADSPI_handler,__common_int_handler
   .weak      __LPTIM1_handler
   .thumb_set __LPTIM1_handler,__common_int_handler
   .weak      __CEC_handler
   .thumb_set __CEC_handler,__common_int_handler
   .weak      __I2C4_EV_handler
   .thumb_set __I2C4_EV_handler,__common_int_handler
   .weak      __I2C4_ER_handler
   .thumb_set __I2C4_ER_handler,__common_int_handler
   .weak      __SPDIF_RX_handler
   .thumb_set __SPDIF_RX_handler,__common_int_handler
   .weak      __OTG_FS_EP1_OUT_handler
   .thumb_set __OTG_FS_EP1_OUT_handler,__common_int_handler
   .weak      __OTG_FS_EP1_IN_handler
   .thumb_set __OTG_FS_EP1_IN_handler,__common_int_handler
   .weak      __OTG_FS_WKUP_handler
   .thumb_set __OTG_FS_WKUP_handler,__common_int_handler
   .weak      __OTG_FS_handler
   .thumb_set __OTG_FS_handler,__common_int_handler
   .weak      __DMAMUX1_OVR_handler
   .thumb_set __DMAMUX1_OVR_handler,__common_int_handler
   .weak      __HRTIM1_Master_handler
   .thumb_set __HRTIM1_Master_handler,__common_int_handler
   .weak      __HRTIM1_TIMA_handler
   .thumb_set __HRTIM1_TIMA_handler,__common_int_handler
   .weak      __HRTIM1_TIMB_handler
   .thumb_set __HRTIM1_TIMB_handler,__common_int_handler
   .weak      __HRTIM1_TIMC_handler
   .thumb_set __HRTIM1_TIMC_handler,__common_int_handler
   .weak      __HRTIM1_TIMD_handler
   .thumb_set __HRTIM1_TIMD_handler,__common_int_handler
   .weak      __HRTIM1_TIME_handler
   .thumb_set __HRTIM1_TIME_handler,__common_int_handler
   .weak      __HRTIM1_FLT_handler
   .thumb_set __HRTIM1_FLT_handler,__common_int_handler
   .weak      __DFSDM1_FLT0_handler
   .thumb_set __DFSDM1_FLT0_handler,__common_int_handler
   .weak      __DFSDM1_FLT1_handler
   .thumb_set __DFSDM1_FLT1_handler,__common_int_handler
   .weak      __DFSDM1_FLT2_handler
   .thumb_set __DFSDM1_FLT2_handler,__common_int_handler
   .weak      __DFSDM1_FLT3_handler
   .thumb_set __DFSDM1_FLT3_handler,__common_int_handler
   .weak      __SAI3_handler
   .thumb_set __SAI3_handler,__common_int_handler
   .weak      __SWPMI1_handler
   .thumb_set __SWPMI1_handler,__common_int_handler
   .weak      __TIM15_handler
   .thumb_set __TIM15_handler,__common_int_handler
   .weak      __TIM16_handler
   .thumb_set __TIM16_handler,__common_int_handler
   .weak      __TIM17_handler
   .thumb_set __TIM17_handler,__common_int_handler
   .weak      __MDIOS_WKUP_handler
   .thumb_set __MDIOS_WKUP_handler,__common_int_handler
   .weak      __MDIOS_handler
   .thumb_set __MDIOS_handler,__common_int_handler
   .weak      __JPEG_handler
   .thumb_set __JPEG_handler,__common_int_handler
   .weak      __MDMA_handler
   .thumb_set __MDMA_handler,__common_int_handler
   .weak      __SDMMC2_handler
   .thumb_set __SDMMC2_handler,__common_int_handler
   .weak      __HSEM1_handler
   .thumb_set __HSEM1_handler,__common_int_handler
   .weak      __ADC3_handler
   .thumb_set __ADC3_handler,__common_int_handler
   .weak      __DMAMUX2_OVR_handler
   .thumb_set __DMAMUX2_OVR_handler,__common_int_handler
   .weak      __BDMA_Channel0_handler
   .thumb_set __BDMA_Channel0_handler,__common_int_handler
   .weak      __BDMA_Channel1_handler
   .thumb_set __BDMA_Channel1_handler,__common_int_handler
   .weak      __BDMA_Channel2_handler
   .thumb_set __BDMA_Channel2_handler,__common_int_handler
   .weak      __BDMA_Channel3_handler
   .thumb_set __BDMA_Channel3_handler,__common_int_handler
   .weak      __BDMA_Channel4_handler
   .thumb_set __BDMA_Channel4_handler,__common_int_handler
   .weak      __BDMA_Channel5_handler
   .thumb_set __BDMA_Channel5_handler,__common_int_handler
   .weak      __BDMA_Channel6_handler
   .thumb_set __BDMA_Channel6_handler,__common_int_handler
   .weak      __BDMA_Channel7_handler
   .thumb_set __BDMA_Channel7_handler,__common_int_handler
   .weak      __COMP_handler
   .thumb_set __COMP_handler,__common_int_handler
   .weak      __LPTIM2_handler
   .thumb_set __LPTIM2_handler,__common_int_handler
   .weak      __LPTIM3_handler
   .thumb_set __LPTIM3_handler,__common_int_handler
   .weak      __LPTIM4_handler
   .thumb_set __LPTIM4_handler,__common_int_handler
   .weak      __LPTIM5_handler
   .thumb_set __LPTIM5_handler,__common_int_handler
   .weak      __LPUART1_handler
   .thumb_set __LPUART1_handler,__common_int_handler
   .weak      __CRS_handler
   .thumb_set __CRS_handler,__common_int_handler
   .weak      __ECC_handler
   .thumb_set __ECC_handler,__common_int_handler
   .weak      __SAI4_handler
   .thumb_set __SAI4_handler,__common_int_handler
   .weak      __WAKEUP_PIN_handler
   .thumb_set __WAKEUP_PIN_handler,__common_int_handler

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

	/* Clear .dtcm_bss */
	.thumb_func
_startup_clear_dtcm_bss:
	ldr	r0,=__dtcm_bss_start
	ldr	r1,=__dtcm_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_dtcm_bss, . - _startup_clear_dtcm_bss


	/* Clear .d1_sram_bss */
	.thumb_func
_startup_clear_d1_sram_bss:
	ldr	r0,=__d1_sram_bss_start
	ldr	r1,=__d1_sram_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_d1_sram_bss, . - _startup_clear_d1_sram_bss


	/* Clear .d2_sram1_bss */
	.thumb_func
_startup_clear_d2_sram1_bss:
	ldr	r0,=__d2_sram1_bss_start
	ldr	r1,=__d2_sram1_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_d2_sram1_bss, . - _startup_clear_d2_sram1_bss


	/* Clear .d2_sram2_bss */
	.thumb_func
_startup_clear_d2_sram2_bss:
	ldr	r0,=__d2_sram2_bss_start
	ldr	r1,=__d2_sram2_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_d2_sram2_bss, . - _startup_clear_d2_sram2_bss


	/* Clear .d2_sram3_bss */
	.thumb_func
_startup_clear_d2_sram3_bss:
	ldr	r0,=__d2_sram3_bss_start
	ldr	r1,=__d2_sram3_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_d2_sram3_bss, . - _startup_clear_d2_sram3_bss


	/* Clear .d3_sram_bss */
	.thumb_func
_startup_clear_d3_sram_bss:
	ldr	r0,=__d3_sram_bss_start
	ldr	r1,=__d3_sram_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_d3_sram_bss, . - _startup_clear_d3_sram_bss


	/* Clear .backup_bss */
	.thumb_func
_startup_clear_backup_bss:
	ldr	r0,=__backup_bss_start
	ldr	r1,=__backup_bss_words
	movs	r2,#0
	cmp     r1,#0
	beq     1f
0:	str	r2,[r0]
        adds    r0,#4
	subs	r1,r1,#1
	bne	0b
1:
        .size _startup_clear_backup_bss, . - _startup_clear_backup_bss


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