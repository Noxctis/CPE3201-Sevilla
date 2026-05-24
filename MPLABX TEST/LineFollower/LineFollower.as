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
	FNCALL	_main,_ADC_Read
	FNCALL	_main,_System_Init
	FNCALL	_main,___lldiv
	FNCALL	_main,___lmul
	FNCALL	_main,___lwmod
	FNCALL	_main,_setMotors
	FNROOT	_main
	global	_BLACK_LINE_NOISE
	global	_COAST_TIME
	global	_CURVE_LEFT
	global	_CURVE_RIGHT
	global	_PIVOT_LEFT
	global	_PIVOT_RIGHT
	global	_SWEEP_TIME
	global	_THRESHOLD_LEFT
	global	_THRESHOLD_RIGHT
	global	_BASE_SPEED
	global	_CURVE_SPEED_INNER
	global	_CURVE_SPEED_OUTER
	global	_PIVOT_SPEED_INNER
	global	_PIVOT_SPEED_OUTER
	global	_WOBBLE_SPEED_INNER
	global	_WOBBLE_SPEED_OUTER
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	53

;initializer for _BLACK_LINE_NOISE
	retlw	02Ch
	retlw	01h

	line	55

;initializer for _COAST_TIME
	retlw	02Ch
	retlw	01h

	line	46

;initializer for _CURVE_LEFT
	retlw	060h
	retlw	09h

	line	50

;initializer for _CURVE_RIGHT
	retlw	0F8h
	retlw	011h

	line	47

;initializer for _PIVOT_LEFT
	retlw	0B0h
	retlw	04h

	line	51

;initializer for _PIVOT_RIGHT
	retlw	0A8h
	retlw	016h

	line	56

;initializer for _SWEEP_TIME
	retlw	020h
	retlw	03h

	line	45

;initializer for _THRESHOLD_LEFT
	retlw	0EAh
	retlw	0Bh

	line	49

;initializer for _THRESHOLD_RIGHT
	retlw	06Eh
	retlw	0Fh

	line	34

;initializer for _BASE_SPEED
	retlw	064h
	line	43

;initializer for _CURVE_SPEED_INNER
	retlw	046h
	line	42

;initializer for _CURVE_SPEED_OUTER
	retlw	0AAh
	line	40

;initializer for _PIVOT_SPEED_INNER
	retlw	05Fh
	line	39

;initializer for _PIVOT_SPEED_OUTER
	retlw	0C8h
	line	37

;initializer for _WOBBLE_SPEED_INNER
	retlw	055h
	line	36

;initializer for _WOBBLE_SPEED_OUTER
	retlw	073h
	global	_ADCON0
_ADCON0	set	0x1F
	global	_ADRESH
_ADRESH	set	0x1E
	global	_CCP1CON
_CCP1CON	set	0x17
	global	_CCP2CON
_CCP2CON	set	0x1D
	global	_CCPR1L
_CCPR1L	set	0x15
	global	_CCPR2L
_CCPR2L	set	0x1B
	global	_PORTBbits
_PORTBbits	set	0x6
	global	_PORTD
_PORTD	set	0x8
	global	_PORTDbits
_PORTDbits	set	0x8
	global	_T2CON
_T2CON	set	0x12
	global	_GO_nDONE
_GO_nDONE	set	0xFA
	global	_ADCON1
_ADCON1	set	0x9F
	global	_ADRESL
_ADRESL	set	0x9E
	global	_PR2
_PR2	set	0x92
	global	_TRISA
_TRISA	set	0x85
	global	_TRISBbits
_TRISBbits	set	0x86
	global	_TRISCbits
_TRISCbits	set	0x87
	global	_TRISD
_TRISD	set	0x88
	global	_TRISE
_TRISE	set	0x89
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
	file	"LineFollower.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	53
_BLACK_LINE_NOISE:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	55
_COAST_TIME:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	46
_CURVE_LEFT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	50
_CURVE_RIGHT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	47
_PIVOT_LEFT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	51
_PIVOT_RIGHT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	56
_SWEEP_TIME:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	45
_THRESHOLD_LEFT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	49
_THRESHOLD_RIGHT:
       ds      2

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	34
_BASE_SPEED:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	43
_CURVE_SPEED_INNER:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	42
_CURVE_SPEED_OUTER:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	40
_PIVOT_SPEED_INNER:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	39
_PIVOT_SPEED_OUTER:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	37
_WOBBLE_SPEED_INNER:
       ds      1

psect	dataBANK0
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	36
_WOBBLE_SPEED_OUTER:
       ds      1

	file	"LineFollower.as"
	line	#
global btemp
psect inittext,class=CODE,delta=2
global init_fetch0,btemp
;	Called with low address in FSR and high address in W
init_fetch0:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram0
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram0:
	fcall init_fetch0
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram0
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
global init_ram0, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+25)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram0
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_System_Init:	; 0 bytes @ 0x0
??_System_Init:	; 0 bytes @ 0x0
?_setMotors:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
	global	?_ADC_Read
?_ADC_Read:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	setMotors@leftSpeed
setMotors@leftSpeed:	; 1 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	setMotors@rightDir
setMotors@rightDir:	; 1 bytes @ 0x1
	ds	1
??_ADC_Read:	; 0 bytes @ 0x2
	global	setMotors@rightSpeed
setMotors@rightSpeed:	; 1 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
??_setMotors:	; 0 bytes @ 0x3
	global	setMotors@leftDir
setMotors@leftDir:	; 1 bytes @ 0x3
	ds	1
??___lwmod:	; 0 bytes @ 0x4
	global	ADC_Read@channel
