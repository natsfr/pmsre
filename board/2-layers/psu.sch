EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:MAX571X-TSSOP14
LIBS:STM32F103RG_LQFP64
LIBS:xc3s200a-vq100
LIBS:resistors
LIBS:DRV8825
LIBS:MPS_DCDC
LIBS:MISC_CONNECTORS
LIBS:xtals
LIBS:stepper_controller-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date "2 feb 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8450 3250 8450 3350
Wire Wire Line
	8450 2450 8450 2100
Wire Wire Line
	8450 2100 8950 2100
Wire Wire Line
	9600 2550 9600 2800
Wire Wire Line
	10550 2450 10550 2550
Connection ~ 10650 2100
Wire Wire Line
	10700 2100 10700 2250
Wire Wire Line
	9450 2100 9800 2100
Wire Wire Line
	9550 1850 9450 1850
Wire Wire Line
	9850 2000 9850 1850
Wire Wire Line
	9850 1850 9750 1850
Wire Wire Line
	8800 2500 8800 1850
Wire Wire Line
	8800 1850 8950 1850
Wire Wire Line
	9200 1000 9200 950 
Wire Wire Line
	9200 950  9150 950 
Wire Wire Line
	8050 950  8000 950 
Wire Wire Line
	8000 950  8000 900 
Connection ~ 8600 950 
Wire Wire Line
	8950 1950 8600 1950
Wire Wire Line
	8600 1950 8600 950 
Wire Wire Line
	8650 950  8550 950 
Connection ~ 8100 2400
Wire Wire Line
	7800 2100 7800 2400
Connection ~ 9150 2400
Wire Wire Line
	8100 2100 8100 2400
Connection ~ 8100 1600
Wire Wire Line
	7800 1600 7800 1900
Connection ~ 9200 1600
Wire Wire Line
	7800 1600 9200 1600
Wire Wire Line
	8100 1600 8100 1900
Wire Wire Line
	9200 1550 9200 1700
Connection ~ 9200 2400
Wire Wire Line
	9200 2400 9200 2500
Wire Wire Line
	9250 2350 9250 2400
Wire Wire Line
	9250 2400 7800 2400
Wire Wire Line
	9150 2350 9150 2400
Wire Wire Line
	8800 2700 8800 2800
Wire Wire Line
	9450 2000 9900 2000
Connection ~ 9850 2000
Wire Wire Line
	10650 2000 10500 2000
Wire Wire Line
	10550 2100 10550 2250
Connection ~ 10550 2100
Wire Wire Line
	10700 2450 10700 2550
Wire Wire Line
	9600 2100 9600 2350
Connection ~ 9600 2100
Connection ~ 10650 2000
Wire Wire Line
	10650 1450 10650 2100
Wire Wire Line
	8450 2650 8450 2750
$Comp
L GND #PWR078
U 1 1 51F2781A
P 8450 3350
F 0 "#PWR078" H 8450 3350 30  0001 C CNN
F 1 "GND" H 8450 3280 30  0001 C CNN
F 2 "" H 8450 3350 60  0001 C CNN
F 3 "" H 8450 3350 60  0001 C CNN
	1    8450 3350
	1    0    0    -1  
$EndComp
$Comp
L R R305
U 1 1 51F2780F
P 8450 3000
F 0 "R305" V 8530 3000 50  0000 C CNN
F 1 "4.42k" V 8450 3000 50  0000 C CNN
F 2 "SM0603" H 8450 3000 60  0001 C CNN
F 3 "" H 8450 3000 60  0001 C CNN
	1    8450 3000
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C306
U 1 1 51F27803
P 8450 2550
F 0 "C306" H 8475 2600 30  0000 L CNN
F 1 "4.7nF" H 8475 2500 30  0000 L CNN
F 2 "SM0603" H 8450 2550 60  0001 C CNN
F 3 "" H 8450 2550 60  0001 C CNN
	1    8450 2550
	1    0    0    -1  
