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
	FNCALL	_main,___aldiv
	FNCALL	_main,___wmul
	FNCALL	_main,_init_adc
	FNCALL	_main,_init_io
	FNCALL	_main,_read_adc
	FNCALL	_main,_set_motors
	FNROOT	_main
	global	_last_direction
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	32

;initializer for _last_direction
	retlw	01h
	global	_s
	global	_threshold
	global	_gap_counter
	global	_ADCON0
_ADCON0	set	0x1F
	global	_ADRESH
_ADRESH	set	0x1E
	global	_CCPR1L
_CCPR1L	set	0x15
	global	_CCPR2L
_CCPR2L	set	0x1B
	global	_PORTD
_PORTD	set	0x8
	global	_GO_nDONE
_GO_nDONE	set	0xFA
	global	_RD0
_RD0	set	0x40
	global	_RD1
_RD1	set	0x41
	global	_RD2
_RD2	set	0x42
	global	_RD3
_RD3	set	0x43
	global	_ADCON1
_ADCON1	set	0x9F
	global	_ADRESL
_ADRESL	set	0x9E
	global	_TRISA
_TRISA	set	0x85
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
	file	"Arnold.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_s:
       ds      16

_threshold:
       ds      16

_gap_counter:
       ds      1

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	32
_last_direction:
       ds      1

	file	"Arnold.as"
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+021h)
	fcall	clear_ram0
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_init_io:	; 0 bytes @ 0x0
??_init_io:	; 0 bytes @ 0x0
?_init_adc:	; 0 bytes @ 0x0
??_init_adc:	; 0 bytes @ 0x0
?_set_motors:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
	global	?_read_adc
?_read_adc:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	set_motors@left
set_motors@left:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	2
??_read_adc:	; 0 bytes @ 0x2
	global	set_motors@right
set_motors@right:	; 2 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
??_set_motors:	; 0 bytes @ 0x4
??___wmul:	; 0 bytes @ 0x4
	global	read_adc@channel
read_adc@channel:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	4
??___aldiv:	; 0 bytes @ 0x8
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x0
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0x2
	ds	4
??_main:	; 0 bytes @ 0x6
	ds	6
	global	main@left_motor
main@left_motor:	; 2 bytes @ 0xC
	ds	2
	global	main@right_motor
main@right_motor:	; 2 bytes @ 0xE
	ds	2
	global	main@weighted
main@weighted:	; 4 bytes @ 0x10
	ds	4
	global	main@sum
main@sum:	; 4 bytes @ 0x14
	ds	4
	global	main@error
main@error:	; 2 bytes @ 0x18
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0x1A
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        1
;!    BSS         33
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      9       9
;!    BANK0            80     27      61
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
;!    _main->___aldiv
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->___aldiv
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
;;Main: autosize = 0, tempsize = 6, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                21    21      0    1917
;!                                              6 BANK0     21    21      0
;!                            ___aldiv
;!                             ___wmul
;!                           _init_adc
;!                            _init_io
;!                           _read_adc
;!                         _set_motors
;! ---------------------------------------------------------------------------------
;! (1) _set_motors                                           4     0      4     710
;!                                              0 COMMON     4     0      4
;! ---------------------------------------------------------------------------------
;! (1) _read_adc                                             5     3      2      22
;!                                              0 COMMON     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _init_io                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _init_adc                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) ___wmul                                               6     2      4     304
;!                                              0 COMMON     6     2      4
;! ---------------------------------------------------------------------------------
;! (1) ___aldiv                                             15     7      8     406
;!                                              0 COMMON     9     1      8
;!                                              0 BANK0      6     6      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   ___aldiv
;!   ___wmul
;!   _init_adc
;!   _init_io
;!   _read_adc
;!   _set_motors
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               60      0       0       9        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               60      0       0      11        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     1B      3D       5       76.3%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      9       9       1       64.3%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      46      12        0.0%
;!ABS                  0      0      46       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 94 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  sum             4   20[BANK0 ] long 
;;  weighted        4   16[BANK0 ] long 
;;  error           2   24[BANK0 ] int 
;;  right_motor     2   14[BANK0 ] int 
;;  left_motor      2   12[BANK0 ] int 
;;  i               1   26[BANK0 ] unsigned char 
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
;;      Locals:         0      15       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         0      21       0       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___aldiv
;;		___wmul
;;		_init_adc
;;		_init_io
;;		_read_adc
;;		_set_motors
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	94
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	94
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	99
	