ADC_Read@channel:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	3
??___lmul:	; 0 bytes @ 0x8
??___lldiv:	; 0 bytes @ 0x8
	ds	1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_main:	; 0 bytes @ 0x0
	ds	7
	global	main@sensorValues
main@sensorValues:	; 16 bytes @ 0x7
	ds	16
	global	_main$579
_main$579:	; 4 bytes @ 0x17
	ds	4
	global	main@weighted_sum
main@weighted_sum:	; 4 bytes @ 0x1B
	ds	4
	global	main@sum
main@sum:	; 4 bytes @ 0x1F
	ds	4
	global	main@telemetry_timer
main@telemetry_timer:	; 2 bytes @ 0x23
	ds	2
	global	main@active_sensors
main@active_sensors:	; 2 bytes @ 0x25
	ds	2
	global	main@gap_timer
main@gap_timer:	; 2 bytes @ 0x27
	ds	2
	global	main@last_position
main@last_position:	; 2 bytes @ 0x29
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0x2B
	ds	1
	global	main@position
main@position:	; 2 bytes @ 0x2C
	ds	2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        25
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     46      71
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
;!    _main->___lldiv
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
;;Main: autosize = 0, tempsize = 7, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                46    46      0    4824
;!                                              0 BANK0     46    46      0
;!                           _ADC_Read
;!                        _System_Init
;!                            ___lldiv
;!                             ___lmul
;!                            ___lwmod
;!                          _setMotors
;! ---------------------------------------------------------------------------------
;! (1) _setMotors                                            4     1      3    3012
;!                                              0 COMMON     4     1      3
;! ---------------------------------------------------------------------------------
;! (1) ___lwmod                                              6     2      4     287
;!                                              0 COMMON     6     2      4
;! ---------------------------------------------------------------------------------
;! (1) ___lmul                                              13     5      8     348
;!                                              0 COMMON    13     5      8
;! ---------------------------------------------------------------------------------
;! (1) ___lldiv                                             14     6      8     290
;!                                              0 COMMON    14     6      8
;! ---------------------------------------------------------------------------------
;! (1) _System_Init                                          1     1      0       0
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_Read                                             5     3      2      22
;!                                              0 COMMON     5     3      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _ADC_Read
;!   _System_Init
;!   ___lldiv
;!   ___lmul
;!   ___lwmod
;!   _setMotors
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
;!BANK0               50     2E      47       5       88.8%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      55      12        0.0%
;!ABS                  0      0      55       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 110 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  sensorValues   16    7[BANK0 ] unsigned int [8]
;;  sum             4   31[BANK0 ] unsigned long 
;;  weighted_sum    4   27[BANK0 ] unsigned long 
;;  position        2   44[BANK0 ] unsigned int 
;;  last_positio    2   41[BANK0 ] unsigned int 
;;  gap_timer       2   39[BANK0 ] unsigned int 
;;  active_senso    2   37[BANK0 ] unsigned int 
;;  telemetry_ti    2   35[BANK0 ] unsigned int 
;;  i               1   43[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      39       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         0      46       0       0       0
;;Total ram usage:       46 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_ADC_Read
;;		_System_Init
;;		___lldiv
;;		___lmul
;;		___lwmod
;;		_setMotors
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	110
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	110
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	115
	
l954:	
;LineFollower.c: 111: unsigned int sensorValues[8];
;LineFollower.c: 112: unsigned char i;
;LineFollower.c: 113: unsigned long weighted_sum;
;LineFollower.c: 114: unsigned long sum;
;LineFollower.c: 115: unsigned int position = 3500;
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@position)
	movlw	high(0DACh)
	movwf	((main@position))+1
	line	117
	
l956:	
;LineFollower.c: 116: unsigned int active_sensors;
;LineFollower.c: 117: unsigned int telemetry_timer = 0;
	clrf	(main@telemetry_timer)
	clrf	(main@telemetry_timer+1)
	line	119
	
l958:	
;LineFollower.c: 119: unsigned int last_position = 3500;
	movlw	low(0DACh)
	movwf	(main@last_position)
	movlw	high(0DACh)
	movwf	((main@last_position))+1
	line	120
;LineFollower.c: 120: unsigned int gap_timer = 0;
	clrf	(main@gap_timer)
	clrf	(main@gap_timer+1)
	line	122
	
l960:	
;LineFollower.c: 122: System_Init();
	fcall	_System_Init
	line	124
	
l962:	
;LineFollower.c: 124: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u1057:
	decfsz	((??_main+0)+0),f
	goto	u1057
	decfsz	((??_main+0)+0+1),f
	goto	u1057
	decfsz	((??_main+0)+0+2),f
	goto	u1057
	nop2
opt asmopt_on

	goto	l964
	line	126
;LineFollower.c: 126: for(;;) {
	
l95:	
	line	127
	
l964:	
;LineFollower.c: 127: weighted_sum = 0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@weighted_sum+3)
	movlw	0
	movwf	(main@weighted_sum+2)
	movlw	0
	movwf	(main@weighted_sum+1)
	movlw	0
	movwf	(main@weighted_sum)

	line	128
	
l966:	
;LineFollower.c: 128: sum = 0;
	movlw	0
	movwf	(main@sum+3)
	movlw	0
	movwf	(main@sum+2)
	movlw	0
	movwf	(main@sum+1)
	movlw	0
	movwf	(main@sum)

	line	129
	
l968:	
;LineFollower.c: 129: active_sensors = 0;
	clrf	(main@active_sensors)
	clrf	(main@active_sensors+1)
	line	131
	