$EndComp
$Comp
L MP2303_SOIC8E U302
U 1 1 51F27799
P 9200 2100
F 0 "U302" H 9450 1800 60  0000 C CNN
F 1 "MP2303_SOIC8E" H 9250 1300 60  0000 C CNN
F 2 "SO8_WITH_EP" H 9200 2100 60  0001 C CNN
F 3 "" H 9200 2100 60  0001 C CNN
	1    9200 2100
	1    0    0    -1  
$EndComp
$Comp
L +3,3V #PWR079
U 1 1 51F1332C
P 10650 1450
F 0 "#PWR079" H 10650 1410 30  0001 C CNN
F 1 "+3,3V" H 10650 1560 30  0000 C CNN
F 2 "" H 10650 1450 60  0001 C CNN
F 3 "" H 10650 1450 60  0001 C CNN
	1    10650 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR080
U 1 1 51F132D9
P 9600 2800
F 0 "#PWR080" H 9600 2800 30  0001 C CNN
F 1 "GND" H 9600 2730 30  0001 C CNN
F 2 "" H 9600 2800 60  0001 C CNN
F 3 "" H 9600 2800 60  0001 C CNN
	1    9600 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR081
U 1 1 51F132C6
P 10700 2550
F 0 "#PWR081" H 10700 2550 30  0001 C CNN
F 1 "GND" H 10700 2480 30  0001 C CNN
F 2 "" H 10700 2550 60  0001 C CNN
F 3 "" H 10700 2550 60  0001 C CNN
	1    10700 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR082
U 1 1 51F132C3
P 10550 2550
F 0 "#PWR082" H 10550 2550 30  0001 C CNN
F 1 "GND" H 10550 2480 30  0001 C CNN
F 2 "" H 10550 2550 60  0001 C CNN
F 3 "" H 10550 2550 60  0001 C CNN
	1    10550 2550
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C312
U 1 1 51F132A8
P 10700 2350
F 0 "C312" H 10725 2400 30  0000 L CNN
F 1 "1uF" H 10725 2300 30  0000 L CNN
F 2 "SM0805" H 10700 2350 60  0001 C CNN
F 3 "" H 10700 2350 60  0001 C CNN
	1    10700 2350
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C311
U 1 1 51F132A1
P 10550 2350
F 0 "C311" H 10575 2400 30  0000 L CNN
F 1 "10uF" H 10575 2300 30  0000 L CNN
F 2 "SM0805" H 10550 2350 60  0001 C CNN
F 3 "" H 10550 2350 60  0001 C CNN
	1    10550 2350
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L302
U 1 1 51F1325E
P 10200 2000
F 0 "L302" V 10150 2000 40  0000 C CNN
F 1 "10uH" V 10300 2000 40  0000 C CNN
F 2 "IND_7x7x4.5" H 10200 2000 60  0001 C CNN
F 3 "" H 10200 2000 60  0001 C CNN
	1    10200 2000
	0    -1   -1   0   
$EndComp
$Comp
L CSMALL C308
U 1 1 51F13244
P 9650 1850
F 0 "C308" H 9675 1900 30  0000 L CNN
F 1 "10nF" H 9675 1800 30  0000 L CNN
F 2 "SM0603" H 9650 1850 60  0001 C CNN
F 3 "" H 9650 1850 60  0001 C CNN
	1    9650 1850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR083
U 1 1 51F13234
P 8800 2800
F 0 "#PWR083" H 8800 2800 30  0001 C CNN
F 1 "GND" H 8800 2730 30  0001 C CNN
F 2 "" H 8800 2800 60  0001 C CNN
F 3 "" H 8800 2800 60  0001 C CNN
	1    8800 2800
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C307
U 1 1 51F13225
P 8800 2600
F 0 "C307" H 8825 2650 30  0000 L CNN
F 1 "0.1uF" H 8825 2550 30  0000 L CNN
F 2 "SM0603" H 8800 2600 60  0001 C CNN
F 3 "" H 8800 2600 60  0001 C CNN
	1    8800 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR084