l803:	
;Arnold.c: 96: unsigned char i;
;Arnold.c: 97: int left_motor, right_motor;
;Arnold.c: 99: init_io();
	fcall	_init_io
	line	100
;Arnold.c: 100: init_adc();
	fcall	_init_adc
	line	103
	
l805:	
;Arnold.c: 103: for(i = 0; i < 8; i++) threshold[i] = 512;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	
l807:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u551
	goto	u550
u551:
	goto	l811
u550:
	goto	l817
	
l809:	
	goto	l817
	
l66:	
	
l811:	
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	_threshold&0ffh
	movwf	fsr0
	movlw	low(0200h)
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movlw	high(0200h)
	movwf	indf
	
l813:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l815:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u561
	goto	u560
u561:
	goto	l811
u560:
	goto	l817
	
l67:	
	goto	l817
	line	105
;Arnold.c: 105: while(1) {
	
l68:	
	line	108
	
l817:	
;Arnold.c: 108: for(i = 0; i < 8; i++) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	
l819:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l823
u570:
	goto	l829
	
l821:	
	goto	l829
	
l69:	
	line	109
	
l823:	
;Arnold.c: 109: s[i] = read_adc(i);
	movf	(main@i),w
	fcall	_read_adc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	_s&0ffh
	movwf	fsr0
	movf	(0+(?_read_adc)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_read_adc)),w
	movwf	indf
	line	108
	
l825:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l827:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u581
	goto	u580
u581:
	goto	l823
u580:
	goto	l829
	
l70:	
	line	114
	
l829:	
;Arnold.c: 110: }
;Arnold.c: 114: long sum = 0;
	movlw	0
	movwf	(main@sum+3)
	movlw	0
	movwf	(main@sum+2)
	movlw	0
	movwf	(main@sum+1)
	movlw	0
	movwf	(main@sum)

	line	115
;Arnold.c: 115: long weighted = 0;
	movlw	0
	movwf	(main@weighted+3)
	movlw	0
	movwf	(main@weighted+2)
	movlw	0
	movwf	(main@weighted+1)
	movlw	0
	movwf	(main@weighted)

	line	117
	
l831:	
;Arnold.c: 117: for(i = 0; i < 8; i++) {
	clrf	(main@i)
	
l833:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u591
	goto	u590
u591:
	goto	l837
u590:
	goto	l845
	
l835:	
	goto	l845
	
l71:	
	line	119
	
l837:	
;Arnold.c: 119: if(s[i] > threshold[i]) {
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	_s&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+1)+0+1
	movf	(main@i),w
	movwf	(??_main+3)+0
	addwf	(??_main+3)+0,w
	addlw	_threshold&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_main+4)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+4)+0+1
	movf	1+(??_main+1)+0,w
	subwf	1+(??_main+4)+0,w
	skipz
	goto	u605
	movf	0+(??_main+1)+0,w
	subwf	0+(??_main+4)+0,w
u605:
	skipnc
	goto	u601
	goto	u600
u601:
	goto	l841
u600:
	line	120
	
l839:	
;Arnold.c: 120: sum += 1;
	movlw	01h
	addwf	(main@sum),f
	movlw	0
	skipnc
movlw 1
	addwf	(main@sum+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(main@sum+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(main@sum+3),f
	line	121
;Arnold.c: 121: weighted += (i - 3);
	movf	(main@i),w
	addlw	low(-3)
	movwf	(??_main+0)+0
	movlw	high(-3)
	skipnc
	movlw	(high(-3)+1)&0ffh
	movwf	((??_main+0)+0)+1
	movf	0+(??_main+0)+0,w
	movwf	((??_main+2)+0)
	movf	1+(??_main+0)+0,w
	movwf	((??_main+2)+0+1)
	movlw	0
	btfsc	((??_main+2)+0+1),7
	movlw	255
	movwf	((??_main+2)+0+2)
	movwf	((??_main+2)+0+3)
	movf	0+(??_main+2)+0,w
	addwf	(main@weighted),f
	movf	1+(??_main+2)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u611
	addwf	(main@weighted+1),f
u611:
	movf	2+(??_main+2)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u612
	addwf	(main@weighted+2),f
u612:
	movf	3+(??_main+2)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u613
	addwf	(main@weighted+3),f
u613:

	goto	l841
	line	122
	
l73:	
	line	117
	
l841:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l843:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u621
	goto	u620
u621:
	goto	l837
u620:
	goto	l845
	
l72:	
	line	126
	
l845:	
;Arnold.c: 122: }
;Arnold.c: 123: }
;Arnold.c: 126: if(sum == 0) {
	movf	(main@sum+3),w
	iorwf	(main@sum+2),w
	iorwf	(main@sum+1),w
	iorwf	(main@sum),w
	skipz
	goto	u631
	goto	u630
u631:
	goto	l863
u630:
	line	129
	
l847:	
;Arnold.c: 129: gap_counter++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_gap_counter),f
	line	131
	
