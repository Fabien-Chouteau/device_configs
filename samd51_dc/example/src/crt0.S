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
        .word __PM_handler /* 0 */
        .word __MCLK_handler /* 1 */
        .word __OSCCTRL_XOSC0_handler /* 2 */
        .word __OSCCTRL_XOSC1_handler /* 3 */
        .word __OSCCTRL_DFLL_handler /* 4 */
        .word __OSCCTRL_DPLL0_handler /* 5 */
        .word __OSCCTRL_DPLL1_handler /* 6 */
        .word __OSC32KCTRL_handler /* 7 */
        .word __SUPC_OTHER_handler /* 8 */
        .word __SUPC_BODDET_handler /* 9 */
        .word __WDT_handler /* 10 */
        .word __RTC_handler /* 11 */
        .word __EIC_EXTINT_0_handler /* 12 */
        .word __EIC_EXTINT_1_handler /* 13 */
        .word __EIC_EXTINT_2_handler /* 14 */
        .word __EIC_EXTINT_3_handler /* 15 */
        .word __EIC_EXTINT_4_handler /* 16 */
        .word __EIC_EXTINT_5_handler /* 17 */
        .word __EIC_EXTINT_6_handler /* 18 */
        .word __EIC_EXTINT_7_handler /* 19 */
        .word __EIC_EXTINT_8_handler /* 20 */
        .word __EIC_EXTINT_9_handler /* 21 */
        .word __EIC_EXTINT_10_handler /* 22 */
        .word __EIC_EXTINT_11_handler /* 23 */
        .word __EIC_EXTINT_12_handler /* 24 */
        .word __EIC_EXTINT_13_handler /* 25 */
        .word __EIC_EXTINT_14_handler /* 26 */
        .word __EIC_EXTINT_15_handler /* 27 */
        .word __FREQM_handler /* 28 */
        .word __NVMCTRL_0_handler /* 29 */
        .word __NVMCTRL_1_handler /* 30 */
        .word __DMAC_0_handler /* 31 */
        .word __DMAC_1_handler /* 32 */
        .word __DMAC_2_handler /* 33 */
        .word __DMAC_3_handler /* 34 */
        .word __DMAC_OTHER_handler /* 35 */
        .word __EVSYS_0_handler /* 36 */
        .word __EVSYS_1_handler /* 37 */
        .word __EVSYS_2_handler /* 38 */
        .word __EVSYS_3_handler /* 39 */
        .word __EVSYS_OTHER_handler /* 40 */
        .word __PAC_handler /* 41 */
        .word __unknown_interrupt_handler /* 42 */
        .word __unknown_interrupt_handler /* 43 */
        .word __unknown_interrupt_handler /* 44 */
        .word __RAMECC_handler /* 45 */
        .word __SERCOM0_0_handler /* 46 */
        .word __SERCOM0_1_handler /* 47 */
        .word __SERCOM0_2_handler /* 48 */
        .word __SERCOM0_OTHER_handler /* 49 */
        .word __SERCOM1_0_handler /* 50 */
        .word __SERCOM1_1_handler /* 51 */
        .word __SERCOM1_2_handler /* 52 */
        .word __SERCOM1_OTHER_handler /* 53 */
        .word __SERCOM2_0_handler /* 54 */
        .word __SERCOM2_1_handler /* 55 */
        .word __SERCOM2_2_handler /* 56 */
        .word __SERCOM2_OTHER_handler /* 57 */
        .word __SERCOM3_0_handler /* 58 */
        .word __SERCOM3_1_handler /* 59 */
        .word __SERCOM3_2_handler /* 60 */
        .word __SERCOM3_OTHER_handler /* 61 */
        .word __SERCOM4_0_handler /* 62 */
        .word __SERCOM4_1_handler /* 63 */
        .word __SERCOM4_2_handler /* 64 */
        .word __SERCOM4_OTHER_handler /* 65 */
        .word __SERCOM5_0_handler /* 66 */
        .word __SERCOM5_1_handler /* 67 */
        .word __SERCOM5_2_handler /* 68 */
        .word __SERCOM5_OTHER_handler /* 69 */
        .word __unknown_interrupt_handler /* 70 */
        .word __unknown_interrupt_handler /* 71 */
        .word __unknown_interrupt_handler /* 72 */
        .word __unknown_interrupt_handler /* 73 */
        .word __unknown_interrupt_handler /* 74 */
        .word __unknown_interrupt_handler /* 75 */
        .word __unknown_interrupt_handler /* 76 */
        .word __unknown_interrupt_handler /* 77 */
        .word __unknown_interrupt_handler /* 78 */
        .word __unknown_interrupt_handler /* 79 */
        .word __USB_OTHER_handler /* 80 */
        .word __USB_SOF_HSOF_handler /* 81 */
        .word __USB_TRCPT0_handler /* 82 */
        .word __USB_TRCPT1_handler /* 83 */
        .word __unknown_interrupt_handler /* 84 */
        .word __TCC0_OTHER_handler /* 85 */
        .word __TCC0_MC0_handler /* 86 */
        .word __TCC0_MC1_handler /* 87 */
        .word __TCC0_MC2_handler /* 88 */
        .word __TCC0_MC3_handler /* 89 */
        .word __TCC0_MC4_handler /* 90 */
        .word __TCC0_MC5_handler /* 91 */
        .word __TCC1_OTHER_handler /* 92 */
        .word __TCC1_MC0_handler /* 93 */
        .word __TCC1_MC1_handler /* 94 */
        .word __TCC1_MC2_handler /* 95 */
        .word __TCC1_MC3_handler /* 96 */
        .word __TCC2_OTHER_handler /* 97 */
        .word __TCC2_MC0_handler /* 98 */
        .word __TCC2_MC1_handler /* 99 */
        .word __TCC2_MC2_handler /* 100 */
        .word __unknown_interrupt_handler /* 101 */
        .word __unknown_interrupt_handler /* 102 */
        .word __unknown_interrupt_handler /* 103 */
        .word __unknown_interrupt_handler /* 104 */
        .word __unknown_interrupt_handler /* 105 */
        .word __unknown_interrupt_handler /* 106 */
        .word __TC0_handler /* 107 */
        .word __TC1_handler /* 108 */
        .word __TC2_handler /* 109 */
        .word __TC3_handler /* 110 */
        .word __unknown_interrupt_handler /* 111 */
        .word __unknown_interrupt_handler /* 112 */
        .word __unknown_interrupt_handler /* 113 */
        .word __unknown_interrupt_handler /* 114 */
        .word __PDEC_OTHER_handler /* 115 */
        .word __PDEC_MC0_handler /* 116 */
        .word __PDEC_MC1_handler /* 117 */
        .word __ADC0_OTHER_handler /* 118 */
        .word __ADC0_RESRDY_handler /* 119 */
        .word __ADC1_OTHER_handler /* 120 */
        .word __ADC1_RESRDY_handler /* 121 */
        .word __AC_handler /* 122 */
        .word __DAC_OTHER_handler /* 123 */
        .word __DAC_EMPTY_0_handler /* 124 */
        .word __DAC_EMPTY_1_handler /* 125 */
        .word __DAC_RESRDY_0_handler /* 126 */
        .word __DAC_RESRDY_1_handler /* 127 */
        .word __unknown_interrupt_handler /* 128 */
        .word __PCC_handler /* 129 */
        .word __AES_handler /* 130 */
        .word __TRNG_handler /* 131 */
        .word __ICM_handler /* 132 */
        .word __PUKCC_handler /* 133 */
        .word __QSPI_handler /* 134 */
        .word __SDHC0_handler /* 135 */

   .weak      __PM_handler
   .thumb_set __PM_handler,__common_int_handler
   .weak      __MCLK_handler
   .thumb_set __MCLK_handler,__common_int_handler
   .weak      __OSCCTRL_XOSC0_handler
   .thumb_set __OSCCTRL_XOSC0_handler,__common_int_handler
   .weak      __OSCCTRL_XOSC1_handler
   .thumb_set __OSCCTRL_XOSC1_handler,__common_int_handler
   .weak      __OSCCTRL_DFLL_handler
   .thumb_set __OSCCTRL_DFLL_handler,__common_int_handler
   .weak      __OSCCTRL_DPLL0_handler
   .thumb_set __OSCCTRL_DPLL0_handler,__common_int_handler
   .weak      __OSCCTRL_DPLL1_handler
   .thumb_set __OSCCTRL_DPLL1_handler,__common_int_handler
   .weak      __OSC32KCTRL_handler
   .thumb_set __OSC32KCTRL_handler,__common_int_handler
   .weak      __SUPC_OTHER_handler
   .thumb_set __SUPC_OTHER_handler,__common_int_handler
   .weak      __SUPC_BODDET_handler
   .thumb_set __SUPC_BODDET_handler,__common_int_handler
   .weak      __WDT_handler
   .thumb_set __WDT_handler,__common_int_handler
   .weak      __RTC_handler
   .thumb_set __RTC_handler,__common_int_handler
   .weak      __EIC_EXTINT_0_handler
   .thumb_set __EIC_EXTINT_0_handler,__common_int_handler
   .weak      __EIC_EXTINT_1_handler
   .thumb_set __EIC_EXTINT_1_handler,__common_int_handler
   .weak      __EIC_EXTINT_2_handler
   .thumb_set __EIC_EXTINT_2_handler,__common_int_handler
   .weak      __EIC_EXTINT_3_handler
   .thumb_set __EIC_EXTINT_3_handler,__common_int_handler
   .weak      __EIC_EXTINT_4_handler
   .thumb_set __EIC_EXTINT_4_handler,__common_int_handler
   .weak      __EIC_EXTINT_5_handler
   .thumb_set __EIC_EXTINT_5_handler,__common_int_handler
   .weak      __EIC_EXTINT_6_handler
   .thumb_set __EIC_EXTINT_6_handler,__common_int_handler
   .weak      __EIC_EXTINT_7_handler
   .thumb_set __EIC_EXTINT_7_handler,__common_int_handler
   .weak      __EIC_EXTINT_8_handler
   .thumb_set __EIC_EXTINT_8_handler,__common_int_handler
   .weak      __EIC_EXTINT_9_handler
   .thumb_set __EIC_EXTINT_9_handler,__common_int_handler
   .weak      __EIC_EXTINT_10_handler
   .thumb_set __EIC_EXTINT_10_handler,__common_int_handler
   .weak      __EIC_EXTINT_11_handler
   .thumb_set __EIC_EXTINT_11_handler,__common_int_handler
   .weak      __EIC_EXTINT_12_handler
   .thumb_set __EIC_EXTINT_12_handler,__common_int_handler
   .weak      __EIC_EXTINT_13_handler
   .thumb_set __EIC_EXTINT_13_handler,__common_int_handler
   .weak      __EIC_EXTINT_14_handler
   .thumb_set __EIC_EXTINT_14_handler,__common_int_handler
   .weak      __EIC_EXTINT_15_handler
   .thumb_set __EIC_EXTINT_15_handler,__common_int_handler
   .weak      __FREQM_handler
   .thumb_set __FREQM_handler,__common_int_handler
   .weak      __NVMCTRL_0_handler
   .thumb_set __NVMCTRL_0_handler,__common_int_handler
   .weak      __NVMCTRL_1_handler
   .thumb_set __NVMCTRL_1_handler,__common_int_handler
   .weak      __DMAC_0_handler
   .thumb_set __DMAC_0_handler,__common_int_handler
   .weak      __DMAC_1_handler
   .thumb_set __DMAC_1_handler,__common_int_handler
   .weak      __DMAC_2_handler
   .thumb_set __DMAC_2_handler,__common_int_handler
   .weak      __DMAC_3_handler
   .thumb_set __DMAC_3_handler,__common_int_handler
   .weak      __DMAC_OTHER_handler
   .thumb_set __DMAC_OTHER_handler,__common_int_handler
   .weak      __EVSYS_0_handler
   .thumb_set __EVSYS_0_handler,__common_int_handler
   .weak      __EVSYS_1_handler
   .thumb_set __EVSYS_1_handler,__common_int_handler
   .weak      __EVSYS_2_handler
   .thumb_set __EVSYS_2_handler,__common_int_handler
   .weak      __EVSYS_3_handler
   .thumb_set __EVSYS_3_handler,__common_int_handler
   .weak      __EVSYS_OTHER_handler
   .thumb_set __EVSYS_OTHER_handler,__common_int_handler
   .weak      __PAC_handler
   .thumb_set __PAC_handler,__common_int_handler
   .weak      __RAMECC_handler
   .thumb_set __RAMECC_handler,__common_int_handler
   .weak      __SERCOM0_0_handler
   .thumb_set __SERCOM0_0_handler,__common_int_handler
   .weak      __SERCOM0_1_handler
   .thumb_set __SERCOM0_1_handler,__common_int_handler
   .weak      __SERCOM0_2_handler
   .thumb_set __SERCOM0_2_handler,__common_int_handler
   .weak      __SERCOM0_OTHER_handler
   .thumb_set __SERCOM0_OTHER_handler,__common_int_handler
   .weak      __SERCOM1_0_handler
   .thumb_set __SERCOM1_0_handler,__common_int_handler
   .weak      __SERCOM1_1_handler
   .thumb_set __SERCOM1_1_handler,__common_int_handler
   .weak      __SERCOM1_2_handler
   .thumb_set __SERCOM1_2_handler,__common_int_handler
   .weak      __SERCOM1_OTHER_handler
   .thumb_set __SERCOM1_OTHER_handler,__common_int_handler
   .weak      __SERCOM2_0_handler
   .thumb_set __SERCOM2_0_handler,__common_int_handler
   .weak      __SERCOM2_1_handler
   .thumb_set __SERCOM2_1_handler,__common_int_handler
   .weak      __SERCOM2_2_handler
   .thumb_set __SERCOM2_2_handler,__common_int_handler
   .weak      __SERCOM2_OTHER_handler
   .thumb_set __SERCOM2_OTHER_handler,__common_int_handler
   .weak      __SERCOM3_0_handler
   .thumb_set __SERCOM3_0_handler,__common_int_handler
   .weak      __SERCOM3_1_handler
   .thumb_set __SERCOM3_1_handler,__common_int_handler
   .weak      __SERCOM3_2_handler
   .thumb_set __SERCOM3_2_handler,__common_int_handler
   .weak      __SERCOM3_OTHER_handler
   .thumb_set __SERCOM3_OTHER_handler,__common_int_handler
   .weak      __SERCOM4_0_handler
   .thumb_set __SERCOM4_0_handler,__common_int_handler
   .weak      __SERCOM4_1_handler
   .thumb_set __SERCOM4_1_handler,__common_int_handler
   .weak      __SERCOM4_2_handler
   .thumb_set __SERCOM4_2_handler,__common_int_handler
   .weak      __SERCOM4_OTHER_handler
   .thumb_set __SERCOM4_OTHER_handler,__common_int_handler
   .weak      __SERCOM5_0_handler
   .thumb_set __SERCOM5_0_handler,__common_int_handler
   .weak      __SERCOM5_1_handler
   .thumb_set __SERCOM5_1_handler,__common_int_handler
   .weak      __SERCOM5_2_handler
   .thumb_set __SERCOM5_2_handler,__common_int_handler
   .weak      __SERCOM5_OTHER_handler
   .thumb_set __SERCOM5_OTHER_handler,__common_int_handler
   .weak      __USB_OTHER_handler
   .thumb_set __USB_OTHER_handler,__common_int_handler
   .weak      __USB_SOF_HSOF_handler
   .thumb_set __USB_SOF_HSOF_handler,__common_int_handler
   .weak      __USB_TRCPT0_handler
   .thumb_set __USB_TRCPT0_handler,__common_int_handler
   .weak      __USB_TRCPT1_handler
   .thumb_set __USB_TRCPT1_handler,__common_int_handler
   .weak      __TCC0_OTHER_handler
   .thumb_set __TCC0_OTHER_handler,__common_int_handler
   .weak      __TCC0_MC0_handler
   .thumb_set __TCC0_MC0_handler,__common_int_handler
   .weak      __TCC0_MC1_handler
   .thumb_set __TCC0_MC1_handler,__common_int_handler
   .weak      __TCC0_MC2_handler
   .thumb_set __TCC0_MC2_handler,__common_int_handler
   .weak      __TCC0_MC3_handler
   .thumb_set __TCC0_MC3_handler,__common_int_handler
   .weak      __TCC0_MC4_handler
   .thumb_set __TCC0_MC4_handler,__common_int_handler
   .weak      __TCC0_MC5_handler
   .thumb_set __TCC0_MC5_handler,__common_int_handler
   .weak      __TCC1_OTHER_handler
   .thumb_set __TCC1_OTHER_handler,__common_int_handler
   .weak      __TCC1_MC0_handler
   .thumb_set __TCC1_MC0_handler,__common_int_handler
   .weak      __TCC1_MC1_handler
   .thumb_set __TCC1_MC1_handler,__common_int_handler
   .weak      __TCC1_MC2_handler
   .thumb_set __TCC1_MC2_handler,__common_int_handler
   .weak      __TCC1_MC3_handler
   .thumb_set __TCC1_MC3_handler,__common_int_handler
   .weak      __TCC2_OTHER_handler
   .thumb_set __TCC2_OTHER_handler,__common_int_handler
   .weak      __TCC2_MC0_handler
   .thumb_set __TCC2_MC0_handler,__common_int_handler
   .weak      __TCC2_MC1_handler
   .thumb_set __TCC2_MC1_handler,__common_int_handler
   .weak      __TCC2_MC2_handler
   .thumb_set __TCC2_MC2_handler,__common_int_handler
   .weak      __TC0_handler
   .thumb_set __TC0_handler,__common_int_handler
   .weak      __TC1_handler
   .thumb_set __TC1_handler,__common_int_handler
   .weak      __TC2_handler
   .thumb_set __TC2_handler,__common_int_handler
   .weak      __TC3_handler
   .thumb_set __TC3_handler,__common_int_handler
   .weak      __PDEC_OTHER_handler
   .thumb_set __PDEC_OTHER_handler,__common_int_handler
   .weak      __PDEC_MC0_handler
   .thumb_set __PDEC_MC0_handler,__common_int_handler
   .weak      __PDEC_MC1_handler
   .thumb_set __PDEC_MC1_handler,__common_int_handler
   .weak      __ADC0_OTHER_handler
   .thumb_set __ADC0_OTHER_handler,__common_int_handler
   .weak      __ADC0_RESRDY_handler
   .thumb_set __ADC0_RESRDY_handler,__common_int_handler
   .weak      __ADC1_OTHER_handler
   .thumb_set __ADC1_OTHER_handler,__common_int_handler
   .weak      __ADC1_RESRDY_handler
   .thumb_set __ADC1_RESRDY_handler,__common_int_handler
   .weak      __AC_handler
   .thumb_set __AC_handler,__common_int_handler
   .weak      __DAC_OTHER_handler
   .thumb_set __DAC_OTHER_handler,__common_int_handler
   .weak      __DAC_EMPTY_0_handler
   .thumb_set __DAC_EMPTY_0_handler,__common_int_handler
   .weak      __DAC_EMPTY_1_handler
   .thumb_set __DAC_EMPTY_1_handler,__common_int_handler
   .weak      __DAC_RESRDY_0_handler
   .thumb_set __DAC_RESRDY_0_handler,__common_int_handler
   .weak      __DAC_RESRDY_1_handler
   .thumb_set __DAC_RESRDY_1_handler,__common_int_handler
   .weak      __PCC_handler
   .thumb_set __PCC_handler,__common_int_handler
   .weak      __AES_handler
   .thumb_set __AES_handler,__common_int_handler
   .weak      __TRNG_handler
   .thumb_set __TRNG_handler,__common_int_handler
   .weak      __ICM_handler
   .thumb_set __ICM_handler,__common_int_handler
   .weak      __PUKCC_handler
   .thumb_set __PUKCC_handler,__common_int_handler
   .weak      __QSPI_handler
   .thumb_set __QSPI_handler,__common_int_handler
   .weak      __SDHC0_handler
   .thumb_set __SDHC0_handler,__common_int_handler

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