U 1 1 51F0DFBD
P 9200 2500
F 0 "#PWR084" H 9200 2500 30  0001 C CNN
F 1 "GND" H 9200 2430 30  0001 C CNN
F 2 "" H 9200 2500 60  0001 C CNN
F 3 "" H 9200 2500 60  0001 C CNN
	1    9200 2500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR085
U 1 1 51F0DFD3
P 9200 1550
F 0 "#PWR085" H 9200 1500 20  0001 C CNN
F 1 "+12V" H 9200 1650 30  0000 C CNN
F 2 "" H 9200 1550 60  0001 C CNN
F 3 "" H 9200 1550 60  0001 C CNN
	1    9200 1550
	1    0    0    -1  
$EndComp
$Comp
L R R304
U 1 1 51F0E058
P 8300 950
F 0 "R304" V 8380 950 50  0000 C CNN
F 1 "100k" V 8300 950 50  0000 C CNN
F 2 "SM0603" H 8300 950 60  0001 C CNN
F 3 "" H 8300 950 60  0001 C CNN
	1    8300 950 
	0    -1   -1   0   
$EndComp
$Comp
L R R306
U 1 1 51F0E067
P 8900 950
F 0 "R306" V 8980 950 50  0000 C CNN
F 1 "47k" V 8900 950 50  0000 C CNN
F 2 "SM0603" H 8900 950 60  0001 C CNN
F 3 "" H 8900 950 60  0001 C CNN
	1    8900 950 
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR086
U 1 1 51F0E26A
P 9200 1000
F 0 "#PWR086" H 9200 1000 30  0001 C CNN
F 1 "GND" H 9200 930 30  0001 C CNN
F 2 "" H 9200 1000 60  0001 C CNN
F 3 "" H 9200 1000 60  0001 C CNN
	1    9200 1000
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR087
U 1 1 51F0E279
P 8000 900
F 0 "#PWR087" H 8000 850 20  0001 C CNN
F 1 "+12V" H 8000 1000 30  0000 C CNN
F 2 "" H 8000 900 60  0001 C CNN
F 3 "" H 8000 900 60  0001 C CNN
	1    8000 900 
	1    0    0    -1  
$EndComp
Text Label 9600 2000 0    25   ~ 0
DC_SW
Text Label 9500 2100 0    25   ~ 0
DC_FB
$Comp
L CONN_2 P301
U 1 1 51F8EDC3
P 10500 950
F 0 "P301" V 10450 950 40  0000 C CNN
F 1 "12V_Conn" V 10550 950 40  0000 C CNN
F 2 "MOL_CONN_2_VH" H 10500 950 60  0001 C CNN
F 3 "" H 10500 950 60  0000 C CNN
	1    10500 950 
	1    0    0    1   
$EndComp
$Comp
L +12V #PWR088
U 1 1 51F8EDD5
P 10150 750
F 0 "#PWR088" H 10150 700 20  0001 C CNN
F 1 "+12V" H 10150 850 30  0000 C CNN
F 2 "" H 10150 750 60  0000 C CNN
F 3 "" H 10150 750 60  0000 C CNN
	1    10150 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR089
U 1 1 51F8EDE4
P 10150 1150
F 0 "#PWR089" H 10150 1150 30  0001 C CNN
F 1 "GND" H 10150 1080 30  0001 C CNN
F 2 "" H 10150 1150 60  0000 C CNN
F 3 "" H 10150 1150 60  0000 C CNN
	1    10150 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 750  10150 850 
Wire Wire Line
	10150 1050 10150 1150
$Comp
L CSMALL C310
U 1 1 51FADD95
P 9950 950
F 0 "C310" H 9975 1000 30  0000 L CNN
F 1 "4.7uF" H 9975 900 30  0000 L CNN
F 2 "SM1210" H 9950 950 60  0001 C CNN
F 3 "~" H 9950 950 60  0000 C CNN
	1    9950 950 
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C309
U 1 1 51FADDA4
P 9800 950
F 0 "C309" H 9825 1000 30  0000 L CNN
F 1 "1uF" H 9825 900 30  0000 L CNN
F 2 "SM1210" H 9800 950 60  0001 C CNN
F 3 "~" H 9800 950 60  0000 C CNN
	1    9800 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 850  9950 800 