l970:	
;LineFollower.c: 131: if (telemetry_timer % 20 == 0) PORTBbits.RB0 = !PORTBbits.RB0;
	movlw	low(014h)
	movwf	(___lwmod@divisor)
	movlw	high(014h)
	movwf	((___lwmod@divisor))+1
	movf	(main@telemetry_timer+1),w
	clrf	(___lwmod@dividend+1)
	addwf	(___lwmod@dividend+1)
	movf	(main@telemetry_timer),w
	clrf	(___lwmod@dividend)
	addwf	(___lwmod@dividend)

	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u771
	goto	u770
u771:
	goto	l974
u770:
	
l972:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(6),0	;volatile
	goto	u781
	goto	u780
	
u781:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6),0	;volatile
	goto	u794
u780:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(6),0	;volatile
u794:
	goto	l974
	
l96:	
	line	133
	
l974:	
;LineFollower.c: 133: for (i = 0; i < 8; i++) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	
l976:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u801
	goto	u800
u801:
	goto	l980
u800:
	goto	l994
	
l978:	
	goto	l994
	
l97:	
	line	134
	
l980:	
;LineFollower.c: 134: sensorValues[i] = ADC_Read(i);
	movf	(main@i),w
	fcall	_ADC_Read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@sensorValues&0ffh
	movwf	fsr0
	movf	(0+(?_ADC_Read)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_ADC_Read)),w
	movwf	indf
	line	136
	
l982:	
;LineFollower.c: 136: if (sensorValues[i] > BLACK_LINE_NOISE) {
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@sensorValues&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_main+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+1)+0+1
	movf	1+(??_main+1)+0,w
	subwf	(_BLACK_LINE_NOISE+1),w
	skipz
	goto	u815
	movf	0+(??_main+1)+0,w
	subwf	(_BLACK_LINE_NOISE),w
u815:
	skipnc
	goto	u811
	goto	u810
u811:
	goto	l992
u810:
	line	137
	
l984:	
;LineFollower.c: 137: weighted_sum += (unsigned long)sensorValues[i] * i * 1000;
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@sensorValues&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_main+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+1)+0+1
	movf	0+(??_main+1)+0,w
	movwf	(___lmul@multiplier)
	movf	1+(??_main+1)+0,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movf	(main@i),w
	movwf	(??_main+3)+0
	clrf	(??_main+3)+0+1
	clrf	(??_main+3)+0+2
	clrf	(??_main+3)+0+3
	movf	3+(??_main+3)+0,w
	movwf	(___lmul@multiplicand+3)
	movf	2+(??_main+3)+0,w
	movwf	(___lmul@multiplicand+2)
	movf	1+(??_main+3)+0,w
	movwf	(___lmul@multiplicand+1)
	movf	0+(??_main+3)+0,w
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_main$579+3)
	movf	(2+(?___lmul)),w
	movwf	(_main$579+2)
	movf	(1+(?___lmul)),w
	movwf	(_main$579+1)
	movf	(0+(?___lmul)),w
	movwf	(_main$579)

	
l986:	
;LineFollower.c: 137: weighted_sum += (unsigned long)sensorValues[i] * i * 1000;
	movf	(_main$579+3),w
	movwf	(___lmul@multiplier+3)
	movf	(_main$579+2),w
	movwf	(___lmul@multiplier+2)
	movf	(_main$579+1),w
	movwf	(___lmul@multiplier+1)
	movf	(_main$579),w
	movwf	(___lmul@multiplier)

	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	03h
	movwf	(___lmul@multiplicand+1)
	movlw	0E8h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(0+(?___lmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@weighted_sum),f
	movf	(1+(?___lmul)),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u821
	addwf	(main@weighted_sum+1),f
u821:
	movf	(2+(?___lmul)),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u822
	addwf	(main@weighted_sum+2),f
u822:
	movf	(3+(?___lmul)),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u823
	addwf	(main@weighted_sum+3),f
u823:

	line	138
	
l988:	
;LineFollower.c: 138: sum += sensorValues[i];
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@sensorValues&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+1)+0+1
	movf	0+(??_main+1)+0,w
	movwf	((??_main+3)+0)
	movf	1+(??_main+1)+0,w
	movwf	((??_main+3)+0+1)
	clrf	((??_main+3)+0+2)
	clrf	((??_main+3)+0+3)
	movf	0+(??_main+3)+0,w
	addwf	(main@sum),f
	movf	1+(??_main+3)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u831
	addwf	(main@sum+1),f
u831:
	movf	2+(??_main+3)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u832
	addwf	(main@sum+2),f
u832:
	movf	3+(??_main+3)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u833
	addwf	(main@sum+3),f
u833:

	line	139
	
l990:	
;LineFollower.c: 139: active_sensors++;
	movlw	low(01h)
	addwf	(main@active_sensors),f
	skipnc
	incf	(main@active_sensors+1),f
	movlw	high(01h)
	addwf	(main@active_sensors+1),f
	goto	l992
	line	140
	
l99:	
	line	133
	
l992:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u841
	goto	u840
u841:
	goto	l980
u840:
	goto	l994
	
l98:	
	line	143
	