l849:	
;Arnold.c: 131: if(last_direction == -1) {
	movf	(_last_direction),w
	xorlw	-1
	skipz
	goto	u641
	goto	u640
u641:
	goto	l853
u640:
	line	132
	
l851:	
;Arnold.c: 132: set_motors(-120, 120);
	movlw	low(-120)
	movwf	(set_motors@left)
	movlw	high(-120)
	movwf	((set_motors@left))+1
	movlw	low(078h)
	movwf	(set_motors@right)
	movlw	high(078h)
	movwf	((set_motors@right))+1
	fcall	_set_motors
	line	133
;Arnold.c: 133: } else {
	goto	l855
	
l75:	
	line	134
	
l853:	
;Arnold.c: 134: set_motors(120, -120);
	movlw	low(078h)
	movwf	(set_motors@left)
	movlw	high(078h)
	movwf	((set_motors@left))+1
	movlw	low(-120)
	movwf	(set_motors@right)
	movlw	high(-120)
	movwf	((set_motors@right))+1
	fcall	_set_motors
	goto	l855
	line	135
	
l76:	
	line	137
	
l855:	
;Arnold.c: 135: }
;Arnold.c: 137: if(gap_counter > 15) {
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_gap_counter),w
	skipc
	goto	u651
	goto	u650
u651:
	goto	l817
u650:
	line	139
	
l857:	
;Arnold.c: 139: if(last_direction == -1) {
	movf	(_last_direction),w
	xorlw	-1
	skipz
	goto	u661
	goto	u660
u661:
	goto	l861
u660:
	line	140
	
l859:	
;Arnold.c: 140: set_motors(-180, 180);
	movlw	low(-180)
	movwf	(set_motors@left)
	movlw	high(-180)
	movwf	((set_motors@left))+1
	movlw	low(0B4h)
	movwf	(set_motors@right)
	movlw	high(0B4h)
	movwf	((set_motors@right))+1
	fcall	_set_motors
	line	141
;Arnold.c: 141: } else {
	goto	l817
	
l78:	
	line	142
	
l861:	
;Arnold.c: 142: set_motors(180, -180);
	movlw	low(0B4h)
	movwf	(set_motors@left)
	movlw	high(0B4h)
	movwf	((set_motors@left))+1
	movlw	low(-180)
	movwf	(set_motors@right)
	movlw	high(-180)
	movwf	((set_motors@right))+1
	fcall	_set_motors
	goto	l817
	line	143
	
l79:	
	goto	l817
	line	144
	
l77:	
	line	146
;Arnold.c: 143: }
;Arnold.c: 144: }
;Arnold.c: 146: continue;
	goto	l817
	line	147
	
l74:	
	line	149
	
l863:	
;Arnold.c: 147: }
;Arnold.c: 149: gap_counter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_gap_counter)
	line	152
	
