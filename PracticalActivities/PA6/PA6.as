opt subtitle "Microchip Technology Omniscient Code Generator (Lite mode) build 59893"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 49 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
INDF equ 00h ;# 
# 55 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR0 equ 01h ;# 
# 61 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCL equ 02h ;# 
# 67 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
STATUS equ 03h ;# 
# 154 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
FSR equ 04h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTA equ 05h ;# 
# 209 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTB equ 06h ;# 
# 270 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTC equ 07h ;# 
# 331 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTD equ 08h ;# 
# 392 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PORTE equ 09h ;# 
# 423 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 442 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
INTCON equ 0Bh ;# 
# 519 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 580 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 619 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 625 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 631 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 637 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
T1CON equ 010h ;# 
# 711 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TMR2 equ 011h ;# 
# 717 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
T2CON equ 012h ;# 
# 787 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPBUF equ 013h ;# 
# 793 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPCON equ 014h ;# 
# 862 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1 equ 015h ;# 
# 868 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1L equ 015h ;# 
# 874 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR1H equ 016h ;# 
# 880 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCP1CON equ 017h ;# 
# 937 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
RCSTA equ 018h ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TXREG equ 019h ;# 
# 1037 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1043 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1049 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1055 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1061 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1118 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1124 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1219 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1288 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISA equ 085h ;# 
# 1337 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISB equ 086h ;# 
# 1398 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISC equ 087h ;# 
# 1459 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISD equ 088h ;# 
# 1520 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TRISE equ 089h ;# 
# 1576 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1637 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1676 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PCON equ 08Eh ;# 
# 1709 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1770 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
PR2 equ 092h ;# 
# 1776 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPADD equ 093h ;# 
# 1782 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 1950 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
TXSTA equ 098h ;# 
# 2030 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
SPBRG equ 099h ;# 
# 2036 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2105 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2169 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2175 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2233 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2239 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2245 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2251 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2257 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2301 "C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
EECON2 equ 018Dh ;# 
	FNCALL	_main,_Display_Init
	FNCALL	_main,_Display_Update
	FNCALL	_main,_UART_Init
	FNCALL	_main,_UART_Receive_Char
	FNROOT	_main
	global	_PIR1bits
_PIR1bits	set	0xC
	global	_PORTB
_PORTB	set	0x6
	global	_RCREG
_RCREG	set	0x1A
	global	_RCSTAbits
_RCSTAbits	set	0x18
	global	_SPBRG
_SPBRG	set	0x99
	global	_TRISB
_TRISB	set	0x86
	global	_TRISCbits
_TRISCbits	set	0x87
	global	_TXSTAbits
_TXSTAbits	set	0x98
psect	text0,local,class=CODE,delta=2,merge=1
; #config settings
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\include\pic16f877a.h"
	line	2761
global __ptext0
__ptext0:	;psect for function _Display_Init
global __CFG_WDTE$OFF
__CFG_WDTE$OFF equ 0x0
global __CFG_PWRTE$ON
__CFG_PWRTE$ON equ 0x0
global __CFG_CP$OFF
__CFG_CP$OFF equ 0x0
global __CFG_BOREN$ON
__CFG_BOREN$ON equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
global __CFG_CPD$OFF
__CFG_CPD$OFF equ 0x0
global __CFG_WRT$OFF
__CFG_WRT$OFF equ 0x0
global __CFG_FOSC$XT
__CFG_FOSC$XT equ 0x0
	file	"PA6.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_Display_Init:	; 0 bytes @ 0x0
??_Display_Init:	; 0 bytes @ 0x0
?_UART_Init:	; 0 bytes @ 0x0
??_UART_Init:	; 0 bytes @ 0x0
??_UART_Receive_Char:	; 0 bytes @ 0x0
?_Display_Update:	; 0 bytes @ 0x0
??_Display_Update:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
?_UART_Receive_Char:	; 1 bytes @ 0x0
	global	Display_Update@rx_char
Display_Update@rx_char:	; 1 bytes @ 0x0
	ds	1
??_main:	; 0 bytes @ 0x1
	ds	1
	global	main@incoming_char
