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
	FNCALL	_main,_dataCtrl
	FNCALL	_main,_delay
	FNCALL	_main,_initLCD
	FNCALL	_main,_instCtrl
	FNCALL	_initLCD,_delay
	FNCALL	_initLCD,_instCtrl
	FNCALL	_instCtrl,_delay
	FNCALL	_dataCtrl,_delay
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_keypad
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	108
_keypad:
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	020h
	retlw	034h
	retlw	035h
	retlw	036h
	retlw	020h
	retlw	037h
	retlw	038h
	retlw	039h
	retlw	020h
	retlw	02Ah
	retlw	030h
	retlw	023h
	retlw	020h
	retlw	0
	global __end_of_keypad
__end_of_keypad:
	global	_keypad
	global	_myINTF
	global	_myTMR0IF
	global	_counter
	global	_PORTC
_PORTC	set	0x7
	global	_PORTD
_PORTD	set	0x8
	global	_TMR0
_TMR0	set	0x1
	global	_GIE
_GIE	set	0x5F
	global	_INTE
_INTE	set	0x5C
	global	_INTF
_INTF	set	0x59
	global	_RB5
_RB5	set	0x35
	global	_RB6
_RB6	set	0x36
	global	_RB7
_RB7	set	0x37
	global	_RD4
_RD4	set	0x44
	global	_TMR0IE
_TMR0IE	set	0x5D
	global	_TMR0IF
_TMR0IF	set	0x5A
	global	_OPTION_REG
_OPTION_REG	set	0x81
	global	_TRISB
_TRISB	set	0x86
	global	_TRISC
_TRISC	set	0x87
	global	_TRISD
_TRISD	set	0x88
; #config settings
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
	file	"PreMidterm.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_myINTF:
       ds      1

_myTMR0IF:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_counter:
       ds      1

	line	#
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_instCtrl:	; 0 bytes @ 0x0
?_initLCD:	; 0 bytes @ 0x0
?_dataCtrl:	; 0 bytes @ 0x0
?_ISR:	; 0 bytes @ 0x0
??_ISR:	; 0 bytes @ 0x0
?_main:	; 2 bytes @ 0x0
	ds	4
?_delay:	; 0 bytes @ 0x4
	global	delay@ms
delay@ms:	; 2 bytes @ 0x4
	ds	2
??_delay:	; 0 bytes @ 0x6
??_instCtrl:	; 0 bytes @ 0x6
??_dataCtrl:	; 0 bytes @ 0x6
	global	instCtrl@cmd
instCtrl@cmd:	; 1 bytes @ 0x6
	global	dataCtrl@data
dataCtrl@data:	; 1 bytes @ 0x6
	ds	1
??_initLCD:	; 0 bytes @ 0x7
??_main:	; 0 bytes @ 0x7
	ds	1
	global	main@key
main@key:	; 1 bytes @ 0x8
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	delay@i
delay@i:	; 2 bytes @ 0x0
	ds	2
	global	delay@j
delay@j:	; 2 bytes @ 0x2
	ds	2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    17