Wire Wire Line
	9800 800  10150 800 
Connection ~ 10150 800 
Wire Wire Line
	9800 850  9800 800 
Connection ~ 9950 800 
Wire Wire Line
	9950 1050 9950 1100
Wire Wire Line
	9800 1100 10150 1100
Connection ~ 10150 1100
Wire Wire Line
	9800 1050 9800 1100
Connection ~ 9950 1100
$Comp
L MP2128-SOT23 U301
U 1 1 548345B9
P 3050 5700
F 0 "U301" H 3050 5900 60  0000 C CNN
F 1 "MP2128-SOT23" H 3050 6100 60  0000 C CNN
F 2 "SOT23-5" H 3050 5700 60  0001 C CNN
F 3 "" H 3050 5700 60  0000 C CNN
	1    3050 5700
	1    0    0    -1  
$EndComp
$Comp
L +1.2V #PWR090
U 1 1 548345F1
P 4750 5350
F 0 "#PWR090" H 4750 5490 20  0001 C CNN
F 1 "+1.2V" H 4750 5460 30  0000 C CNN
F 2 "" H 4750 5350 60  0000 C CNN
F 3 "" H 4750 5350 60  0000 C CNN
	1    4750 5350
	1    0    0    -1  
$EndComp
$Comp
L R R301
U 1 1 54834833
P 2400 5600
F 0 "R301" V 2480 5600 40  0000 C CNN
F 1 "10k" V 2407 5601 40  0000 C CNN
F 2 "SM0603" V 2330 5600 30  0001 C CNN
F 3 "~" H 2400 5600 30  0000 C CNN
	1    2400 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 5550 2700 5550
Wire Wire Line
	2700 5550 2700 5600
Wire Wire Line
	2700 5600 2650 5600
Wire Wire Line
	2150 5600 2050 5600
Wire Wire Line
	2050 5600 2050 5450
Wire Wire Line
	1750 5450 2750 5450
$Comp
L CSMALL C301
U 1 1 548348D3
P 1750 5600
F 0 "C301" H 1775 5650 30  0000 L CNN
F 1 "4.7u" H 1775 5550 30  0000 L CNN
F 2 "SM0805" H 1750 5600 60  0001 C CNN
F 3 "~" H 1750 5600 60  0000 C CNN
	1    1750 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5350 1750 5500
Connection ~ 2050 5450
$Comp
L GND #PWR091
U 1 1 54834979
P 1750 5850
F 0 "#PWR091" H 1750 5850 30  0001 C CNN
F 1 "GND" H 1750 5780 30  0001 C CNN
F 2 "" H 1750 5850 60  0000 C CNN
F 3 "" H 1750 5850 60  0000 C CNN
	1    1750 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR092
U 1 1 54834988
P 3050 5850
F 0 "#PWR092" H 3050 5850 30  0001 C CNN
F 1 "GND" H 3050 5780 30  0001 C CNN
F 2 "" H 3050 5850 60  0000 C CNN
F 3 "" H 3050 5850 60  0000 C CNN
	1    3050 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5800 3050 5850
Wire Wire Line
	1750 5700 1750 5850
$Comp
L INDUCTOR_SMALL L301
U 1 1 54834A43
P 3800 5450
F 0 "L301" H 3800 5550 50  0000 C CNN
F 1 "1u" H 3800 5400 50  0000 C CNN
F 2 "SM1210L" H 3800 5450 60  0001 C CNN
F 3 "~" H 3800 5450 60  0000 C CNN
	1    3800 5450
	1    0    0    -1  