l994:	
;LineFollower.c: 140: }
;LineFollower.c: 141: }
;LineFollower.c: 143: if (active_sensors >= 5) {
	movlw	high(05h)
	subwf	(main@active_sensors+1),w
	movlw	low(05h)
	skipnz
	subwf	(main@active_sensors),w
	skipc
	goto	u851
	goto	u850
u851:
	goto	l1008
u850:
	line	144
	
l996:	
;LineFollower.c: 144: if (sensorValues[0] > BLACK_LINE_NOISE) position = 0;
	movf	(main@sensorValues+1),w
	subwf	(_BLACK_LINE_NOISE+1),w
	skipz
	goto	u865
	movf	(main@sensorValues),w
	subwf	(_BLACK_LINE_NOISE),w
u865:
	skipnc
	goto	u861
	goto	u860
u861:
	goto	l1000
u860:
	
l998:	
	clrf	(main@position)
	clrf	(main@position+1)
	goto	l1006
	line	145
	
l101:	
	
l1000:	
;LineFollower.c: 145: else if (sensorValues[7] > BLACK_LINE_NOISE) position = 7000;
	movf	1+(main@sensorValues)+0Eh,w
	subwf	(_BLACK_LINE_NOISE+1),w
	skipz
	goto	u875
	movf	0+(main@sensorValues)+0Eh,w
	subwf	(_BLACK_LINE_NOISE),w
u875:
	skipnc
	goto	u871
	goto	u870
u871:
	goto	l1004
u870:
	
l1002:	
	movlw	low(01B58h)
	movwf	(main@position)
	movlw	high(01B58h)
	movwf	((main@position))+1
	goto	l1006
	line	146
	
l103:	
	
l1004:	
;LineFollower.c: 146: else position = 3500;
	movlw	low(0DACh)
	movwf	(main@position)
	movlw	high(0DACh)
	movwf	((main@position))+1
	goto	l1006
	
l104:	
	goto	l1006
	
l102:	
	line	147
	
l1006:	
;LineFollower.c: 147: last_position = position;
	movf	(main@position+1),w
	clrf	(main@last_position+1)
	addwf	(main@last_position+1)
	movf	(main@position),w
	clrf	(main@last_position)
	addwf	(main@last_position)

	line	148
;LineFollower.c: 148: }
	goto	l1014
	line	149
	
l100:	
	
l1008:	
;LineFollower.c: 149: else if (active_sensors > 0) {
	movf	(main@active_sensors+1),w
	iorwf	(main@active_sensors),w
	skipnz
	goto	u881
	goto	u880
u881:
	goto	l1014
u880:
	line	150
	
l1010:	
;LineFollower.c: 150: position = (unsigned int)(weighted_sum / sum);
	movf	(main@sum+3),w
	movwf	(___lldiv@divisor+3)
	movf	(main@sum+2),w
	movwf	(___lldiv@divisor+2)
	movf	(main@sum+1),w
	movwf	(___lldiv@divisor+1)
	movf	(main@sum),w
	movwf	(___lldiv@divisor)

	movf	(main@weighted_sum+3),w
	movwf	(___lldiv@dividend+3)
	movf	(main@weighted_sum+2),w
	movwf	(___lldiv@dividend+2)
	movf	(main@weighted_sum+1),w
	movwf	(___lldiv@dividend+1)
	movf	(main@weighted_sum),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@position+1)
	addwf	(main@position+1)
	movf	0+(((0+(?___lldiv)))),w
	clrf	(main@position)
	addwf	(main@position)

	line	151
	
l1012:	
;LineFollower.c: 151: last_position = position;
	movf	(main@position+1),w
	clrf	(main@last_position+1)
	addwf	(main@last_position+1)
	movf	(main@position),w
	clrf	(main@last_position)
	addwf	(main@last_position)

	goto	l1014
	line	152
	
l106:	
	goto	l1014
	line	154
	
l105:	
	
l1014:	
;LineFollower.c: 152: }
;LineFollower.c: 154: if (active_sensors > 0) {
	movf	(main@active_sensors+1),w
	iorwf	(main@active_sensors),w
	skipnz
	goto	u891
	goto	u890
u891:
	goto	l1044
u890:
	line	155
	
l1016:	
;LineFollower.c: 155: gap_timer = 0;
	clrf	(main@gap_timer)
	clrf	(main@gap_timer+1)
	line	157
	
l1018:	
;LineFollower.c: 157: if (position < PIVOT_LEFT) {
	movf	(_PIVOT_LEFT+1),w
	subwf	(main@position+1),w
	skipz
	goto	u905
	movf	(_PIVOT_LEFT),w
	subwf	(main@position),w
u905:
	skipnc
	goto	u901
	goto	u900
u901:
	goto	l1022
u900:
	line	158
	
l1020:	
;LineFollower.c: 158: setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER);
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(-1)
	fcall	_setMotors
	line	159
;LineFollower.c: 159: }
	goto	l1076
	line	160
	
l108:	
	
l1022:	
;LineFollower.c: 160: else if (position < CURVE_LEFT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_CURVE_LEFT+1),w
	subwf	(main@position+1),w
	skipz
	goto	u915
	movf	(_CURVE_LEFT),w
	subwf	(main@position),w
u915:
	skipnc
	goto	u911
	goto	u910
u911:
	goto	l1026
u910:
	line	161
	
l1024:	
;LineFollower.c: 161: setMotors(1, CURVE_SPEED_INNER, 1, CURVE_SPEED_OUTER);
	movf	(_CURVE_SPEED_INNER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_CURVE_SPEED_OUTER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	162
;LineFollower.c: 162: }
	goto	l1076
	line	163
	
l110:	
	
l1026:	
;LineFollower.c: 163: else if (position < THRESHOLD_LEFT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_THRESHOLD_LEFT+1),w
	subwf	(main@position+1),w
	skipz
	goto	u925
	movf	(_THRESHOLD_LEFT),w
	subwf	(main@position),w
u925:
	skipnc
	goto	u921
	goto	u920
u921:
	goto	l1030
u920:
	line	164
	
l1028:	
;LineFollower.c: 164: setMotors(1, WOBBLE_SPEED_INNER, 1, WOBBLE_SPEED_OUTER);
	movf	(_WOBBLE_SPEED_INNER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_WOBBLE_SPEED_OUTER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	165
;LineFollower.c: 165: }
	goto	l1076
	line	166
	
