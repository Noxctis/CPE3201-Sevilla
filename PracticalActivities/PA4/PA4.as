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
	FNCALL	_printNumber,_printString
	FNCALL	_printNumber,_sprintf
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
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
	global	_dpowers
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
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\doprnt.c"
	line	354
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global __end_of_dpowers
__end_of_dpowers:
	global	_dpowers
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
	global __stringdata
__stringdata:
	
STR_3:	
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
	
STR_2:	
	retlw	80	;'P'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_4:	
	retlw	32	;' '
	retlw	109	;'m'
	retlw	115	;'s'
	retlw	0
psect	strings
	
STR_1:	
	retlw	37	;'%'
	retlw	117	;'u'
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
	global	delay@ms
delay@ms:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
??_delay:	; 0 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	2
??___lwdiv:	; 0 bytes @ 0x4
	global	delay@j
delay@j:	; 2 bytes @ 0x4
	ds	1
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
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	1
??_printString:	; 0 bytes @ 0x9
	ds	1
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
??___lwmod:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0xE
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0xE
	ds	3
??_sprintf:	; 0 bytes @ 0x11
	ds	3
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x14
	ds	1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x15
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x16
	ds	4
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1A
	ds	1
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x1B
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x1C
	ds	1
?_printNumber:	; 0 bytes @ 0x1D
	global	printNumber@num
printNumber@num:	; 2 bytes @ 0x1D
	ds	2
??_printNumber:	; 0 bytes @ 0x1F
	ds	1
	global	printNumber@buffer
printNumber@buffer:	; 16 bytes @ 0x20
	ds	16