main@incoming_char:	; 1 bytes @ 0x2
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      3       3
;!    BANK0            80      0       0
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_Display_Update
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0      90
;!                                              1 COMMON     2     2      0
;!                       _Display_Init
;!                     _Display_Update
;!                          _UART_Init
;!                  _UART_Receive_Char
;! ---------------------------------------------------------------------------------
;! (1) _UART_Receive_Char                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _UART_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Display_Update                                       1     1      0      75
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _Display_Init                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Display_Init
;!   _Display_Update
;!   _UART_Init
;!   _UART_Receive_Char
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      3       3       1       21.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!ABS                  0      0       0       3        0.0%
;!BITBANK0            50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!BANK3               60      0       0       9        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!BANK2               60      0       0      11        0.0%
;!DATA                 0      0       0      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 26 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  incoming_cha    1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Display_Init
;;		_Display_Update
;;		_UART_Init
;;		_UART_Receive_Char
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	26
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	26
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	28
	
l544:	
;LE6-4rx.c: 28: Display_Init();
	fcall	_Display_Init
	line	29
	
l546:	
;LE6-4rx.c: 29: UART_Init();
	fcall	_UART_Init
	goto	l548
	line	32
;LE6-4rx.c: 32: while(1) {
	
l27:	
	line	34
	
l548:	
;LE6-4rx.c: 34: char incoming_char = UART_Receive_Char();
	fcall	_UART_Receive_Char
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@incoming_char)
	line	37
	
l550:	
;LE6-4rx.c: 37: Display_Update(incoming_char);
	movf	(main@incoming_char),w
	fcall	_Display_Update
	goto	l548
	line	38
	
l28:	
	line	32
	goto	l548
	
l29:	
	line	39
	
l30:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_UART_Receive_Char

;; *************** function _UART_Receive_Char *****************
;; Defined at:
;;		line 59 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1
	line	59
global __ptext1
__ptext1:	;psect for function _UART_Receive_Char
psect	text1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	59
	global	__size_of_UART_Receive_Char
	__size_of_UART_Receive_Char	equ	__end_of_UART_Receive_Char-_UART_Receive_Char
	
_UART_Receive_Char:	
;incstack = 0
	opt	stack 7
; Regs used in _UART_Receive_Char: [wreg]
	line	61
	
l524:	
;LE6-4rx.c: 61: if (RCSTAbits.OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(24),1	;volatile
	goto	u11
	goto	u10
u11:
	goto	l37
u10:
	line	62
	
l526:	
;LE6-4rx.c: 62: RCSTAbits.CREN = 0;
	bcf	(24),4	;volatile
	line	63
;LE6-4rx.c: 63: RCSTAbits.CREN = 1;
	bsf	(24),4	;volatile
	goto	l37
	line	64
	
l36:	
	line	67
;LE6-4rx.c: 64: }
;LE6-4rx.c: 67: while(!PIR1bits.RCIF);
	goto	l37
	
l38:	
	
l37:	
	btfss	(12),5	;volatile
	goto	u21
	goto	u20
u21:
	goto	l37
u20:
	goto	l528
	
l39:	
	line	70
	
l528:	
;LE6-4rx.c: 70: return RCREG;
	movf	(26),w	;volatile
	goto	l40
	
l530:	
	line	71
	
l40:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Receive_Char
	__end_of_UART_Receive_Char:
	signat	_UART_Receive_Char,89
	global	_UART_Init

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 43 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	line	43
global __ptext2
__ptext2:	;psect for function _UART_Init
psect	text2
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	43
	global	__size_of_UART_Init
	__size_of_UART_Init	equ	__end_of_UART_Init-_UART_Init
	
_UART_Init:	
;incstack = 0
	opt	stack 7
; Regs used in _UART_Init: [wreg]
	line	45
	
l510:	
;LE6-4rx.c: 45: TRISCbits.TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h,6	;volatile
	line	46
;LE6-4rx.c: 46: TRISCbits.TRISC7 = 1;
	bsf	(135)^080h,7	;volatile
	line	49
	
l512:	
;LE6-4rx.c: 49: SPBRG = 0x19;
	movlw	(019h)
	movwf	(153)^080h	;volatile
	line	52
	
l514:	
;LE6-4rx.c: 52: TXSTAbits.SYNC = 0;
	bcf	(152)^080h,4	;volatile
	line	53
	
l516:	
;LE6-4rx.c: 53: TXSTAbits.BRGH = 1;
	bsf	(152)^080h,2	;volatile
	line	54
	
l518:	
;LE6-4rx.c: 54: RCSTAbits.SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(24),7	;volatile
	line	55
	