l112:	
	
l1030:	
;LineFollower.c: 166: else if (position > PIVOT_RIGHT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@position+1),w
	subwf	(_PIVOT_RIGHT+1),w
	skipz
	goto	u935
	movf	(main@position),w
	subwf	(_PIVOT_RIGHT),w
u935:
	skipnc
	goto	u931
	goto	u930
u931:
	goto	l1034
u930:
	line	167
	
l1032:	
;LineFollower.c: 167: setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER);
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	decf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	168
;LineFollower.c: 168: }
	goto	l1076
	line	169
	
l114:	
	
l1034:	
;LineFollower.c: 169: else if (position > CURVE_RIGHT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@position+1),w
	subwf	(_CURVE_RIGHT+1),w
	skipz
	goto	u945
	movf	(main@position),w
	subwf	(_CURVE_RIGHT),w
u945:
	skipnc
	goto	u941
	goto	u940
u941:
	goto	l1038
u940:
	line	170
	
l1036:	
;LineFollower.c: 170: setMotors(1, CURVE_SPEED_OUTER, 1, CURVE_SPEED_INNER);
	movf	(_CURVE_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_CURVE_SPEED_INNER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	171
;LineFollower.c: 171: }
	goto	l1076
	line	172
	
l116:	
	
l1038:	
;LineFollower.c: 172: else if (position > THRESHOLD_RIGHT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@position+1),w
	subwf	(_THRESHOLD_RIGHT+1),w
	skipz
	goto	u955
	movf	(main@position),w
	subwf	(_THRESHOLD_RIGHT),w
u955:
	skipnc
	goto	u951
	goto	u950
u951:
	goto	l1042
u950:
	line	173
	
l1040:	
;LineFollower.c: 173: setMotors(1, WOBBLE_SPEED_OUTER, 1, WOBBLE_SPEED_INNER);
	movf	(_WOBBLE_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_WOBBLE_SPEED_INNER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	174
;LineFollower.c: 174: }
	goto	l1076
	line	175
	
l118:	
	line	176
	
l1042:	
;LineFollower.c: 175: else {
;LineFollower.c: 176: setMotors(1, BASE_SPEED, 1, BASE_SPEED);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BASE_SPEED),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_BASE_SPEED),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	goto	l1076
	line	177
	
l119:	
	goto	l1076
	
l117:	
	goto	l1076
	
l115:	
	goto	l1076
	
l113:	
	goto	l1076
	
l111:	
	goto	l1076
	
l109:	
	line	178
;LineFollower.c: 177: }
;LineFollower.c: 178: }
	goto	l1076
	line	179
	
l107:	
	line	180
	
l1044:	
;LineFollower.c: 179: else {
;LineFollower.c: 180: gap_timer++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@gap_timer),f
	skipnc
	incf	(main@gap_timer+1),f
	movlw	high(01h)
	addwf	(main@gap_timer+1),f
	line	182
;LineFollower.c: 182: if (gap_timer < COAST_TIME) {
	movf	(_COAST_TIME+1),w
	subwf	(main@gap_timer+1),w
	skipz
	goto	u965
	movf	(_COAST_TIME),w
	subwf	(main@gap_timer),w
u965:
	skipnc
	goto	u961
	goto	u960
u961:
	goto	l1058
u960:
	line	183
	
l1046:	
;LineFollower.c: 183: if (last_position > CURVE_LEFT && last_position < CURVE_RIGHT) {
	movf	(main@last_position+1),w
	subwf	(_CURVE_LEFT+1),w
	skipz
	goto	u975
	movf	(main@last_position),w
	subwf	(_CURVE_LEFT),w
u975:
	skipnc
	goto	u971
	goto	u970
u971:
	goto	l1052
u970:
	
l1048:	
	movf	(_CURVE_RIGHT+1),w
	subwf	(main@last_position+1),w
	skipz
	goto	u985
	movf	(_CURVE_RIGHT),w
	subwf	(main@last_position),w
u985:
	skipnc
	goto	u981
	goto	u980
u981:
	goto	l1052
u980:
	line	184
	
l1050:	
;LineFollower.c: 184: setMotors(1, BASE_SPEED, 1, BASE_SPEED);
	movf	(_BASE_SPEED),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_BASE_SPEED),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	185
;LineFollower.c: 185: }
	goto	l1076
	line	186
	
l122:	
	
l1052:	
;LineFollower.c: 186: else if (last_position <= CURVE_LEFT) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@last_position+1),w
	subwf	(_CURVE_LEFT+1),w
	skipz
	goto	u995
	movf	(main@last_position),w
	subwf	(_CURVE_LEFT),w
u995:
	skipc
	goto	u991
	goto	u990
u991:
	goto	l1056
u990:
	line	187
	
l1054:	
;LineFollower.c: 187: setMotors(1, 0, 1, CURVE_SPEED_OUTER);
	clrf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_CURVE_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	188
;LineFollower.c: 188: }
	goto	l1076
	line	189
	
l124:	
	line	190
	
l1056:	
;LineFollower.c: 189: else {
;LineFollower.c: 190: setMotors(1, CURVE_SPEED_OUTER, 1, 0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_CURVE_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	clrf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	goto	l1076
	line	191
	
l125:	
	goto	l1076
	
l123:	
	line	192
;LineFollower.c: 191: }
;LineFollower.c: 192: }
	goto	l1076
	line	193
	
l121:	
	