??_main:	; 0 bytes @ 0x30
;!
;!Data Sizes:
;!    Strings     36
;!    Constant    10
;!    Data        0
;!    BSS         2
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     48      50
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    sprintf@f	PTR const unsigned char  size(1) Largest target is 3
;!		 -> STR_1(CODE[3]), 
;!
;!    sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;!		 -> printNumber@buffer(BANK0[16]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(BANK0[2]), 
;!
;!    S92$_cp	PTR const unsigned char  size(1) Largest target is 0
;!
;!    _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;!
;!    printString@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> STR_4(CODE[4]), STR_3(CODE[21]), STR_2(CODE[8]), printNumber@buffer(BANK0[16]), 
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
;!    _printNumber->_sprintf
;!    _sprintf->___lwmod
;!    ___lwmod->___lwdiv
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
;! (0) _main                                                 0     0      0    3925
;!                              _delay
;!                            _initLCD
;!                           _instCtrl
;!                        _printNumber
;!                        _printString
;! ---------------------------------------------------------------------------------
;! (1) _printNumber                                         19    17      2    1817
;!                                             29 BANK0     19    17      2
;!                        _printString
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _sprintf                                             15    12      3    1054
;!                                             14 BANK0     15    12      3
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (3) ___lwmod                                              6     2      4     265
;!                                              8 BANK0      6     2      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___lwdiv                                              8     4      4     322
;!                                              0 BANK0      8     4      4
;! ---------------------------------------------------------------------------------
;! (1) _printString                                          2     0      2     636
;!                                              7 BANK0      2     0      2
;!                           _dataCtrl
;! ---------------------------------------------------------------------------------
;! (2) _dataCtrl                                             1     1      0     379
;!                                              6 BANK0      1     1      0
;!                              _delay
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
;!     _printString
;!       _dataCtrl
;!         _delay
;!     _sprintf
;!       ___lwdiv
;!       ___lwmod
;!         ___lwdiv (ARG)
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
;!ABS                  0      0      40       3        0.0%
;!BITBANK0            50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50     30      32       5       62.5%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!BANK3               60      0       0       9        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!BANK2               60      0       0      11        0.0%
;!DATA                 0      0      40      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 103 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
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
	line	103
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	103
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	105
	
l965:	
;LE4-6.c: 105: ADCON1 = 0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	106
	
l967:	
;LE4-6.c: 106: TRISB = 0x00;
	clrf	(134)^080h	;volatile
	line	107
	
l969:	
;LE4-6.c: 107: TRISA = 0x00;
	clrf	(133)^080h	;volatile
	line	108
;LE4-6.c: 108: TRISC = 0x04;
	movlw	(04h)
	movwf	(135)^080h	;volatile
	line	110
;LE4-6.c: 110: T1CON = 0x30;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	111
;LE4-6.c: 111: CCP1CON = 0x05;
	movlw	(05h)
	movwf	(23)	;volatile
	line	112
	
l971:	
;LE4-6.c: 112: CCP1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7	;volatile
	line	113
	
l973:	
;LE4-6.c: 113: CCP1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7	;volatile
	line	114
	
l975:	
;LE4-6.c: 114: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	115
	
l977:	
;LE4-6.c: 115: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	116
	
l979:	
;LE4-6.c: 116: TMR1ON = 1;
	bsf	(128/8),(128)&7	;volatile
	line	118
	
l981:	
;LE4-6.c: 118: initLCD();
	fcall	_initLCD
	line	120
	
l983:	
;LE4-6.c: 120: instCtrl(0x80);
	movlw	(080h)
	fcall	_instCtrl
	line	121
	
l985:	
;LE4-6.c: 121: printString("Period:");
	movlw	low((STR_2)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	goto	l987
	line	124
;LE4-6.c: 123: for(;;)
	
l75:	
	line	125
	
l987:	
;LE4-6.c: 124: {
;LE4-6.c: 125: instCtrl(0xC0);
	movlw	(0C0h)
	fcall	_instCtrl
	line	128
	
l989:	
;LE4-6.c: 128: printString("                    ");
	movlw	low((STR_3)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	line	130
	
l991:	
;LE4-6.c: 130: instCtrl(0xC0);
	movlw	(0C0h)
	fcall	_instCtrl
	line	132
	
l993:	
;LE4-6.c: 132: printNumber(period);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_period+1),w	;volatile
	clrf	(printNumber@num+1)
	addwf	(printNumber@num+1)
	movf	(_period),w	;volatile
	clrf	(printNumber@num)
	addwf	(printNumber@num)

	fcall	_printNumber
	line	133
	
l995:	
;LE4-6.c: 133: printString(" ms");
	movlw	low((STR_4)-__stringbase)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	80h
	movwf	(printString@str+1)
	fcall	_printString
	line	135
	
l997:	
;LE4-6.c: 135: delay(20);
	movlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(delay@ms)
	movlw	high(014h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	136
;LE4-6.c: 136: }
	goto	l987
	
l76:	
	line	137
	
l77:	
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
;;  num             2   29[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  buffer         16   32[BANK0 ] unsigned char [16]
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
;;      Locals:         0      16       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      19       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_printString
;;		_sprintf
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
	
l923:	
;LE4-6.c: 81: char buffer[16];
;LE4-6.c: 82: sprintf(buffer, "%u", num);
	movlw	((STR_1)-__stringbase)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_printNumber+0)+0
	movf	(??_printNumber+0)+0,w
	movwf	(sprintf@f)
	movf	(printNumber@num+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(printNumber@num),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movlw	(printNumber@buffer)&0ffh
	fcall	_sprintf
	line	83
;LE4-6.c: 83: printString(buffer);
	movlw	(printNumber@buffer&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(printString@str)
	movlw	(0x0)
	movwf	(printString@str+1)
	fcall	_printString
	line	84
	
l68:	
	return
	opt stack 0
GLOBAL	__end_of_printNumber
	__end_of_printNumber:
	signat	_printNumber,4216
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 492 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> printNumber@buffer(16), 
;;  f               1   14[BANK0 ] PTR const unsigned char 
;;		 -> STR_1(3), 
;; Auto vars:     Size  Location     Type
;;  sp              1   27[BANK0 ] PTR unsigned char 
;;		 -> printNumber@buffer(16), 
;;  _val            4   22[BANK0 ] struct .
;;  c               1   28[BANK0 ] char 
;;  prec            1   26[BANK0 ] char 
;;  ap              1   21[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  flag            1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_printNumber
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\doprnt.c"
	line	492
global __ptext2
__ptext2:	;psect for function _sprintf
psect	text2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\doprnt.c"
	line	492
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
;incstack = 0
	opt	stack 3
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	line	542
	
l871:	
;doprnt.c: 494: va_list ap;
;doprnt.c: 499: signed char c;
;doprnt.c: 506: signed char prec;
;doprnt.c: 508: unsigned char flag;
;doprnt.c: 527: union {
;doprnt.c: 528: unsigned int _val;
;doprnt.c: 529: struct {
;doprnt.c: 530: const char * _cp;
;doprnt.c: 531: unsigned _len;
;doprnt.c: 532: } _str;
;doprnt.c: 533: } _val;
;doprnt.c: 542: *ap = __va_start();
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	545
;doprnt.c: 545: while(c = *f++) {
	goto	l915
	
l87:	
	line	547
	
l873:	
;doprnt.c: 547: if(c != '%')
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u491
	goto	u490
u491:
	goto	l879
u490:
	line	550
	
l875:	
;doprnt.c: 549: {
;doprnt.c: 550: ((*sp++ = (c)));
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l877:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	551
;doprnt.c: 551: continue;
	goto	l915
	line	552
	
l88:	
	line	557
	
l879:	
;doprnt.c: 552: }
;doprnt.c: 557: flag = 0;
	clrf	(sprintf@flag)
	line	644
;doprnt.c: 644: switch(c = *f++) {
	goto	l885
	line	646
;doprnt.c: 646: case 0:
	
l90:	
	line	647
;doprnt.c: 647: goto alldone;
	goto	l917
	line	811
;doprnt.c: 811: default:
	
l92:	
	line	822
;doprnt.c: 822: continue;
	goto	l915
	line	826
;doprnt.c: 826: case 'u':
	
l93:	
	line	827
	
l881:	
;doprnt.c: 827: flag |= 0xC0;
	movlw	(0C0h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	828
;doprnt.c: 828: break;
	goto	l887
	line	831
	
l883:	
;doprnt.c: 831: }
	goto	l887
	line	644
	
l89:	
	
l885:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 117
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l917
	xorlw	117^0	; case 117
	skipnz
	goto	l881
	goto	l915
	opt asmopt_on

	line	831
	
l94:	
	line	1295
	
l887:	
;doprnt.c: 1282: {
;doprnt.c: 1295: _val._val = (*(unsigned *)__va_arg((*(unsigned **)ap), (unsigned)0));
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l889:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1314
	
l891:	
;doprnt.c: 1296: }
;doprnt.c: 1314: for(c = 1 ; c != sizeof dpowers/sizeof dpowers[0] ; c++)
	clrf	(sprintf@c)
	incf	(sprintf@c),f
	
l893:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u501
	goto	u500
u501:
	goto	l897
u500:
	goto	l905
	
l895:	
	goto	l905
	line	1315
	
l95:	
	
l897:	
;doprnt.c: 1315: if(_val._val < dpowers[c])
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers)-__stringbase)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u515
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u515:
	skipnc
	goto	u511
	goto	u510
u511:
	goto	l901
u510:
	goto	l905
	line	1316
	
l899:	
;doprnt.c: 1316: break;
	goto	l905
	
l97:	
	line	1314
	
l901:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l903:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u521
	goto	u520
u521:
	goto	l897
u520:
	goto	l905
	
l96:	
	line	1481
	
l905:	
;doprnt.c: 1431: {
;doprnt.c: 1478: }
;doprnt.c: 1481: prec = c;
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1483
;doprnt.c: 1483: while(prec--) {
	goto	l913
	
l99:	
	line	1498
	
l907:	
;doprnt.c: 1487: {
;doprnt.c: 1498: c = (_val._val / dpowers[prec]) % 10 + '0';
	movlw	low(0Ah)
	movwf	(___lwmod@divisor)
	movlw	high(0Ah)
	movwf	((___lwmod@divisor))+1
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers)-__stringbase)
	movwf	fsr0
	fcall	stringdir
	movwf	(___lwdiv@divisor)
	fcall	stringdir
	movwf	(___lwdiv@divisor+1)
	movf	(sprintf@_val+1),w
	clrf	(___lwdiv@dividend+1)
	addwf	(___lwdiv@dividend+1)
	movf	(sprintf@_val),w
	clrf	(___lwdiv@dividend)
	addwf	(___lwdiv@dividend)

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(___lwmod@dividend+1)
	addwf	(___lwmod@dividend+1)
	movf	(0+(?___lwdiv)),w
	clrf	(___lwmod@dividend)
	addwf	(___lwmod@dividend)

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1533
	
l909:	
;doprnt.c: 1532: }
;doprnt.c: 1533: ((*sp++ = (c)));
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l911:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l913
	line	1534
	
l98:	
	line	1483
	
l913:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u531
	goto	u530
u531:
	goto	l907
u530:
	goto	l915
	
l100:	
	goto	l915
	line	1542
	
l86:	
	line	545
	
l915:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u541
	goto	u540
u541:
	goto	l873
u540:
	goto	l917
	
l101:	
	goto	l917
	line	1544
;doprnt.c: 1534: }
;doprnt.c: 1542: }
;doprnt.c: 1544: alldone:
	
l91:	
	line	1547
	
l917:	
;doprnt.c: 1547: *sp = 0;
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l102
	line	1549
	
l919:	
	line	1550
;doprnt.c: 1549: return 0;
;	Return value of _sprintf is never used
	
l102:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
	signat	_sprintf,4698
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[BANK0 ] unsigned int 
;;  dividend        2   10[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[BANK0 ] unsigned int 
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
global __ptext3
__ptext3:	;psect for function ___lwmod
psect	text3
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
l829:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u421
	goto	u420
u421:
	goto	l847
u420:
	line	14
	
l831:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	l837
	
l527:	
	line	16
	
l833:	
	movlw	01h
	
u435:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u435
	line	17
	
l835:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l837
	line	18
	
l526:	
	line	15
	
l837:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u441
	goto	u440
u441:
	goto	l833
u440:
	goto	l839
	
l528:	
	goto	l839
	line	19
	
l529:	
	line	20
	
l839:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u455
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u455:
	skipc
	goto	u451
	goto	u450
u451:
	goto	l843
u450:
	line	21
	
l841:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l843
	
l530:	
	line	22
	
l843:	
	movlw	01h
	
u465:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u465
	line	23
	
l845:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u471
	goto	u470
u471:
	goto	l839
u470:
	goto	l847
	
l531:	
	goto	l847
	line	24
	
l525:	
	line	25
	
l847:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l532
	
l849:	
	line	26
	
l532:	
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
global __ptext4
__ptext4:	;psect for function ___lwdiv
psect	text4
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l803:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l805:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u351
	goto	u350
u351:
	goto	l825
u350:
	line	16
	
l807:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l813
	
l517:	
	line	18
	
l809:	
	movlw	01h
	
u365:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u365
	line	19
	
l811:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l813
	line	20
	
l516:	
	line	17
	
l813:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u371
	goto	u370
u371:
	goto	l809
u370:
	goto	l815
	
l518:	
	goto	l815
	line	21
	
l519:	
	line	22
	
l815:	
	movlw	01h
	
u385:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u385
	line	23
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u395
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u395:
	skipc
	goto	u391
	goto	u390
u391:
	goto	l821
u390:
	line	24
	
l817:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l819:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l821
	line	26
	
l520:	
	line	27
	
l821:	
	movlw	01h
	
u405:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u405
	line	28
	
l823:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u411
	goto	u410
u411:
	goto	l815
u410:
	goto	l825
	
l521:	
	goto	l825
	line	29
	
l515:	
	line	30
	
l825:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l522
	
l827:	
	line	31
	
l522:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_printString

;; *************** function _printString *****************
;; Defined at:
;;		line 74 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
;; Parameters:    Size  Location     Type
;;  str             2    7[BANK0 ] PTR const unsigned char 
;;		 -> STR_4(4), STR_3(21), STR_2(8), printNumber@buffer(16), 
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
psect	text5,local,class=CODE,delta=2,merge=1
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	74
global __ptext5
__ptext5:	;psect for function _printString
psect	text5
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	74
	global	__size_of_printString
	__size_of_printString	equ	__end_of_printString-_printString
	
_printString:	
;incstack = 0
	opt	stack 3
; Regs used in _printString: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	75
	
l863:	
;LE4-6.c: 75: while(*str) {
	goto	l869
	
l63:	
	line	76
	
l865:	
;LE4-6.c: 76: dataCtrl(*str++);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printString@str+1),w
	movwf	btemp+1
	movf	(printString@str),w
	movwf	fsr0
	fcall	stringtab
	fcall	_dataCtrl
	
l867:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printString@str),f
	skipnc
	incf	(printString@str+1),f
	goto	l869
	line	77
	
l62:	
	line	75
	
l869:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printString@str+1),w
	movwf	btemp+1
	movf	(printString@str),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u481
	goto	u480
u481:
	goto	l865
u480:
	goto	l65
	
l64:	
	line	78
	
l65:	
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
psect	text6,local,class=CODE,delta=2,merge=1
	line	58
global __ptext6
__ptext6:	;psect for function _dataCtrl
psect	text6
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
	
l791:	
;LE4-6.c: 59: PORTB = data;
	movf	(dataCtrl@data),w
	movwf	(6)	;volatile
	line	60
	
l793:	
;LE4-6.c: 60: RC5 = 1;
	bsf	(61/8),(61)&7	;volatile
	line	61
	
l795:	
;LE4-6.c: 61: RC7 = 0;
	bcf	(63/8),(63)&7	;volatile
	line	62
	
l797:	
;LE4-6.c: 62: RC6 = 1;
	bsf	(62/8),(62)&7	;volatile
	line	63
	
l799:	
;LE4-6.c: 63: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	64
	
l801:	
;LE4-6.c: 64: RC6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7	;volatile
	line	65
	
l51:	
	return
	opt stack 0
GLOBAL	__end_of_dataCtrl
	__end_of_dataCtrl:
	signat	_dataCtrl,4216
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
psect	text7,local,class=CODE,delta=2,merge=1
	line	48
global __ptext7
__ptext7:	;psect for function _initLCD
psect	text7
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	48
	global	__size_of_initLCD
	__size_of_initLCD	equ	__end_of_initLCD-_initLCD
	
_initLCD:	
;incstack = 0
	opt	stack 3
; Regs used in _initLCD: [wreg+status,2+status,0+pclath+cstack]
	line	49
	
l921:	
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
	
l48:	
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
psect	text8,local,class=CODE,delta=2,merge=1
	line	39
global __ptext8
__ptext8:	;psect for function _instCtrl
psect	text8
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
	
l851:	
;LE4-6.c: 40: PORTB = cmd;
	movf	(instCtrl@cmd),w
	movwf	(6)	;volatile
	line	41
	
l853:	
;LE4-6.c: 41: RC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	42
	
l855:	
;LE4-6.c: 42: RC7 = 0;
	bcf	(63/8),(63)&7	;volatile
	line	43
	
l857:	
;LE4-6.c: 43: RC6 = 1;
	bsf	(62/8),(62)&7	;volatile
	line	44
	
l859:	
;LE4-6.c: 44: delay(1);
	movlw	low(01h)
	movwf	(delay@ms)
	movlw	high(01h)
	movwf	((delay@ms))+1
	fcall	_delay
	line	45
	
l861:	
;LE4-6.c: 45: RC6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7	;volatile
	line	46
	
l45:	
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
psect	text9,local,class=CODE,delta=2,merge=1
	line	67
global __ptext9
__ptext9:	;psect for function _delay
psect	text9
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	67
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
;incstack = 0
	opt	stack 3
; Regs used in _delay: [wreg+status,2]
	line	69
	
l779:	
;LE4-6.c: 68: unsigned int i, j;
;LE4-6.c: 69: for(i = 0; i < ms; i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l54
	
l55:	
	line	70
	
l781:	
;LE4-6.c: 70: for(j = 0; j < 1000; j++);
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l783:	
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u321
	goto	u320
u321:
	goto	l787
u320:
	goto	l789
	
l785:	
	goto	l789
	
l56:	
	
l787:	
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
	goto	u331
	goto	u330
u331:
	goto	l787
u330:
	goto	l789
	
l57:	
	line	69
	
l789:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l54:	
	movf	(delay@ms+1),w
	subwf	(delay@i+1),w
	skipz
	goto	u345
	movf	(delay@ms),w
	subwf	(delay@i),w
u345:
	skipc
	goto	u341
	goto	u340
u341:
	goto	l781
u340:
	goto	l59
	
l58:	
	line	72
	
l59:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
	signat	_delay,4216
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 87 in file "Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
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
psect	text10,local,class=CODE,delta=2,merge=1
	line	87
global __ptext10
__ptext10:	;psect for function _ISR
psect	text10
	file	"Z:\CPE3201-Sevilla\PracticalActivities\PA4\LE4-6.c"
	line	87
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
psect	text10
	line	89
	
i1l951:	
;LE4-6.c: 89: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	90
;LE4-6.c: 90: if(CCP1IF==1)
	btfss	(98/8),(98)&7	;volatile
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l963
u62_20:
	line	92
	
i1l953:	
;LE4-6.c: 91: {
;LE4-6.c: 92: CCP1IF = 0;
	bcf	(98/8),(98)&7	;volatile
	line	93
	
i1l955:	
;LE4-6.c: 93: TMR1 = 0;
	clrf	(14)	;volatile
	clrf	(14+1)	;volatile
	line	94
	
i1l957:	
;LE4-6.c: 94: RA0 = RA0^1;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	97
	
i1l959:	
;LE4-6.c: 97: period = CCPR1 * 8;
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
	line	98
	
i1l961:	
;LE4-6.c: 98: period = CCPR1/1000;
	movlw	low(03E8h)
	movwf	(i1___lwdiv@divisor)
	movlw	high(03E8h)
	movwf	((i1___lwdiv@divisor))+1
	movf	(21+1),w	;volatile
	clrf	(i1___lwdiv@dividend+1)
	addwf	(i1___lwdiv@dividend+1)
	movf	(21),w	;volatile
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

	goto	i1l963
	line	99
	
i1l71:	
	line	100
	
i1l963:	
;LE4-6.c: 99: }
;LE4-6.c: 100: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	101
	
i1l72:	
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
psect	text11,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
global __ptext11
__ptext11:	;psect for function i1___lwdiv
psect	text11
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwdiv.c"
	line	6
	global	__size_ofi1___lwdiv
	__size_ofi1___lwdiv	equ	__end_ofi1___lwdiv-i1___lwdiv
	
i1___lwdiv:	
;incstack = 0
	opt	stack 2
; Regs used in i1___lwdiv: [wreg+status,2+status,0]
	line	14
	
i1l925:	
	clrf	(i1___lwdiv@quotient)
	clrf	(i1___lwdiv@quotient+1)
	line	15
	
i1l927:	
	movf	(i1___lwdiv@divisor+1),w
	iorwf	(i1___lwdiv@divisor),w
	skipnz
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l947
u55_20:
	line	16
	
i1l929:	
	clrf	(i1___lwdiv@counter)
	incf	(i1___lwdiv@counter),f
	line	17
	goto	i1l935
	
i1l517:	
	line	18
	
i1l931:	
	movlw	01h
	
u56_25:
	clrc
	rlf	(i1___lwdiv@divisor),f
	rlf	(i1___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u56_25
	line	19
	
i1l933:	
	movlw	(01h)
	movwf	(??i1___lwdiv+0)+0
	movf	(??i1___lwdiv+0)+0,w
	addwf	(i1___lwdiv@counter),f
	goto	i1l935
	line	20
	
i1l516:	
	line	17
	
i1l935:	
	btfss	(i1___lwdiv@divisor+1),(15)&7
	goto	u57_21
	goto	u57_20
u57_21:
	goto	i1l931
u57_20:
	goto	i1l937
	
i1l518:	
	goto	i1l937
	line	21
	
i1l519:	
	line	22
	
i1l937:	
	movlw	01h
	
u58_25:
	clrc
	rlf	(i1___lwdiv@quotient),f
	rlf	(i1___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u58_25
	line	23
	movf	(i1___lwdiv@divisor+1),w
	subwf	(i1___lwdiv@dividend+1),w
	skipz
	goto	u59_25
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),w
u59_25:
	skipc
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l943
u59_20:
	line	24
	
i1l939:	
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),f
	movf	(i1___lwdiv@divisor+1),w
	skipc
	decf	(i1___lwdiv@dividend+1),f
	subwf	(i1___lwdiv@dividend+1),f
	line	25
	
i1l941:	
	bsf	(i1___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l943
	line	26
	
i1l520:	
	line	27
	
i1l943:	
	movlw	01h
	
u60_25:
	clrc
	rrf	(i1___lwdiv@divisor+1),f
	rrf	(i1___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u60_25
	line	28
	
i1l945:	
	movlw	low(01h)
	subwf	(i1___lwdiv@counter),f
	btfss	status,2
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l937
u61_20:
	goto	i1l947
	
i1l521:	
	goto	i1l947
	line	29
	
i1l515:	
	line	30
	
i1l947:	
	movf	(i1___lwdiv@quotient+1),w
	clrf	(?i1___lwdiv+1)
	addwf	(?i1___lwdiv+1)
	movf	(i1___lwdiv@quotient),w
	clrf	(?i1___lwdiv)
	addwf	(?i1___lwdiv)

	goto	i1l522
	
i1l949:	
	line	31
	
i1l522:	
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