l520:	
;LE6-4rx.c: 55: RCSTAbits.RX9 = 0;
	bcf	(24),6	;volatile
	line	56
	
l522:	
;LE6-4rx.c: 56: RCSTAbits.CREN = 1;
	bsf	(24),4	;volatile
	line	57
	
l33:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Init
	__end_of_UART_Init:
	signat	_UART_Init,88
	global	_Display_Update

;; *************** function _Display_Update *****************
;; Defined at:
;;		line 79 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
;; Parameters:    Size  Location     Type
;;  rx_char         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rx_char         1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	line	79
global __ptext3
__ptext3:	;psect for function _Display_Update
psect	text3
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	79
	global	__size_of_Display_Update
	__size_of_Display_Update	equ	__end_of_Display_Update-_Display_Update
	
_Display_Update:	
;incstack = 0
	opt	stack 7
; Regs used in _Display_Update: [wreg+status,2+status,0]
;Display_Update@rx_char stored from wreg
	movwf	(Display_Update@rx_char)
	line	81
	
l532:	
;LE6-4rx.c: 81: if (rx_char >= '0' && rx_char <= '9') {
	movlw	(030h)
	subwf	(Display_Update@rx_char),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l538
u30:
	
l534:	
	movlw	(03Ah)
	subwf	(Display_Update@rx_char),w
	skipnc
	goto	u41
	goto	u40
u41:
	goto	l538
u40:
	line	82
	
l536:	
;LE6-4rx.c: 82: PORTB = rx_char - '0';
	movf	(Display_Update@rx_char),w
	addlw	0D0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	83
;LE6-4rx.c: 83: }
	goto	l51
	line	84
	
l46:	
	
l538:	
;LE6-4rx.c: 84: else if (rx_char == '*' || rx_char == '#') {
	movf	(Display_Update@rx_char),w
	xorlw	02Ah
	skipnz
	goto	u51
	goto	u50
u51:
	goto	l542
u50:
	
l540:	
	movf	(Display_Update@rx_char),w
	xorlw	023h
	skipz
	goto	u61
	goto	u60
u61:
	goto	l51
u60:
	goto	l542
	
l50:	
	line	85
	
l542:	
;LE6-4rx.c: 85: PORTB = 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	goto	l51
	line	86
	
l48:	
	goto	l51
	line	87
	
l47:	
	
l51:	
	return
	opt stack 0
GLOBAL	__end_of_Display_Update
	__end_of_Display_Update:
	signat	_Display_Update,4216
	global	_Display_Init

;; *************** function _Display_Init *****************
;; Defined at:
;;		line 73 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	line	73
global __ptext4
__ptext4:	;psect for function _Display_Init
psect	text4
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA6\LE6-4rx.c"
	line	73
	global	__size_of_Display_Init
	__size_of_Display_Init	equ	__end_of_Display_Init-_Display_Init
	
_Display_Init:	
;incstack = 0
	opt	stack 7
; Regs used in _Display_Init: [status,2]
	line	75
	
l508:	
;LE6-4rx.c: 75: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	76
;LE6-4rx.c: 76: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	77
	
l43:	
	return
	opt stack 0
GLOBAL	__end_of_Display_Init
	__end_of_Display_Init:
	signat	_Display_Init,88
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp
	global	wtemp0
	wtemp set btemp
	wtemp0 set btemp
	global	wtemp1
	wtemp1 set btemp+2
	global	wtemp2
	wtemp2 set btemp+4
	global	wtemp3
	wtemp3 set btemp+6
	global	wtemp4
	wtemp4 set btemp+8
	global	wtemp5
	wtemp5 set btemp+10
	global	wtemp6
	wtemp6 set btemp+1
	global	ttemp
	global	ttemp0
	ttemp set btemp
	ttemp0 set btemp
	global	ttemp1
	ttemp1 set btemp+3
	global	ttemp2
	ttemp2 set btemp+6
	global	ttemp3
	ttemp3 set btemp+9
	global	ttemp4
	ttemp4 set btemp+1
	global	ltemp
	global	ltemp0
	ltemp set btemp
	ltemp0 set btemp
	global	ltemp1
	ltemp1 set btemp+4
	global	ltemp2
	ltemp2 set btemp+8
	global	ltemp3
	ltemp3 set btemp+2
	end