l1058:	
;LineFollower.c: 193: else if (gap_timer < SWEEP_TIME) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_SWEEP_TIME+1),w
	subwf	(main@gap_timer+1),w
	skipz
	goto	u1005
	movf	(_SWEEP_TIME),w
	subwf	(main@gap_timer),w
u1005:
	skipnc
	goto	u1001
	goto	u1000
u1001:
	goto	l1066
u1000:
	line	194
	
l1060:	
;LineFollower.c: 194: if (last_position >= 3500) {
	movlw	high(0DACh)
	subwf	(main@last_position+1),w
	movlw	low(0DACh)
	skipnz
	subwf	(main@last_position),w
	skipc
	goto	u1011
	goto	u1010
u1011:
	goto	l1064
u1010:
	line	195
	
l1062:	
;LineFollower.c: 195: setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER);
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	decf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	line	196
;LineFollower.c: 196: } else {
	goto	l1076
	
l128:	
	line	197
	
l1064:	
;LineFollower.c: 197: setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(-1)
	fcall	_setMotors
	goto	l1076
	line	198
	
l129:	
	line	199
;LineFollower.c: 198: }
;LineFollower.c: 199: }
	goto	l1076
	line	200
	
l127:	
	
l1066:	
;LineFollower.c: 200: else if (gap_timer < (SWEEP_TIME * 2)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_SWEEP_TIME+1),w
	movwf	(??_main+0)+0+1
	movf	(_SWEEP_TIME),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	movf	1+(??_main+0)+0,w
	subwf	(main@gap_timer+1),w
	skipz
	goto	u1025
	movf	0+(??_main+0)+0,w
	subwf	(main@gap_timer),w
u1025:
	skipnc
	goto	u1021
	goto	u1020
u1021:
	goto	l1074
u1020:
	line	201
	
l1068:	
;LineFollower.c: 201: if (last_position >= 3500) {
	movlw	high(0DACh)
	subwf	(main@last_position+1),w
	movlw	low(0DACh)
	skipnz
	subwf	(main@last_position),w
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l1072
u1030:
	line	202
	
l1070:	
;LineFollower.c: 202: setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER);
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	incf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(-1)
	fcall	_setMotors
	line	203
;LineFollower.c: 203: } else {
	goto	l1076
	
l132:	
	line	204
	
l1072:	
;LineFollower.c: 204: setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_PIVOT_SPEED_OUTER),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	decf	(setMotors@rightDir),f
	movf	(_PIVOT_SPEED_INNER),w
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(setMotors@rightSpeed)
	movlw	(01h)
	fcall	_setMotors
	goto	l1076
	line	205
	
l133:	
	line	206
;LineFollower.c: 205: }
;LineFollower.c: 206: }
	goto	l1076
	line	207
	
l131:	
	line	208
	
l1074:	
;LineFollower.c: 207: else {
;LineFollower.c: 208: setMotors(0, 0, 0, 0);
	clrf	(setMotors@leftSpeed)
	clrf	(setMotors@rightDir)
	clrf	(setMotors@rightSpeed)
	movlw	(0)
	fcall	_setMotors
	goto	l1076
	line	209
	
l134:	
	goto	l1076
	
l130:	
	goto	l1076
	
l126:	
	goto	l1076
	line	210
	
l120:	
	line	212
	
l1076:	
;LineFollower.c: 209: }
;LineFollower.c: 210: }
;LineFollower.c: 212: telemetry_timer++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@telemetry_timer),f
	skipnc
	incf	(main@telemetry_timer+1),f
	movlw	high(01h)
	addwf	(main@telemetry_timer+1),f
	line	213
	
l1078:	
;LineFollower.c: 213: if (telemetry_timer >= 50) {
	movlw	high(032h)
	subwf	(main@telemetry_timer+1),w
	movlw	low(032h)
	skipnz
	subwf	(main@telemetry_timer),w
	skipc
	goto	u1041
	goto	u1040
u1041:
	goto	l964
u1040:
	line	214
	
l1080:	
;LineFollower.c: 214: telemetry_timer = 0;
	clrf	(main@telemetry_timer)
	clrf	(main@telemetry_timer+1)
	goto	l964
	line	215
	
l135:	
	line	216
;LineFollower.c: 215: }
;LineFollower.c: 216: }
	goto	l964
	
l136:	
	line	217
	
l137:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_setMotors

;; *************** function _setMotors *****************
;; Defined at:
;;		line 97 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
;; Parameters:    Size  Location     Type
;;  leftDir         1    wreg     char 
;;  leftSpeed       1    0[COMMON] unsigned char 
;;  rightDir        1    1[COMMON] char 
;;  rightSpeed      1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  leftDir         1    3[COMMON] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         1       0       0       0       0
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
	line	97
global __ptext1
__ptext1:	;psect for function _setMotors
psect	text1
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	97
	global	__size_of_setMotors
	__size_of_setMotors	equ	__end_of_setMotors-_setMotors
	
_setMotors:	
;incstack = 0
	opt	stack 7
; Regs used in _setMotors: [wreg]
;setMotors@leftDir stored from wreg
	movwf	(setMotors@leftDir)
	line	98
	
l876:	
;LineFollower.c: 98: if (leftDir == 1) { PORTDbits.RD1 = 1; PORTDbits.RD0 = 0; }
	movf	(setMotors@leftDir),w
	xorlw	01h
	skipz
	goto	u551
	goto	u550
u551:
	goto	l880
u550:
	
l878:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(8),1	;volatile
	bcf	(8),0	;volatile
	goto	l884
	line	99
	
l84:	
	
l880:	
;LineFollower.c: 99: else if (leftDir == -1){ PORTDbits.RD1 = 0; PORTDbits.RD0 = 1; }
	movf	(setMotors@leftDir),w
	xorlw	-1
	skipz
	goto	u561
	goto	u560