;!    Data        0
;!    BSS         1
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      9      10
;!    BANK0            80      4       5
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
;!    _main->_dataCtrl
;!    _main->_instCtrl
;!    _initLCD->_instCtrl
;!    _instCtrl->_delay
;!    _dataCtrl->_delay
;!
;!Critical Paths under _ISR in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_delay
;!    _initLCD->_delay
;!    _instCtrl->_delay
;!    _dataCtrl->_delay
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK2
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
;! (0) _main                                                 2     2      0    2432
;!                                              7 COMMON     2     2      0
;!                           _dataCtrl
;!                              _delay
;!                            _initLCD
;!                           _instCtrl
;! ---------------------------------------------------------------------------------
;! (1) _initLCD                                              0     0      0     953
;!                              _delay
;!                           _instCtrl
;! ---------------------------------------------------------------------------------
;! (1) _instCtrl                                             1     1      0     492
;!                                              6 COMMON     1     1      0
;!                              _delay
;! ---------------------------------------------------------------------------------
;! (1) _dataCtrl                                             1     1      0     492
;!                                              6 COMMON     1     1      0
;!                              _delay
;! ---------------------------------------------------------------------------------
;! (2) _delay                                                6     4      2     461
;!                                              4 COMMON     2     0      2
;!                                              0 BANK0      4     4      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _ISR                                                  4     4      0       0
;!                                              0 COMMON     4     4      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _dataCtrl
;!     _delay
;!   _delay
;!   _initLCD
;!     _delay
;!     _instCtrl
;!       _delay
;!   _instCtrl
;!     _delay
;!
;! _ISR (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       1       0        7.1%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      9       A       1       71.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!ABS                  0      0       F       3        0.0%
;!BITBANK0            50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50      4       5       5        6.3%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!BANK3               60      0       0       9        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!BANK2               60      0       0      11        0.0%
;!DATA                 0      0       F      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 111 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key             1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   73[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_dataCtrl
;;		_delay
;;		_initLCD
;;		_instCtrl
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	111
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	111
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	113
	
l894:	
;PreMidterm.c: 113: TRISB = 0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	114
	
l896:	
;PreMidterm.c: 114: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	115
	
l898:	
;PreMidterm.c: 115: TRISD = 0xFF;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	118
	
l900:	
;PreMidterm.c: 118: OPTION_REG = 0xC4;
	movlw	(0C4h)
	movwf	(129)^080h	;volatile
	line	120
	
l902:	
;PreMidterm.c: 120: INTF = 0;
	bcf	(89/8),(89)&7	;volatile
	line	121
	
l904:	
;PreMidterm.c: 121: INTE = 1;
	bsf	(92/8),(92)&7	;volatile
	line	122
	
l906:	
;PreMidterm.c: 122: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(1)	;volatile
	line	123
	
l908:	
;PreMidterm.c: 123: TMR0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	124
	
l910:	
;PreMidterm.c: 124: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	126
	
l912:	
;PreMidterm.c: 126: initLCD();
	fcall	_initLCD
	goto	l914
	line	129
;PreMidterm.c: 129: while(1){
	
l74:	
	line	130
	
l914:	
;PreMidterm.c: 130: unsigned char key = PORTD & 0x0F;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@key)
	line	131
;PreMidterm.c: 131: while(RD4);
	goto	l75
	
l76:	
	
l75:	
	btfsc	(68/8),(68)&7	;volatile
	goto	u541
	goto	u540
u541:
	goto	l75
u540:
	goto	l916
	
l77:	
	line	133
	
l916:	
;PreMidterm.c: 133: delay(2);
	movlw	low(02h)
	movwf	(delay@ms)
	movlw	high(02h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	134
;PreMidterm.c: 134: instCtrl(0xC7);
	movlw	(0C7h)
	fcall	_instCtrl
	line	136
;PreMidterm.c: 136: dataCtrl('T');
	movlw	(054h)
	fcall	_dataCtrl
	line	137
;PreMidterm.c: 137: dataCtrl('I');
	movlw	(049h)
	fcall	_dataCtrl
	line	138
;PreMidterm.c: 138: dataCtrl('M');
	movlw	(04Dh)
	fcall	_dataCtrl
	line	139
;PreMidterm.c: 139: dataCtrl('E');
	movlw	(045h)
	fcall	_dataCtrl
	line	140
;PreMidterm.c: 140: dataCtrl('R');
	movlw	(052h)
	fcall	_dataCtrl
	line	142
;PreMidterm.c: 142: instCtrl(0x9D);
	movlw	(09Dh)
	fcall	_instCtrl
	line	146
	
l918:	
;PreMidterm.c: 146: if (counter == 0x00) {dataCtrl('0');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),f	;volatile
	skipz
	goto	u551
	goto	u550
u551:
	goto	l922
u550:
	
l920:	
	movlw	(030h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	147
	
l78:	
	
l922:	
;PreMidterm.c: 147: else if (counter == 0x01) {dataCtrl('1');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	01h
	skipz
	goto	u561
	goto	u560
u561:
	goto	l926
u560:
	
l924:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	148
	
l80:	
	
l926:	
;PreMidterm.c: 148: else if (counter == 0x02) {dataCtrl('2');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	02h
	skipz
	goto	u571
	goto	u570
u571:
	goto	l930
u570:
	
l928:	
	movlw	(032h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	149
	
l82:	
	
l930:	
;PreMidterm.c: 149: else if (counter == 0x03) {dataCtrl('3');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	03h
	skipz
	goto	u581
	goto	u580
u581:
	goto	l934
u580:
	
l932:	
	movlw	(033h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	150
	
l84:	
	
l934:	
;PreMidterm.c: 150: else if (counter == 0x04) {dataCtrl('4');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	04h
	skipz
	goto	u591
	goto	u590
u591:
	goto	l938
u590:
	
l936:	
	movlw	(034h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	151
	
l86:	
	
l938:	
;PreMidterm.c: 151: else if (counter == 0x05) {dataCtrl('5');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	05h
	skipz
	goto	u601
	goto	u600
u601:
	goto	l942
u600:
	
l940:	
	movlw	(035h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	152
	
l88:	
	
l942:	
;PreMidterm.c: 152: else if (counter == 0x06) {dataCtrl('6');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	06h
	skipz
	goto	u611
	goto	u610
u611:
	goto	l946
u610:
	
l944:	
	movlw	(036h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	153
	
l90:	
	
l946:	
;PreMidterm.c: 153: else if (counter == 0x07) {dataCtrl('7');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	07h
	skipz
	goto	u621
	goto	u620
u621:
	goto	l950
u620:
	
l948:	
	movlw	(037h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	154
	
l92:	
	
l950:	
;PreMidterm.c: 154: else if (counter == 0x08) {dataCtrl('8');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	08h
	skipz
	goto	u631
	goto	u630
u631:
	goto	l954
u630:
	
l952:	
	movlw	(038h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	155
	
l94:	
	
l954:	
;PreMidterm.c: 155: else if (counter == 0x09) {dataCtrl('9');dataCtrl(' ');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	09h
	skipz
	goto	u641
	goto	u640
u641:
	goto	l958
u640:
	
l956:	
	movlw	(039h)
	fcall	_dataCtrl
	movlw	(020h)
	fcall	_dataCtrl
	goto	l978
	line	156
	
l96:	
	
l958:	
;PreMidterm.c: 156: else if (counter == 0x0A) {dataCtrl('1');dataCtrl('0');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	0Ah
	skipz
	goto	u651
	goto	u650
u651:
	goto	l962
u650:
	
l960:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(030h)
	fcall	_dataCtrl
	goto	l978
	line	157
	
l98:	
	
l962:	
;PreMidterm.c: 157: else if (counter == 0x0B) {dataCtrl('1');dataCtrl('1');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	0Bh
	skipz
	goto	u661
	goto	u660
u661:
	goto	l966
u660:
	
l964:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(031h)
	fcall	_dataCtrl
	goto	l978
	line	158
	
l100:	
	
l966:	
;PreMidterm.c: 158: else if (counter == 0x0C) {dataCtrl('1');dataCtrl('2');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	0Ch
	skipz
	goto	u671
	goto	u670
u671:
	goto	l970
u670:
	
l968:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(032h)
	fcall	_dataCtrl
	goto	l978
	line	159
	
l102:	
	
l970:	
;PreMidterm.c: 159: else if (counter == 0x0D) {dataCtrl('1');dataCtrl('3');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	0Dh
	skipz
	goto	u681
	goto	u680
u681:
	goto	l974
u680:
	
l972:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(033h)
	fcall	_dataCtrl
	goto	l978
	line	160
	
l104:	
	
l974:	
;PreMidterm.c: 160: else if (counter == 0x0E) {dataCtrl('1');dataCtrl('4');}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_counter),w	;volatile
	xorlw	0Eh
	skipz
	goto	u691
	goto	u690
u691:
	goto	l978
u690:
	
l976:	
	movlw	(031h)
	fcall	_dataCtrl
	movlw	(034h)
	fcall	_dataCtrl
	goto	l978
	
l106:	
	goto	l978
	line	162
	
l105:	
	goto	l978
	
l103:	
	goto	l978
	
l101:	
	goto	l978
	
l99:	
	goto	l978
	
l97:	
	goto	l978
	
l95:	
	goto	l978
	
l93:	
	goto	l978
	
l91:	
	goto	l978
	
l89:	
	goto	l978
	
l87:	
	goto	l978
	
l85:	
	goto	l978
	
l83:	
	goto	l978
	
l81:	
	goto	l978
	
l79:	
	
l978:	
;PreMidterm.c: 162: if(myINTF) {
	btfss	(_myINTF/8),(_myINTF)&7	;volatile
	goto	u701
	goto	u700
u701:
	goto	l914
u700:
	line	166
	
l980:	
;PreMidterm.c: 166: counter++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_counter),f	;volatile
	line	169
	
l982:	
;PreMidterm.c: 169: if(counter > 14) {
	movlw	(0Fh)
	subwf	(_counter),w	;volatile
	skipc
	goto	u711
	goto	u710
u711:
	goto	l986
u710:
	line	170
	
l984:	
;PreMidterm.c: 170: counter = 0;
	clrf	(_counter)	;volatile
	goto	l986
	line	171
	
l108:	
	line	175
	
l986:	
;PreMidterm.c: 171: }
;PreMidterm.c: 175: delay(61);
	movlw	low(03Dh)
	movwf	(delay@ms)
	movlw	high(03Dh)
	movwf	((delay@ms))+1
	fcall	_delay
	line	176
;PreMidterm.c: 176: while(RD4);
	goto	l109
	
l110:	
	
l109:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(68/8),(68)&7	;volatile
	goto	u721
	goto	u720
u721:
	goto	l109
u720:
	goto	l988
	
l111:	
	line	177
	
l988:	
;PreMidterm.c: 177: if(keypad[key]=='0')
	movf	(main@key),w
	addlw	low((_keypad)-__stringbase)
	movwf	fsr0
	fcall	stringdir
	xorlw	030h
	skipz
	goto	u731
	goto	u730
u731:
	goto	l914
u730:
	line	178
	
l990:	
;PreMidterm.c: 178: counter+=2;
	movlw	(02h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_counter),f	;volatile
	goto	l914
	
l112:	
	goto	l914
	line	179
	
l107:	
	goto	l914
	line	180
	
l113:	
	line	129
	goto	l914
	
l114:	
	line	183
;PreMidterm.c: 179: }
;PreMidterm.c: 180: }
;PreMidterm.c: 182: return 0;
;	Return value of _main is never used
	
l115:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,90
	global	_initLCD

;; *************** function _initLCD *****************
;; Defined at:
;;		line 45 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;;		_instCtrl
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1
	line	45
global __ptext1
__ptext1:	;psect for function _initLCD
psect	text1
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	45
	global	__size_of_initLCD
	__size_of_initLCD	equ	__end_of_initLCD-_initLCD
	
_initLCD:	
;incstack = 0
	opt	stack 4
; Regs used in _initLCD: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l880:	
;PreMidterm.c: 47: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	48
;PreMidterm.c: 48: instCtrl(0x38);
	movlw	(038h)
	fcall	_instCtrl
	line	49
;PreMidterm.c: 49: instCtrl(0x08);
	movlw	(08h)
	fcall	_instCtrl
	line	50
;PreMidterm.c: 50: instCtrl(0x01);
	movlw	(01h)
	fcall	_instCtrl
	line	51
;PreMidterm.c: 51: instCtrl(0x06);
	movlw	(06h)
	fcall	_instCtrl
	line	52
;PreMidterm.c: 52: instCtrl(0x0C);
	movlw	(0Ch)
	fcall	_instCtrl
	line	53
	
l46:	
	return
	opt stack 0
GLOBAL	__end_of_initLCD
	__end_of_initLCD:
	signat	_initLCD,88
	global	_instCtrl

;; *************** function _instCtrl *****************
;; Defined at:
;;		line 36 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_initLCD
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	line	36
global __ptext2
__ptext2:	;psect for function _instCtrl
psect	text2
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	36
	global	__size_of_instCtrl
	__size_of_instCtrl	equ	__end_of_instCtrl-_instCtrl
	
_instCtrl:	
;incstack = 0
	opt	stack 5
; Regs used in _instCtrl: [wreg+status,2+status,0+pclath+cstack]
;instCtrl@cmd stored from wreg
	movwf	(instCtrl@cmd)
	line	37
	
l868:	
;PreMidterm.c: 37: PORTC = cmd;
	movf	(instCtrl@cmd),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	38
	
l870:	
;PreMidterm.c: 38: RB5 = 0;
	bcf	(53/8),(53)&7	;volatile
	line	39
	
l872:	
;PreMidterm.c: 39: RB6 = 0;
	bcf	(54/8),(54)&7	;volatile
	line	40
	
l874:	
;PreMidterm.c: 40: RB7 = 1;
	bsf	(55/8),(55)&7	;volatile
	line	41
	
l876:	
;PreMidterm.c: 41: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	42
	
l878:	
;PreMidterm.c: 42: RB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7	;volatile
	line	43
	
l43:	
	return
	opt stack 0
GLOBAL	__end_of_instCtrl
	__end_of_instCtrl:
	signat	_instCtrl,4216
	global	_dataCtrl

;; *************** function _dataCtrl *****************
;; Defined at:
;;		line 55 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	line	55
global __ptext3
__ptext3:	;psect for function _dataCtrl
psect	text3
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	55
	global	__size_of_dataCtrl
	__size_of_dataCtrl	equ	__end_of_dataCtrl-_dataCtrl
	
_dataCtrl:	
;incstack = 0
	opt	stack 5
; Regs used in _dataCtrl: [wreg+status,2+status,0+pclath+cstack]
;dataCtrl@data stored from wreg
	movwf	(dataCtrl@data)
	line	56
	
l882:	
;PreMidterm.c: 56: PORTC = data;
	movf	(dataCtrl@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	57
	
l884:	
;PreMidterm.c: 57: RB5 = 1;
	bsf	(53/8),(53)&7	;volatile
	line	58
	
l886:	
;PreMidterm.c: 58: RB6 = 0;
	bcf	(54/8),(54)&7	;volatile
	line	59
	
l888:	
;PreMidterm.c: 59: RB7 = 1;
	bsf	(55/8),(55)&7	;volatile
	line	60
	
l890:	
;PreMidterm.c: 60: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	61
	
l892:	
;PreMidterm.c: 61: RB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7	;volatile
	line	62
	
l49:	
	return
	opt stack 0
GLOBAL	__end_of_dataCtrl
	__end_of_dataCtrl:
	signat	_dataCtrl,4216
	global	_delay

;; *************** function _delay *****************
;; Defined at:
;;		line 64 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;  ms              2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    2[BANK0 ] unsigned int 
;;  i               2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       4       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_instCtrl
;;		_initLCD
;;		_dataCtrl
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	line	64
global __ptext4
__ptext4:	;psect for function _delay
psect	text4
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	64
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
;incstack = 0
	opt	stack 5
; Regs used in _delay: [wreg+status,2]
	line	67
	
l856:	
;PreMidterm.c: 66: unsigned int i, j;
;PreMidterm.c: 67: for(i = 0; i < ms; i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l52
	
l53:	
	line	68
	
l858:	
;PreMidterm.c: 68: for(j = 0; j < 1000; j++);
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l860:	
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u511
	goto	u510
u511:
	goto	l864
u510:
	goto	l866
	
l862:	
	goto	l866
	
l54:	
	
l864:	
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u521
	goto	u520
u521:
	goto	l864
u520:
	goto	l866
	
l55:	
	line	67
	
l866:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l52:	
	movf	(delay@ms+1),w
	subwf	(delay@i+1),w
	skipz
	goto	u535
	movf	(delay@ms),w
	subwf	(delay@i),w
u535:
	skipc
	goto	u531
	goto	u530
u531:
	goto	l858
u530:
	goto	l57
	
l56:	
	line	70
	
l57:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
	signat	_delay,4216
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 83 in file "Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1
	line	83
global __ptext5
__ptext5:	;psect for function _ISR
psect	text5
	file	"Z:\CPE3201-Sevilla\PreMidterm\PreMidterm.c"
	line	83
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 4
; Regs used in _ISR: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text5
	line	84
	
i1l616:	
;PreMidterm.c: 84: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	86
;PreMidterm.c: 86: if(INTF){
	btfss	(89/8),(89)&7	;volatile
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l67
u6_20:
	line	88
	
i1l618:	
;PreMidterm.c: 88: INTF = 0;
	bcf	(89/8),(89)&7	;volatile
	line	89
;PreMidterm.c: 89: myINTF = 1;
	bsf	(_myINTF/8),(_myINTF)&7	;volatile
	line	93
	
i1l67:	
	line	97
;PreMidterm.c: 93: }
;PreMidterm.c: 97: if (TMR0IF) {
	btfss	(90/8),(90)&7	;volatile
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l68
u7_20:
	line	98
	
i1l620:	
;PreMidterm.c: 98: TMR0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	99
;PreMidterm.c: 99: myTMR0IF = 1;
	bsf	(_myTMR0IF/8),(_myTMR0IF)&7	;volatile
	line	100
	
i1l68:	
	line	101
;PreMidterm.c: 100: }
;PreMidterm.c: 101: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	104
	
i1l69:	
	movf	(??_ISR+3),w
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,88
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