l865:	
;Arnold.c: 152: int error = weighted / sum;
	movf	(main@sum+3),w
	movwf	(___aldiv@divisor+3)
	movf	(main@sum+2),w
	movwf	(___aldiv@divisor+2)
	movf	(main@sum+1),w
	movwf	(___aldiv@divisor+1)
	movf	(main@sum),w
	movwf	(___aldiv@divisor)

	movf	(main@weighted+3),w
	movwf	(___aldiv@dividend+3)
	movf	(main@weighted+2),w
	movwf	(___aldiv@dividend+2)
	movf	(main@weighted+1),w
	movwf	(___aldiv@dividend+1)
	movf	(main@weighted),w
	movwf	(___aldiv@dividend)

	fcall	___aldiv
	movf	1+(((0+(?___aldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@error+1)
	addwf	(main@error+1)
	movf	0+(((0+(?___aldiv)))),w
	clrf	(main@error)
	addwf	(main@error)

	line	154
	
l867:	
;Arnold.c: 154: left_motor = 90 - (error * 25);
	movf	(main@error+1),w
	clrf	(___wmul@multiplier+1)
	addwf	(___wmul@multiplier+1)
	movf	(main@error),w
	clrf	(___wmul@multiplier)
	addwf	(___wmul@multiplier)

	movlw	low(019h)
	movwf	(___wmul@multiplicand)
	movlw	high(019h)
	movwf	((___wmul@multiplicand))+1
	fcall	___wmul
	comf	(0+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	0+(??_main+0)+0,w
	addlw	low(05Ah)
	movwf	(main@left_motor)
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(05Ah)
	movwf	1+(main@left_motor)
	line	155
	
l869:	
;Arnold.c: 155: right_motor = 90 + (error * 25);
	movf	(main@error+1),w
	clrf	(___wmul@multiplier+1)
	addwf	(___wmul@multiplier+1)
	movf	(main@error),w
	clrf	(___wmul@multiplier)
	addwf	(___wmul@multiplier)

	movlw	low(019h)
	movwf	(___wmul@multiplicand)
	movlw	high(019h)
	movwf	((___wmul@multiplicand))+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@right_motor)
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(05Ah)
	movwf	1+(main@right_motor)
	line	158
	
l871:	
;Arnold.c: 158: if(error < -1) last_direction = -1;
	movf	(main@error+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-1))^80h
	subwf	btemp+1,w
	skipz
	goto	u675
	movlw	low(-1)
	subwf	(main@error),w
u675:

	skipnc
	goto	u671
	goto	u670
u671:
	goto	l875
u670:
	
l873:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_last_direction)
	decf	(_last_direction),f
	goto	l875
	
l81:	
	line	159
	
l875:	
;Arnold.c: 159: if(error > 1) last_direction = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@error+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u685
	movlw	low(02h)
	subwf	(main@error),w
u685:

	skipc
	goto	u681
	goto	u680
u681:
	goto	l879
u680:
	
l877:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_last_direction)
	incf	(_last_direction),f
	goto	l879
	
l82:	
	line	161
	
l879:	
;Arnold.c: 161: set_motors(left_motor, right_motor);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@left_motor+1),w
	clrf	(set_motors@left+1)
	addwf	(set_motors@left+1)
	movf	(main@left_motor),w
	clrf	(set_motors@left)
	addwf	(set_motors@left)

	movf	(main@right_motor+1),w
	clrf	(set_motors@right+1)
	addwf	(set_motors@right+1)
	movf	(main@right_motor),w
	clrf	(set_motors@right)
	addwf	(set_motors@right)

	fcall	_set_motors
	goto	l817
	line	162
	
l80:	
	line	105
	goto	l817
	
l83:	
	line	163
	
l84:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_set_motors

;; *************** function _set_motors *****************
;; Defined at:
;;		line 70 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
;; Parameters:    Size  Location     Type
;;  left            2    0[COMMON] int 
;;  right           2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1
	line	70
global __ptext1
__ptext1:	;psect for function _set_motors
psect	text1
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	70
	global	__size_of_set_motors
	__size_of_set_motors	equ	__end_of_set_motors-_set_motors
	
_set_motors:	
;incstack = 0
	opt	stack 7
; Regs used in _set_motors: [wreg+status,2+status,0+btemp+1]
	line	72
	
l731:	
;Arnold.c: 72: if(left >= 0) {
	btfsc	(set_motors@left+1),7
	goto	u371
	goto	u370
u371:
	goto	l57
u370:
	line	73
	
l733:	
;Arnold.c: 73: RD0 = 1; RD1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7	;volatile
	bcf	(65/8),(65)&7	;volatile
	line	74
;Arnold.c: 74: } else {
	goto	l737
	
l57:	
	line	75
;Arnold.c: 75: RD0 = 0; RD1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7	;volatile
	bsf	(65/8),(65)&7	;volatile
	line	76
	
l735:	
;Arnold.c: 76: left = -left;
	comf	(set_motors@left),f
	comf	(set_motors@left+1),f
	incf	(set_motors@left),f
	skipnz
	incf	(set_motors@left+1),f
	goto	l737
	line	77
	
l58:	
	line	79
	
l737:	
;Arnold.c: 77: }
;Arnold.c: 79: if(right >= 0) {
	btfsc	(set_motors@right+1),7
	goto	u381
	goto	u380
u381:
	goto	l59
u380:
	line	80
	
l739:	
;Arnold.c: 80: RD2 = 1; RD3 = 0;
	bsf	(66/8),(66)&7	;volatile
	bcf	(67/8),(67)&7	;volatile
	line	81
;Arnold.c: 81: } else {
	goto	l743
	
l59:	
	line	82
;Arnold.c: 82: RD2 = 0; RD3 = 1;
	bcf	(66/8),(66)&7	;volatile
	bsf	(67/8),(67)&7	;volatile
	line	83
	
l741:	
;Arnold.c: 83: right = -right;
	comf	(set_motors@right),f
	comf	(set_motors@right+1),f
	incf	(set_motors@right),f
	skipnz
	incf	(set_motors@right+1),f
	goto	l743
	line	84
	
l60:	
	line	86
	
l743:	
;Arnold.c: 84: }
;Arnold.c: 86: if(left > 255) left = 255;
	movf	(set_motors@left+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0100h))^80h
	subwf	btemp+1,w
	skipz
	goto	u395
	movlw	low(0100h)
	subwf	(set_motors@left),w