$EndComp
$Comp
L R R302
U 1 1 54834A5C
P 4200 5750
F 0 "R302" V 4280 5750 40  0000 C CNN
F 1 "200k" V 4207 5751 40  0000 C CNN
F 2 "SM0603" V 4130 5750 30  0001 C CNN
F 3 "~" H 4200 5750 30  0000 C CNN
	1    4200 5750
	1    0    0    -1  
$EndComp
$Comp
L R R303
U 1 1 54834A6B
P 4200 6350
F 0 "R303" V 4280 6350 40  0000 C CNN
F 1 "200k" V 4207 6351 40  0000 C CNN
F 2 "SM0603" H 4130 6350 30  0001 C CNN
F 3 "~" H 4200 6350 30  0000 C CNN
	1    4200 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR093
U 1 1 54834A78
P 4200 6650
F 0 "#PWR093" H 4200 6650 30  0001 C CNN
F 1 "GND" H 4200 6580 30  0001 C CNN
F 2 "" H 4200 6650 60  0000 C CNN
F 3 "" H 4200 6650 60  0000 C CNN
	1    4200 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6600 4200 6650
Wire Wire Line
	4200 6000 4200 6100
Wire Wire Line
	4200 6050 3600 6050
Wire Wire Line
	3600 6050 3600 5650
Wire Wire Line
	3600 5650 3350 5650
Connection ~ 4200 6050
Wire Wire Line
	3350 5450 3550 5450
Wire Wire Line
	4050 5450 4750 5450
Wire Wire Line
	4200 5450 4200 5500
$Comp
L CSMALL C302
U 1 1 54834C1D
P 4400 5600
F 0 "C302" H 4425 5650 30  0000 L CNN
F 1 "4.7u" H 4425 5550 30  0000 L CNN
F 2 "SM0805" H 4400 5600 60  0001 C CNN
F 3 "~" H 4400 5600 60  0000 C CNN
	1    4400 5600
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C303
U 1 1 54834C2C
P 4650 5600
F 0 "C303" H 4675 5650 30  0000 L CNN
F 1 "4.7u" H 4675 5550 30  0000 L CNN
F 2 "SM0805" H 4650 5600 60  0001 C CNN
F 3 "~" H 4650 5600 60  0000 C CNN
	1    4650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5450 4750 5350
Connection ~ 4200 5450
Wire Wire Line
	4650 5500 4650 5450
Connection ~ 4650 5450
Wire Wire Line
	4400 5500 4400 5450
Connection ~ 4400 5450
$Comp
L GND #PWR094
U 1 1 54834D53
P 4400 5750
F 0 "#PWR094" H 4400 5750 30  0001 C CNN
F 1 "GND" H 4400 5680 30  0001 C CNN
F 2 "" H 4400 5750 60  0000 C CNN
F 3 "" H 4400 5750 60  0000 C CNN
	1    4400 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR095
U 1 1 54834D62
P 4650 5750
F 0 "#PWR095" H 4650 5750 30  0001 C CNN
F 1 "GND" H 4650 5680 30  0001 C CNN
F 2 "" H 4650 5750 60  0000 C CNN
F 3 "" H 4650 5750 60  0000 C CNN
	1    4650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5700 4650 5750
Wire Wire Line
	4400 5700 4400 5750
$Comp
L +3,3V #PWR096
U 1 1 54834E36
P 1750 5350
F 0 "#PWR096" H 1750 5310 30  0001 C CNN
F 1 "+3,3V" H 1750 5460 30  0000 C CNN
F 2 "" H 1750 5350 60  0001 C CNN
F 3 "" H 1750 5350 60  0001 C CNN
	1    1750 5350
	1    0    0    -1  
$EndComp
Connection ~ 1750 5450
$Comp
L RES_0603 R308
U 1 1 54ACFEAB
P 9900 2100
F 0 "R308" H 9900 2000 25  0000 C CNN
F 1 "30.9k" H 9900 2150 25  0000 C CNN
F 2 "SM0603" H 9900 2100 60  0001 C CNN
F 3 "~" H 9900 2100 60  0000 C CNN
	1    9900 2100
	1    0    0    -1  
