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
	FNCALL	_main,_delay
	FNCALL	_main,_initLCD
	FNCALL	_main,_instCtrl
	FNCALL	_main,_printNumber
	FNCALL	_main,_printString
	FNCALL	_printNumber,___lwdiv
	FNCALL	_printNumber,___lwmod
	FNCALL	_printNumber,_printString
	FNCALL	_printString,_dataCtrl
	FNCALL	_dataCtrl,_delay
	FNCALL	_initLCD,_delay
	FNCALL	_initLCD,_instCtrl
	FNCALL	_instCtrl,_delay
	FNROOT	_main
	FNCALL	_ISR,i1___lwdiv
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_period
	global	_CCPR1
_CCPR1	set	0x15
	global	_TMR1
_TMR1	set	0xE
	global	_CCP1CON
_CCP1CON	set	0x17
	global	_PORTB
_PORTB	set	0x6
	global	_T1CON
_T1CON	set	0x10
	global	_CCP1IF
_CCP1IF	set	0x62
	global	_GIE
_GIE	set	0x5F
	global	_PEIE
_PEIE	set	0x5E
	global	_RA0
_RA0	set	0x28
	global	_RC5
_RC5	set	0x3D
	global	_RC6
_RC6	set	0x3E
	global	_RC7
_RC7	set	0x3F
	global	_TMR1ON
_TMR1ON	set	0x80
	global	_ADCON1
_ADCON1	set	0x9F
	global	_TRISA
_TRISA	set	0x85
	global	_TRISB
_TRISB	set	0x86
	global	_TRISC
_TRISC	set	0x87
	global	_CCP1IE
_CCP1IE	set	0x462
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
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
	global __stringdata
__stringdata:
	
STR_2:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	80	;'P'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_3:	
	retlw	32	;' '
	retlw	109	;'m'
	retlw	115	;'s'
	retlw	0
psect	strings
	global __end_of__stringdata
__end_of__stringdata:
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
	file	"PA4.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_period:
       ds      2

	line	#
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
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
?_main:	; 0 bytes @ 0x0
	global	?i1___lwdiv
?i1___lwdiv:	; 2 bytes @ 0x0
	global	i1___lwdiv@divisor
i1___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	i1___lwdiv@dividend
i1___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	2
??i1___lwdiv:	; 0 bytes @ 0x4
	ds	1
	global	i1___lwdiv@quotient
i1___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	i1___lwdiv@counter
i1___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
??_ISR:	; 0 bytes @ 0x8
	ds	6
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
?_delay:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	delay@ms
delay@ms:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
??_delay:	; 0 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
??___lwdiv:	; 0 bytes @ 0x4
??___lwmod:	; 0 bytes @ 0x4
	global	delay@j
delay@j:	; 2 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
??_instCtrl:	; 0 bytes @ 0x6
??_dataCtrl:	; 0 bytes @ 0x6
	global	instCtrl@cmd
instCtrl@cmd:	; 1 bytes @ 0x6
	global	dataCtrl@data
dataCtrl@data:	; 1 bytes @ 0x6
	ds	1
??_initLCD:	; 0 bytes @ 0x7
?_printString:	; 0 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	printString@str
printString@str:	; 2 bytes @ 0x7
	ds	2
??_printString:	; 0 bytes @ 0x9
?_printNumber:	; 0 bytes @ 0x9
	global	printNumber@num
printNumber@num:	; 2 bytes @ 0x9
	ds	2
??_printNumber:	; 0 bytes @ 0xB
	ds	1
	global	printNumber@buffer
printNumber@buffer:	; 6 bytes @ 0xC
	ds	6
	global	printNumber@i
printNumber@i:	; 2 bytes @ 0x12
	ds	2