u395:

	skipc
	goto	u391
	goto	u390
u391:
	goto	l747
u390:
	
l745:	
	movlw	low(0FFh)
	movwf	(set_motors@left)
	movlw	high(0FFh)
	movwf	((set_motors@left))+1
	goto	l747
	
l61:	
	line	87
	
l747:	
;Arnold.c: 87: if(right > 255) right = 255;
	movf	(set_motors@right+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0100h))^80h
	subwf	btemp+1,w
	skipz
	goto	u405
	movlw	low(0100h)
	subwf	(set_motors@right),w
u405:

	skipc
	goto	u401
	goto	u400
u401:
	goto	l62
u400:
	
l749:	
	movlw	low(0FFh)
	movwf	(set_motors@right)
	movlw	high(0FFh)
	movwf	((set_motors@right))+1
	
l62:	
	line	89
;Arnold.c: 89: CCPR1L = left;
	movf	(set_motors@left),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	90
;Arnold.c: 90: CCPR2L = right;
	movf	(set_motors@right),w
	movwf	(27)	;volatile
	line	91
	
l63:	
	return
	opt stack 0
GLOBAL	__end_of_set_motors
	__end_of_set_motors:
	signat	_set_motors,8312
	global	_read_adc

;; *************** function _read_adc *****************
;; Defined at:
;;		line 57 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	line	57
global __ptext2
__ptext2:	;psect for function _read_adc
psect	text2
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	57
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
;incstack = 0
	opt	stack 7
; Regs used in _read_adc: [wreg+status,2+status,0]
;read_adc@channel stored from wreg
	movwf	(read_adc@channel)
	line	59
	