$EndComp
$Comp
L RES_0603 R307
U 1 1 54ACFFEA
P 9600 2450
F 0 "R307" H 9600 2350 25  0000 C CNN
F 1 "10k" H 9600 2500 25  0000 C CNN
F 2 "SM0603" H 9600 2450 60  0001 C CNN
F 3 "~" H 9600 2450 60  0000 C CNN
	1    9600 2450
	0    -1   -1   0   
$EndComp
$Comp
L CSMALL C305
U 1 1 54B1DD38
P 8100 2000
F 0 "C305" H 8125 2050 30  0000 L CNN
F 1 "10uF" H 8125 1950 30  0000 L CNN
F 2 "SM1210" H 8100 2000 60  0001 C CNN
F 3 "~" H 8100 2000 60  0000 C CNN
	1    8100 2000
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C304
U 1 1 54B1DE1B
P 7800 2000
F 0 "C304" H 7825 2050 30  0000 L CNN
F 1 "10uF" H 7825 1950 30  0000 L CNN
F 2 "SM1210" H 7800 2000 60  0001 C CNN
F 3 "~" H 7800 2000 60  0000 C CNN
	1    7800 2000
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C315
U 1 1 54B1E3C7
P 10400 2350
F 0 "C315" H 10425 2400 30  0000 L CNN
F 1 "10uF" H 10425 2300 30  0000 L CNN
F 2 "SM0805" H 10400 2350 60  0001 C CNN
F 3 "" H 10400 2350 60  0001 C CNN
	1    10400 2350
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C314
U 1 1 54B1E3CD
P 10250 2350
F 0 "C314" H 10275 2400 30  0000 L CNN
F 1 "10uF" H 10275 2300 30  0000 L CNN
F 2 "SM0805" H 10250 2350 60  0001 C CNN
F 3 "" H 10250 2350 60  0001 C CNN
	1    10250 2350
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C313
U 1 1 54B1E3D3
P 10100 2350
F 0 "C313" H 10125 2400 30  0000 L CNN
F 1 "10uF" H 10125 2300 30  0000 L CNN
F 2 "SM0805" H 10100 2350 60  0001 C CNN
F 3 "" H 10100 2350 60  0001 C CNN
	1    10100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2250 10400 2100
Connection ~ 10400 2100
Wire Wire Line
	10250 2250 10250 2100
Connection ~ 10250 2100
Wire Wire Line
	10000 2100 10700 2100
Wire Wire Line
	10100 2100 10100 2250
Connection ~ 10100 2100
$Comp
L GND #PWR097
U 1 1 54B1E75F
P 10400 2550
F 0 "#PWR097" H 10400 2550 30  0001 C CNN
F 1 "GND" H 10400 2480 30  0001 C CNN
F 2 "" H 10400 2550 60  0000 C CNN
F 3 "" H 10400 2550 60  0000 C CNN
	1    10400 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR098
U 1 1 54B1E76E
P 10250 2550
F 0 "#PWR098" H 10250 2550 30  0001 C CNN
F 1 "GND" H 10250 2480 30  0001 C CNN
F 2 "" H 10250 2550 60  0000 C CNN
F 3 "" H 10250 2550 60  0000 C CNN
	1    10250 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR099
U 1 1 54B1E77D
P 10100 2550
F 0 "#PWR099" H 10100 2550 30  0001 C CNN
F 1 "GND" H 10100 2480 30  0001 C CNN
F 2 "" H 10100 2550 60  0000 C CNN
F 3 "" H 10100 2550 60  0000 C CNN
	1    10100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2450 10400 2550
Wire Wire Line
	10250 2450 10250 2550
Wire Wire Line
	10100 2450 10100 2550
Text Label 3400 5450 0    25   ~ 0
1.2_SW
Text Label 3700 6050 0    25   ~ 0
1.2_FB
$EndSCHEMATC