u561:
	goto	l86
u560:
	
l882:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),1	;volatile
	bsf	(8),0	;volatile
	goto	l884
	line	100
	
l86:	
;LineFollower.c: 100: else { PORTDbits.RD1 = 0; PORTDbits.RD0 = 0; }
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),1	;volatile
	bcf	(8),0	;volatile
	goto	l884
	
l87:	
	goto	l884
	
l85:	
	line	102
	
l884:	
;LineFollower.c: 102: if (rightDir == 1) { PORTDbits.RD3 = 1; PORTDbits.RD2 = 0; }
	movf	(setMotors@rightDir),w
	xorlw	01h
	skipz
	goto	u571
	goto	u570
u571:
	goto	l888
u570:
	
l886:	
	bsf	(8),3	;volatile
	bcf	(8),2	;volatile
	goto	l892
	line	103
	
l88:	
	
l888:	
;LineFollower.c: 103: else if (rightDir == -1){ PORTDbits.RD3 = 0; PORTDbits.RD2 = 1; }
	movf	(setMotors@rightDir),w
	xorlw	-1
	skipz
	goto	u581
	goto	u580
u581:
	goto	l90
u580:
	
l890:	
	bcf	(8),3	;volatile
	bsf	(8),2	;volatile
	goto	l892
	line	104
	
l90:	
;LineFollower.c: 104: else { PORTDbits.RD3 = 0; PORTDbits.RD2 = 0; }
	bcf	(8),3	;volatile
	bcf	(8),2	;volatile
	goto	l892
	
l91:	
	goto	l892
	
l89:	
	line	106
	
l892:	
;LineFollower.c: 106: CCPR1L = leftSpeed;
	movf	(setMotors@leftSpeed),w
	movwf	(21)	;volatile
	line	107
;LineFollower.c: 107: CCPR2L = rightSpeed;
	movf	(setMotors@rightSpeed),w
	movwf	(27)	;volatile
	line	108
	
l92:	
	return
	opt stack 0
GLOBAL	__end_of_setMotors
	__end_of_setMotors:
	signat	_setMotors,16504
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
global __ptext2
__ptext2:	;psect for function ___lwmod
psect	text2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
l932:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u711
	goto	u710
u711:
	goto	l950
u710:
	line	14
	
l934:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	l940
	
l562:	
	line	16
	
l936:	
	movlw	01h
	
u725:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u725
	line	17
	
l938:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l940
	line	18
	
l561:	
	line	15
	
l940:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u731
	goto	u730
u731:
	goto	l936
u730:
	goto	l942
	
l563:	
	goto	l942
	line	19
	
l564:	
	line	20
	
l942:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u745
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u745:
	skipc
	goto	u741
	goto	u740
u741:
	goto	l946
u740:
	line	21
	
l944:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l946
	
l565:	
	line	22
	
l946:	
	movlw	01h
	
u755:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u755
	line	23
	
l948:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u761
	goto	u760
u761:
	goto	l942
u760:
	goto	l950
	
l566:	
	goto	l950
	line	24
	
l560:	
	line	25
	
l950:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l567
	
l952:	
	line	26
	
l567:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul32.c"
	line	15
global __ptext3
__ptext3:	;psect for function ___lmul
psect	text3
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 7
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l894:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l896
	line	120
	
l232:	
	line	121
	
l896:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u591
	goto	u590
u591:
	goto	l900
u590:
	line	122
	
l898:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u601
	addwf	(___lmul@product+1),f
u601:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u602
	addwf	(___lmul@product+2),f
u602:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u603
	addwf	(___lmul@product+3),f
u603:

	goto	l900
	
l233:	
	line	123
	
l900:	
	movlw	01h
	movwf	(??___lmul+0)+0
u615:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u615
	line	124
	
l902:	
	movlw	01h
u625:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u625

	line	125
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u631
	goto	u630
u631:
	goto	l896
u630:
	goto	l904
	
l234:	
	line	128
	
l904:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l235
	
l906:	
	line	129
	
l235:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    9[COMMON] unsigned long 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lldiv.c"
	line	6
global __ptext4
__ptext4:	;psect for function ___lldiv
psect	text4
	file	"C:\Program Files (x86)\Microchip\xc8\v1.33\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 7
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l908:	
	movlw	0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	15
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u641
	goto	u640
u641:
	goto	l928
u640:
	line	16
	
l910:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l914
	
l499:	
	line	18
	
l912:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u655:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u655
	line	19
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l914
	line	20
	
l498:	
	line	17
	
l914:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u661
	goto	u660
u661:
	goto	l912
u660:
	goto	l916
	
l500:	
	goto	l916
	line	21
	
l501:	
	line	22
	
l916:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u675:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u675
	line	23
	
l918:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u685
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u685
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u685
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u685:
	skipc
	goto	u681
	goto	u680
u681:
	goto	l924
u680:
	line	24
	
l920:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	25
	
l922:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l924
	line	26
	
l502:	
	line	27
	
l924:	
	movlw	01h
u695:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u695

	line	28
	
l926:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u701
	goto	u700
u701:
	goto	l916
u700:
	goto	l928
	
l503:	
	goto	l928
	line	29
	
l497:	
	line	30
	
l928:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l504
	
l930:	
	line	31
	
l504:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_System_Init

;; *************** function _System_Init *****************
;; Defined at:
;;		line 64 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	64
global __ptext5
__ptext5:	;psect for function _System_Init
psect	text5
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	64
	global	__size_of_System_Init
	__size_of_System_Init	equ	__end_of_System_Init-_System_Init
	