l721:	
;Arnold.c: 59: ADCON0 &= 0xC7;
	movlw	(0C7h)
	movwf	(??_read_adc+0)+0
	movf	(??_read_adc+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(31),f	;volatile
	line	60
;Arnold.c: 60: ADCON0 |= (channel << 3);
	movf	(read_adc@channel),w
	movwf	(??_read_adc+0)+0
	movlw	(03h)-1
u355:
	clrc
	rlf	(??_read_adc+0)+0,f
	addlw	-1
	skipz
	goto	u355
	clrc
	rlf	(??_read_adc+0)+0,w
	movwf	(??_read_adc+1)+0
	movf	(??_read_adc+1)+0,w
	iorwf	(31),f	;volatile
	line	62
	
l723:	
;Arnold.c: 62: _delay((unsigned long)((20)*(4000000/4000000.0)));
	opt asmopt_off
movlw	6
movwf	(??_read_adc+0)+0,f
u697:
decfsz	(??_read_adc+0)+0,f
	goto	u697
	nop
opt asmopt_on

	line	63
	
l725:	
;Arnold.c: 63: GO_nDONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7	;volatile
	line	64
;Arnold.c: 64: while(GO_nDONE);
	goto	l51
	
l52:	
	
l51:	
	btfsc	(250/8),(250)&7	;volatile
	goto	u361
	goto	u360
u361:
	goto	l51
u360:
	goto	l727
	
l53:	
	line	66
	
l727:	
;Arnold.c: 66: return ((unsigned int)ADRESH << 8) | ADRESL;
	movf	(30),w	;volatile
	clrf	(?_read_adc+1)
	addwf	(?_read_adc+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	clrf	(?_read_adc)
	addwf	(?_read_adc)

	goto	l54
	
l729:	
	line	67
	
l54:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
	signat	_read_adc,4218
	global	_init_io

;; *************** function _init_io *****************
;; Defined at:
;;		line 42 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
psect	text3,local,class=CODE,delta=2,merge=1
	line	42
global __ptext3
__ptext3:	;psect for function _init_io
psect	text3
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	42
	global	__size_of_init_io
	__size_of_init_io	equ	__end_of_init_io-_init_io
	
_init_io:	
;incstack = 0
	opt	stack 7
; Regs used in _init_io: [wreg+status,2]
	line	43
	
l711:	
;Arnold.c: 43: TRISA = 0xFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	44
;Arnold.c: 44: TRISB = 0xFF;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	45
	
l713:	
;Arnold.c: 45: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	46
	
l715:	
;Arnold.c: 46: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	48
	
l717:	
;Arnold.c: 48: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	49
	
l45:	
	return
	opt stack 0
GLOBAL	__end_of_init_io
	__end_of_init_io:
	signat	_init_io,88
	global	_init_adc

;; *************** function _init_adc *****************
;; Defined at:
;;		line 51 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
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
psect	text4,local,class=CODE,delta=2,merge=1
	line	51
global __ptext4
__ptext4:	;psect for function _init_adc
psect	text4
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\Arnold\Arnold.c"
	line	51
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
;incstack = 0
	opt	stack 7
; Regs used in _init_adc: [wreg]
	line	52
	
l719:	
;Arnold.c: 52: ADCON1 = 0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	53
;Arnold.c: 53: ADCON0 = 0x41;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	54
	
l48:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
	signat	_init_adc,88
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul16.c"
	line	15
global __ptext5
__ptext5:	;psect for function ___wmul
psect	text5
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 7
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l751:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l753
	line	44
	
l167:	
	line	45
	
l753:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u411
	goto	u410
u411:
	goto	l168
u410:
	line	46
	
l755:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l168:	
	line	47
	movlw	01h
	
u425:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u425
	line	48
	
l757:	
	movlw	01h
	
u435:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u435
	line	49
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u441
	goto	u440
u441:
	goto	l753
u440:
	goto	l759
	
l169:	
	line	52
	
l759:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l170
	
l761:	
	line	53
	
l170:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___aldiv

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] long 
;;  dividend        4    4[COMMON] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    2[BANK0 ] long 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       6       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
	line	6
global __ptext6
__ptext6:	;psect for function ___aldiv
psect	text6
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\aldiv.c"
	line	6
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
;incstack = 0
	opt	stack 7
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	14
	
l763:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	15
	
l765:	
	btfss	(___aldiv@divisor+3),7
	goto	u451
	goto	u450
u451:
	goto	l223
u450:
	line	16
	
l767:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	17
	clrf	(___aldiv@sign)
	incf	(___aldiv@sign),f
	line	18
	
l223:	
	line	19
	btfss	(___aldiv@dividend+3),7
	goto	u461
	goto	u460
u461:
	goto	l773
u460:
	line	20
	
l769:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	21
	
l771:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l773
	line	22
	
l224:	
	line	23
	
l773:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	24
	
l775:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u471
	goto	u470
u471:
	goto	l795
u470:
	line	25
	
l777:	
	clrf	(___aldiv@counter)
	incf	(___aldiv@counter),f
	line	26
	goto	l781
	
l227:	
	line	27
	
l779:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u485:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u485
	line	28
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l781
	line	29
	
l226:	
	line	26
	
l781:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u491
	goto	u490
u491:
	goto	l779
u490:
	goto	l783
	
l228:	
	goto	l783
	line	30
	
l229:	
	line	31
	
l783:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u505:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u505
	line	32
	
l785:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u515
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u515
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u515
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u515:
	skipc
	goto	u511
	goto	u510
u511:
	goto	l791
u510:
	line	33
	
l787:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	34
	
l789:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l791
	line	35
	
l230:	
	line	36
	
l791:	
	movlw	01h
u525:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u525

	line	37
	
l793:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u531
	goto	u530
u531:
	goto	l783
u530:
	goto	l795
	
l231:	
	goto	l795
	line	38
	
l225:	
	line	39
	
l795:	
	movf	(___aldiv@sign),w
	skipz
	goto	u540
	goto	l799
u540:
	line	40
	
l797:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l799
	
l232:	
	line	41
	
l799:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l233
	
l801:	
	line	42
	
l233:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
	signat	___aldiv,8316
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