??_main:	; 0 bytes @ 0x14
;!
;!Data Sizes:
;!    Strings     33
;!    Constant    0
;!    Data        0
;!    BSS         2
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     20      22
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    printString@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> STR_3(CODE[4]), STR_2(CODE[21]), STR_1(CODE[8]), printNumber@buffer(BANK0[6]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _ISR in COMMON
;!
;!    _ISR->i1___lwdiv
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_printNumber
;!    _printNumber->_printString
;!    _printString->_dataCtrl
;!    _dataCtrl->_delay
;!    _initLCD->_instCtrl
;!    _instCtrl->_delay
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    3680
;!                              _delay
;!                            _initLCD
;!                           _instCtrl
;!                        _printNumber
;!                        _printString
;! ---------------------------------------------------------------------------------
;! (1) _printNumber                                         11     9      2    1572
;!                                              9 BANK0     11     9      2
;!                            ___lwdiv
;!                            ___lwmod
;!                        _printString
;! ---------------------------------------------------------------------------------
;! (1) _printString                                          2     0      2     636
;!                                              7 BANK0      2     0      2
;!                           _dataCtrl
;! ---------------------------------------------------------------------------------
;! (2) _dataCtrl                                             1     1      0     379
;!                                              6 BANK0      1     1      0
;!                              _delay
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              6     2      4     265
;!                                              0 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              8     4      4     322
;!                                              0 BANK0      8     4      4
;! ---------------------------------------------------------------------------------
;! (1) _initLCD                                              0     0      0     736
;!                              _delay
;!                           _instCtrl
;! ---------------------------------------------------------------------------------
;! (1) _instCtrl                                             1     1      0     379
;!                                              6 BANK0      1     1      0
;!                              _delay
;! ---------------------------------------------------------------------------------
;! (3) _delay                                                6     4      2     357
;!                                              0 BANK0      6     4      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _ISR                                                  6     6      0     214
;!                                              8 COMMON     6     6      0
;!                          i1___lwdiv
;! ---------------------------------------------------------------------------------
;! (6) i1___lwdiv                                            8     4      4     214
;!                                              0 COMMON     8     4      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _delay
;!   _initLCD
;!     _delay
;!     _instCtrl
;!       _delay
;!   _instCtrl
;!     _delay
;!   _printNumber
;!     ___lwdiv
;!     ___lwmod
;!     _printString
;!       _dataCtrl
;!         _delay
;!   _printString
;!     _dataCtrl
;!       _delay
;!
;! _ISR (ROOT)
;!   i1___lwdiv
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!ABS                  0      0      24       3        0.0%
;!BITBANK0            50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50     14      16       5       27.5%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!BANK3               60      0       0       9        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!BANK2               60      0       0      11        0.0%
;!DATA                 0      0      24      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 119 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_delay
;;		_initLCD
;;		_instCtrl
;;		_printNumber
;;		_printString
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	119
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	119
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	121
	
l877:	
;LE4-6.c: 121: ADCON1 = 0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	122
	
l879:	
;LE4-6.c: 122: TRISB = 0x00;
	clrf	(134)^080h	;volatile
	line	123
	
l881:	
;LE4-6.c: 123: TRISA = 0x00;
	clrf	(133)^080h	;volatile
	line	124
;LE4-6.c: 124: TRISC = 0x04;
	movlw	(04h)
	movwf	(135)^080h	;volatile
	line	126
;LE4-6.c: 126: T1CON = 0x30;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	127
;LE4-6.c: 127: CCP1CON = 0x05;
	movlw	(05h)
	movwf	(23)	;volatile
	line	128
	
l883:	
;LE4-6.c: 128: CCP1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7	;volatile
	line	129
	
l885:	
;LE4-6.c: 129: CCP1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7	;volatile
	line	130
	
l887:	
;LE4-6.c: 130: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	131
	
l889:	
;LE4-6.c: 131: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	132
	
l891:	
;LE4-6.c: 132: TMR1ON = 1;
	bsf	(128/8),(128)&7	;volatile
	line	134
	
l893:	
;LE4-6.c: 134: initLCD();
	fcall	_initLCD
	line	136
	
l895:	
;LE4-6.c: 136: instCtrl(0x80);
	movlw	(080h)
	fcall	_instCtrl
	line	137
	
l897:	
;LE4-6.c: 137: printString("Period:");
	movlw	low((STR_1)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	goto	l899
	line	140
;LE4-6.c: 139: for(;;)
	
l80:	
	line	141
	
l899:	
;LE4-6.c: 140: {
;LE4-6.c: 141: instCtrl(0xC0);
	movlw	(0C0h)
	fcall	_instCtrl
	line	144
	
l901:	
;LE4-6.c: 144: printString("                    ");
	movlw	low((STR_2)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	line	146
	
l903:	
;LE4-6.c: 146: instCtrl(0xC0);
	movlw	(0C0h)
	fcall	_instCtrl
	line	148
	
l905:	
;LE4-6.c: 148: printNumber(period);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_period+1),w	;volatile
	clrf	(printNumber@num+1)
	addwf	(printNumber@num+1)
	movf	(_period),w	;volatile
	clrf	(printNumber@num)
	addwf	(printNumber@num)

	fcall	_printNumber
	line	149
	
l907:	
;LE4-6.c: 149: printString(" ms");
	movlw	low((STR_3)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	line	151
	
l909:	
;LE4-6.c: 151: delay(20);
	movlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(delay@ms)
	movlw	high(014h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	152
;LE4-6.c: 152: }
	goto	l899
	
l81:	
	line	153
	
l82:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_printNumber

;; *************** function _printNumber *****************
;; Defined at:
;;		line 80 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  num             2    9[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  buffer          6   12[BANK0 ] unsigned char [6]
;;  i               2   18[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_printString
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1
	line	80
global __ptext1
__ptext1:	;psect for function _printNumber
psect	text1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	80
	global	__size_of_printNumber
	__size_of_printNumber	equ	__end_of_printNumber-_printNumber
	
_printNumber:	
;incstack = 0
	opt	stack 2
; Regs used in _printNumber: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	82
	
l819:	
;LE4-6.c: 81: char buffer[6];
;LE4-6.c: 82: int i = 5;
	movlw	low(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printNumber@i)
	movlw	high(05h)
	movwf	((printNumber@i))+1
	line	84
	
l821:	
;LE4-6.c: 84: buffer[--i] = '\0';
	movlw	low(-1)
	addwf	(printNumber@i),f
	skipnc
	incf	(printNumber@i+1),f
	movlw	high(-1)
	addwf	(printNumber@i+1),f
	movf	((printNumber@i)),w
	addlw	printNumber@buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	87
	
l823:	
;LE4-6.c: 87: if (num == 0) {
	movf	((printNumber@num+1)),w
	iorwf	((printNumber@num)),w
	skipz
	goto	u461
	goto	u460
u461:
	goto	l831
u460:
	line	88
	
l825:	
;LE4-6.c: 88: buffer[--i] = '0';
	movlw	(030h)
	movwf	(??_printNumber+0)+0
	movlw	low(-1)
	addwf	(printNumber@i),f
	skipnc
	incf	(printNumber@i+1),f
	movlw	high(-1)
	addwf	(printNumber@i+1),f
	movf	((printNumber@i)),w
	addlw	printNumber@buffer&0ffh
	movwf	fsr0
	movf	(??_printNumber+0)+0,w
	movwf	indf
	line	89
;LE4-6.c: 89: } else {
	goto	l835
	
l66:	
	line	90
;LE4-6.c: 90: while (num > 0 && i > 0) {
	goto	l831
	
l69:	
	line	91
	
l827:	
;LE4-6.c: 91: buffer[--i] = (num % 10) + '0';
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lwmod@divisor)
	movlw	high(0Ah)
	movwf	((___lwmod@divisor))+1
	movf	(printNumber@num+1),w
	clrf	(___lwmod@dividend+1)
	addwf	(___lwmod@dividend+1)
	movf	(printNumber@num),w
	clrf	(___lwmod@dividend)
	addwf	(___lwmod@dividend)

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(??_printNumber+0)+0
	movlw	low(-1)
	addwf	(printNumber@i),f
	skipnc
	incf	(printNumber@i+1),f
	movlw	high(-1)
	addwf	(printNumber@i+1),f
	movf	((printNumber@i)),w
	addlw	printNumber@buffer&0ffh
	movwf	fsr0
	movf	(??_printNumber+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	92
	
l829:	
;LE4-6.c: 92: num /= 10;
	movlw	low(0Ah)
	movwf	(___lwdiv@divisor)
	movlw	high(0Ah)
	movwf	((___lwdiv@divisor))+1
	movf	(printNumber@num+1),w
	clrf	(___lwdiv@dividend+1)
	addwf	(___lwdiv@dividend+1)
	movf	(printNumber@num),w
	clrf	(___lwdiv@dividend)
	addwf	(___lwdiv@dividend)

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(printNumber@num+1)
	addwf	(printNumber@num+1)
	movf	(0+(?___lwdiv)),w
	clrf	(printNumber@num)
	addwf	(printNumber@num)

	goto	l831
	line	93
	
l68:	
	line	90
	
l831:	
	movf	(printNumber@num+1),w
	iorwf	(printNumber@num),w
	skipnz
	goto	u471
	goto	u470
u471:
	goto	l835
u470:
	
l833:	
	movf	(printNumber@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u485
	movlw	low(01h)
	subwf	(printNumber@i),w
u485:

	skipnc
	goto	u481
	goto	u480
u481:
	goto	l827
u480:
	goto	l835
	
l71:	
	goto	l835
	
l72:	
	goto	l835
	line	94
	
l67:	
	line	97
	
l835:	
;LE4-6.c: 93: }
;LE4-6.c: 94: }
;LE4-6.c: 97: printString(&buffer[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printNumber@i),w
	addlw	printNumber@buffer&0ffh
	movwf	(printString@str)
	movlw	(0x0)
	movwf	(printString@str+1)
	fcall	_printString
	line	98
	
l73:	
	return
	opt stack 0
GLOBAL	__end_of_printNumber
	__end_of_printNumber:
	signat	_printNumber,4216
	global	_printString

;; *************** function _printString *****************
;; Defined at:
;;		line 74 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  str             2    7[BANK0 ] PTR const unsigned char 
;;		 -> STR_3(4), STR_2(21), STR_1(8), printNumber@buffer(6), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_dataCtrl
;; This function is called by:
;;		_printNumber
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	line	74
global __ptext2
__ptext2:	;psect for function _printString
psect	text2
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	74
	global	__size_of_printString
	__size_of_printString	equ	__end_of_printString-_printString
	
_printString:	
;incstack = 0
	opt	stack 3
; Regs used in _printString: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	75
	
l761:	
;LE4-6.c: 75: while(*str) {
	goto	l767
	
l61:	
	line	76
	
l763:	
;LE4-6.c: 76: dataCtrl(*str++);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printString@str+1),w
	movwf	btemp+1
	movf	(printString@str),w
	movwf	fsr0
	fcall	stringtab
	fcall	_dataCtrl
	
l765:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printString@str),f
	skipnc
	incf	(printString@str+1),f
	goto	l767
	line	77
	
l60:	
	line	75
	
l767:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printString@str+1),w
	movwf	btemp+1
	movf	(printString@str),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u321
	goto	u320
u321:
	goto	l763
u320:
	goto	l63
	
l62:	
	line	78
	
l63:	
	return
	opt stack 0
GLOBAL	__end_of_printString
	__end_of_printString:
	signat	_printString,4216
	global	_dataCtrl

;; *************** function _dataCtrl *****************
;; Defined at:
;;		line 58 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    6[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		_printString
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	line	58
global __ptext3
__ptext3:	;psect for function _dataCtrl
psect	text3
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	58
	global	__size_of_dataCtrl
	__size_of_dataCtrl	equ	__end_of_dataCtrl-_dataCtrl
	
_dataCtrl:	
;incstack = 0
	opt	stack 3
; Regs used in _dataCtrl: [wreg+status,2+status,0+pclath+cstack]
;dataCtrl@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dataCtrl@data)
	line	59
	
l737:	
;LE4-6.c: 59: PORTB = data;
	movf	(dataCtrl@data),w
	movwf	(6)	;volatile
	line	60
	
l739:	
;LE4-6.c: 60: RC5 = 1;
	bsf	(61/8),(61)&7	;volatile
	line	61
	
l741:	
;LE4-6.c: 61: RC7 = 0;
	bcf	(63/8),(63)&7	;volatile
	line	62
	
l743:	
;LE4-6.c: 62: RC6 = 1;
	bsf	(62/8),(62)&7	;volatile
	line	63
	
l745:	
;LE4-6.c: 63: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	64
	
l747:	
;LE4-6.c: 64: RC6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7	;volatile
	line	65
	
l49:	
	return
	opt stack 0
GLOBAL	__end_of_dataCtrl
	__end_of_dataCtrl:
	signat	_dataCtrl,4216
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printNumber
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
global __ptext4
__ptext4:	;psect for function ___lwmod
psect	text4
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 4
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
l795:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u401
	goto	u400
u401:
	goto	l813
u400:
	line	14
	
l797:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	l803
	
l507:	
	line	16
	
l799:	
	movlw	01h
	
u415:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u415
	line	17
	
l801:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l803
	line	18
	
l506:	
	line	15
	
l803:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u421
	goto	u420
u421:
	goto	l799
u420:
	goto	l805
	
l508:	
	goto	l805
	line	19
	
l509:	
	line	20
	
l805:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u435
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u435:
	skipc
	goto	u431
	goto	u430
u431:
	goto	l809
u430:
	line	21
	
l807:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l809
	
l510:	
	line	22
	
l809:	
	movlw	01h
	
u445:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u445
	line	23
	
l811:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u451
	goto	u450
u451:
	goto	l805
u450:
	goto	l813
	
l511:	
	goto	l813
	line	24
	
l505:	
	line	25
	
l813:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l512
	
l815:	
	line	26
	
l512:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK0 ] unsigned int 
;;  counter         1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printNumber
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
global __ptext5
__ptext5:	;psect for function ___lwdiv
psect	text5
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 4
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l769:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l771:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u331
	goto	u330
u331:
	goto	l791
u330:
	line	16
	
l773:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l779
	
l497:	
	line	18
	
l775:	
	movlw	01h
	
u345:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u345
	line	19
	
l777:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l779
	line	20
	
l496:	
	line	17
	
l779:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u351
	goto	u350
u351:
	goto	l775
u350:
	goto	l781
	
l498:	
	goto	l781
	line	21
	
l499:	
	line	22
	
l781:	
	movlw	01h
	
u365:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u365
	line	23
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u375
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u375:
	skipc
	goto	u371
	goto	u370
u371:
	goto	l787
u370:
	line	24
	
l783:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l785:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l787
	line	26
	
l500:	
	line	27
	
l787:	
	movlw	01h
	
u385:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u385
	line	28
	
l789:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u391
	goto	u390
u391:
	goto	l781
u390:
	goto	l791
	
l501:	
	goto	l791
	line	29
	
l495:	
	line	30
	
l791:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l502
	
l793:	
	line	31
	
l502:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_initLCD

;; *************** function _initLCD *****************
;; Defined at:
;;		line 48 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;;		_instCtrl
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	48
global __ptext6
__ptext6:	;psect for function _initLCD
psect	text6
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	48
	global	__size_of_initLCD
	__size_of_initLCD	equ	__end_of_initLCD-_initLCD
	
_initLCD:	
;incstack = 0
	opt	stack 3
; Regs used in _initLCD: [wreg+status,2+status,0+pclath+cstack]
	line	49
	
l817:	
;LE4-6.c: 49: delay(15);
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(delay@ms)
	movlw	high(0Fh)
	movwf	((delay@ms))+1
	fcall	_delay
	line	50
;LE4-6.c: 50: instCtrl(0x38);
	movlw	(038h)
	fcall	_instCtrl
	line	51
;LE4-6.c: 51: instCtrl(0x08);
	movlw	(08h)
	fcall	_instCtrl
	line	52
;LE4-6.c: 52: instCtrl(0x01);
	movlw	(01h)
	fcall	_instCtrl
	line	53
;LE4-6.c: 53: delay(2);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(delay@ms)
	movlw	high(02h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	54
;LE4-6.c: 54: instCtrl(0x06);
	movlw	(06h)
	fcall	_instCtrl
	line	55
;LE4-6.c: 55: instCtrl(0x0C);
	movlw	(0Ch)
	fcall	_instCtrl
	line	56
	
l46:	
	return
	opt stack 0
GLOBAL	__end_of_initLCD
	__end_of_initLCD:
	signat	_initLCD,88
	global	_instCtrl

;; *************** function _instCtrl *****************
;; Defined at:
;;		line 39 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    6[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		_initLCD
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1
	line	39
global __ptext7
__ptext7:	;psect for function _instCtrl
psect	text7
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	39
	global	__size_of_instCtrl
	__size_of_instCtrl	equ	__end_of_instCtrl-_instCtrl
	
_instCtrl:	
;incstack = 0
	opt	stack 4
; Regs used in _instCtrl: [wreg+status,2+status,0+pclath+cstack]
;instCtrl@cmd stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(instCtrl@cmd)
	line	40
	
l749:	
;LE4-6.c: 40: PORTB = cmd;
	movf	(instCtrl@cmd),w
	movwf	(6)	;volatile
	line	41
	
l751:	
;LE4-6.c: 41: RC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	42
	
l753:	
;LE4-6.c: 42: RC7 = 0;
	bcf	(63/8),(63)&7	;volatile
	line	43
	
l755:	
;LE4-6.c: 43: RC6 = 1;
	bsf	(62/8),(62)&7	;volatile
	line	44
	
l757:	
;LE4-6.c: 44: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	45
	
l759:	
;LE4-6.c: 45: RC6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7	;volatile
	line	46
	
l43:	
	return
	opt stack 0
GLOBAL	__end_of_instCtrl
	__end_of_instCtrl:
	signat	_instCtrl,4216
	global	_delay

;; *************** function _delay *****************
;; Defined at:
;;		line 67 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[BANK0 ] unsigned int 
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_instCtrl
;;		_initLCD
;;		_dataCtrl
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1
	line	67
global __ptext8
__ptext8:	;psect for function _delay
psect	text8
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	67
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
;incstack = 0
	opt	stack 3
; Regs used in _delay: [wreg+status,2]
	line	69
	
l725:	
;LE4-6.c: 68: unsigned int i, j;
;LE4-6.c: 69: for(i = 0; i < ms; i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l52
	
l53:	
	line	70
	
l727:	
;LE4-6.c: 70: for(j = 0; j < 1000; j++);
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l729:	
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u291
	goto	u290
u291:
	goto	l733
u290:
	goto	l735
	
l731:	
	goto	l735
	
l54:	
	
l733:	
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
	goto	u301
	goto	u300
u301:
	goto	l733
u300:
	goto	l735
	
l55:	
	line	69
	
l735:	
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
	goto	u315
	movf	(delay@ms),w
	subwf	(delay@i),w
u315:
	skipc
	goto	u311
	goto	u310
u311:
	goto	l727
u310:
	goto	l57
	
l56:	
	line	72
	
l57:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
	signat	_delay,4216
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 101 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
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
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___lwdiv
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1
	line	101
global __ptext9
__ptext9:	;psect for function _ISR
psect	text9
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	101
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 2
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+2)
	movf	fsr0,w
	movwf	(??_ISR+3)
	movf	pclath,w
	movwf	(??_ISR+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+5)
	ljmp	_ISR
psect	text9
	line	103
	
i1l863:	
;LE4-6.c: 103: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	104
;LE4-6.c: 104: if(CCP1IF==1)
	btfss	(98/8),(98)&7	;volatile
	goto	u56_21
	goto	u56_20
u56_21:
	goto	i1l875
u56_20:
	line	106
	
i1l865:	
;LE4-6.c: 105: {
;LE4-6.c: 106: CCP1IF = 0;
	bcf	(98/8),(98)&7	;volatile
	line	107
	
i1l867:	
;LE4-6.c: 107: TMR1 = 0;
	clrf	(14)	;volatile
	clrf	(14+1)	;volatile
	line	108
	
i1l869:	
;LE4-6.c: 108: RA0 = RA0^1;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	111
	
i1l871:	
;LE4-6.c: 111: period = CCPR1 * 8;
	movf	(21+1),w	;volatile
	movwf	(??_ISR+0)+0+1
	movf	(21),w	;volatile
	movwf	(??_ISR+0)+0
	clrc
	rlf	(??_ISR+0)+0,f
	rlf	(??_ISR+0)+1,f
	clrc
	rlf	(??_ISR+0)+0,f
	rlf	(??_ISR+0)+1,f
	clrc
	rlf	(??_ISR+0)+0,f
	rlf	(??_ISR+0)+1,f
	movf	0+(??_ISR+0)+0,w
	movwf	(_period)	;volatile
	movf	1+(??_ISR+0)+0,w
	movwf	(_period+1)	;volatile
	line	112
	
i1l873:	
;LE4-6.c: 112: period = period/1000;
	movlw	low(03E8h)
	movwf	(i1___lwdiv@divisor)
	movlw	high(03E8h)
	movwf	((i1___lwdiv@divisor))+1
	movf	(_period+1),w	;volatile
	clrf	(i1___lwdiv@dividend+1)
	addwf	(i1___lwdiv@dividend+1)
	movf	(_period),w	;volatile
	clrf	(i1___lwdiv@dividend)
	addwf	(i1___lwdiv@dividend)

	fcall	i1___lwdiv
	movf	(1+(?i1___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_period+1)	;volatile
	addwf	(_period+1)	;volatile
	movf	(0+(?i1___lwdiv)),w
	clrf	(_period)	;volatile
	addwf	(_period)	;volatile

	goto	i1l875
	line	115
	
i1l76:	
	line	116
	
i1l875:	
;LE4-6.c: 115: }
;LE4-6.c: 116: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	117
	
i1l77:	
	movf	(??_ISR+5),w
	movwf	btemp+1
	movf	(??_ISR+4),w
	movwf	pclath
	movf	(??_ISR+3),w
	movwf	fsr0
	swapf	(??_ISR+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,88
	global	i1___lwdiv

;; *************** function i1___lwdiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  __lwdiv         2    5[COMMON] unsigned int 
;;  __lwdiv         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
global __ptext10
__ptext10:	;psect for function i1___lwdiv
psect	text10
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
	global	__size_ofi1___lwdiv
	__size_ofi1___lwdiv	equ	__end_ofi1___lwdiv-i1___lwdiv
	
i1___lwdiv:	
;incstack = 0
	opt	stack 2
; Regs used in i1___lwdiv: [wreg+status,2+status,0]
	line	14
	
i1l837:	
	clrf	(i1___lwdiv@quotient)
	clrf	(i1___lwdiv@quotient+1)
	line	15
	
i1l839:	
	movf	(i1___lwdiv@divisor+1),w
	iorwf	(i1___lwdiv@divisor),w
	skipnz
	goto	u49_21
	goto	u49_20
u49_21:
	goto	i1l859
u49_20:
	line	16
	
i1l841:	
	clrf	(i1___lwdiv@counter)
	incf	(i1___lwdiv@counter),f
	line	17
	goto	i1l847
	
i1l497:	
	line	18
	
i1l843:	
	movlw	01h
	
u50_25:
	clrc
	rlf	(i1___lwdiv@divisor),f
	rlf	(i1___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u50_25
	line	19
	
i1l845:	
	movlw	(01h)
	movwf	(??i1___lwdiv+0)+0
	movf	(??i1___lwdiv+0)+0,w
	addwf	(i1___lwdiv@counter),f
	goto	i1l847
	line	20
	
i1l496:	
	line	17
	
i1l847:	
	btfss	(i1___lwdiv@divisor+1),(15)&7
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l843
u51_20:
	goto	i1l849
	
i1l498:	
	goto	i1l849
	line	21
	
i1l499:	
	line	22
	
i1l849:	
	movlw	01h
	
u52_25:
	clrc
	rlf	(i1___lwdiv@quotient),f
	rlf	(i1___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u52_25
	line	23
	movf	(i1___lwdiv@divisor+1),w
	subwf	(i1___lwdiv@dividend+1),w
	skipz
	goto	u53_25
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),w
u53_25:
	skipc
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l855
u53_20:
	line	24
	
i1l851:	
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),f
	movf	(i1___lwdiv@divisor+1),w
	skipc
	decf	(i1___lwdiv@dividend+1),f
	subwf	(i1___lwdiv@dividend+1),f
	line	25
	
i1l853:	
	bsf	(i1___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l855
	line	26
	
i1l500:	
	line	27
	
i1l855:	
	movlw	01h
	
u54_25:
	clrc
	rrf	(i1___lwdiv@divisor+1),f
	rrf	(i1___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u54_25
	line	28
	
i1l857:	
	movlw	low(01h)
	subwf	(i1___lwdiv@counter),f
	btfss	status,2
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l849
u55_20:
	goto	i1l859
	
i1l501:	
	goto	i1l859
	line	29
	
i1l495:	
	line	30
	
i1l859:	
	movf	(i1___lwdiv@quotient+1),w
	clrf	(?i1___lwdiv+1)
	addwf	(?i1___lwdiv+1)
	movf	(i1___lwdiv@quotient),w
	clrf	(?i1___lwdiv)
	addwf	(?i1___lwdiv)

	goto	i1l502
	
i1l861:	
	line	31
	
i1l502:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwdiv
	__end_ofi1___lwdiv:
	signat	i1___lwdiv,90
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