_System_Init:	
;incstack = 0
	opt	stack 7
; Regs used in _System_Init: [wreg+status,2+status,0]
	line	65
	
l840:	
;LineFollower.c: 65: TRISCbits.TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(135)^080h,1	;volatile
	line	66
;LineFollower.c: 66: TRISCbits.TRISC2 = 0;
	bcf	(135)^080h,2	;volatile
	line	67
	
l842:	
;LineFollower.c: 67: TRISD &= 0xE0;
	movlw	(0E0h)
	movwf	(??_System_Init+0)+0
	movf	(??_System_Init+0)+0,w
	andwf	(136)^080h,f	;volatile
	line	68
	
l844:	
;LineFollower.c: 68: TRISBbits.TRISB0 = 0;
	bcf	(134)^080h,0	;volatile
	line	70
;LineFollower.c: 70: PORTD &= 0xE0;
	movlw	(0E0h)
	movwf	(??_System_Init+0)+0
	movf	(??_System_Init+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),f	;volatile
	line	71
	
l846:	
;LineFollower.c: 71: PORTBbits.RB0 = 0;
	bcf	(6),0	;volatile
	line	72
	
l848:	
;LineFollower.c: 72: PORTDbits.RD4 = 1;
	bsf	(8),4	;volatile
	line	74
;LineFollower.c: 74: TRISA |= 0x2F;
	movlw	(02Fh)
	movwf	(??_System_Init+0)+0
	movf	(??_System_Init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(133)^080h,f	;volatile
	line	75
;LineFollower.c: 75: TRISE |= 0x07;
	movlw	(07h)
	movwf	(??_System_Init+0)+0
	movf	(??_System_Init+0)+0,w
	iorwf	(137)^080h,f	;volatile
	line	77
	
l850:	
;LineFollower.c: 77: ADCON0 = 0x41;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	78
	
l852:	
;LineFollower.c: 78: ADCON1 = 0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	80
	
l854:	
;LineFollower.c: 80: PR2 = 249;
	movlw	(0F9h)
	movwf	(146)^080h	;volatile
	line	81
	
l856:	
;LineFollower.c: 81: T2CON = 0b00000101;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	82
	
l858:	
;LineFollower.c: 82: CCP1CON = 0x0C;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	83
	
l860:	
;LineFollower.c: 83: CCP2CON = 0x0C;
	movlw	(0Ch)
	movwf	(29)	;volatile
	line	84
	
l862:	
;LineFollower.c: 84: CCPR1L = 0;
	clrf	(21)	;volatile
	line	85
	
l864:	
;LineFollower.c: 85: CCPR2L = 0;
	clrf	(27)	;volatile
	line	86
	
l75:	
	return
	opt stack 0
GLOBAL	__end_of_System_Init
	__end_of_System_Init:
	signat	_System_Init,88
	global	_ADC_Read

;; *************** function _ADC_Read *****************
;; Defined at:
;;		line 88 in file "C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
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
psect	text6,local,class=CODE,delta=2,merge=1
	line	88
global __ptext6
__ptext6:	;psect for function _ADC_Read
psect	text6
	file	"C:\Users\Chrys Sean Sevilla\Desktop\School Stuff\CPE3201-Sevilla\MPLABX TEST\LineFollower\LineFollower.c"
	line	88
	global	__size_of_ADC_Read
	__size_of_ADC_Read	equ	__end_of_ADC_Read-_ADC_Read
	
_ADC_Read:	
;incstack = 0
	opt	stack 7
; Regs used in _ADC_Read: [wreg+status,2+status,0]
;ADC_Read@channel stored from wreg
	movwf	(ADC_Read@channel)
	line	89
	
l866:	
;LineFollower.c: 89: ADCON0 &= 0xC5;
	movlw	(0C5h)
	movwf	(??_ADC_Read+0)+0
	movf	(??_ADC_Read+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(31),f	;volatile
	line	90
;LineFollower.c: 90: ADCON0 |= (channel << 3);
	movf	(ADC_Read@channel),w
	movwf	(??_ADC_Read+0)+0
	movlw	(03h)-1
u535:
	clrc
	rlf	(??_ADC_Read+0)+0,f
	addlw	-1
	skipz
	goto	u535
	clrc
	rlf	(??_ADC_Read+0)+0,w
	movwf	(??_ADC_Read+1)+0
	movf	(??_ADC_Read+1)+0,w
	iorwf	(31),f	;volatile
	line	91
	
l868:	
;LineFollower.c: 91: _delay((unsigned long)((20)*(4000000/4000000.0)));
	opt asmopt_off
movlw	6
movwf	(??_ADC_Read+0)+0,f
u1067:
decfsz	(??_ADC_Read+0)+0,f
	goto	u1067
	nop
opt asmopt_on

	line	92
	
l870:	
;LineFollower.c: 92: GO_nDONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7	;volatile
	line	93
;LineFollower.c: 93: while(GO_nDONE);
	goto	l78
	
l79:	
	
l78:	
	btfsc	(250/8),(250)&7	;volatile
	goto	u541
	goto	u540
u541:
	goto	l78
u540:
	goto	l872
	
l80:	
	line	94
	
l872:	
;LineFollower.c: 94: return ((ADRESH << 8) | ADRESL);
	movf	(30),w	;volatile
	clrf	(?_ADC_Read+1)
	addwf	(?_ADC_Read+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	clrf	(?_ADC_Read)
	addwf	(?_ADC_Read)

	goto	l81
	
l874:	
	line	95
	
l81:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Read
	__end_of_ADC_Read:
	signat	_ADC_Read,4218
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
