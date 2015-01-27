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
LIBS:coolrunner
LIBS:motor_drivers
LIBS:stm32f103rg
LIBS:DC_DC
LIBS:oscillators
LIBS:reworked
LIBS:connectors
LIBS:misc_ic
LIBS:STM32F103RG_LQFP64
LIBS:xc3s200a
LIBS:DAC
LIBS:resistors
LIBS:stepper_controller-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date "27 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8200 700  8100 700 
Wire Wire Line
	6500 4050 6400 4050
Wire Wire Line
	8100 700  8100 800 
Wire Wire Line
	8200 1500 8000 1500
Wire Wire Line
	8200 1350 8000 1350
Wire Wire Line
	9700 1450 9700 1800
Connection ~ 1550 4900
Wire Wire Line
	1550 4850 1550 4900
Connection ~ 1700 4900
Wire Wire Line
	1700 4900 1700 4850
Connection ~ 1850 4900
Wire Wire Line
	1850 4900 1850 4850
Connection ~ 2000 4900
Wire Wire Line
	2000 4900 2000 4850
Connection ~ 2150 4900
Wire Wire Line
	2150 4900 2150 4850
Connection ~ 2300 4900
Wire Wire Line
	2300 4900 2300 4850
Connection ~ 1400 4900
Wire Wire Line
	1400 4850 1400 4950
Connection ~ 1550 4600
Wire Wire Line
	1550 4600 1550 4650
Connection ~ 1700 4600
Wire Wire Line
	1700 4600 1700 4650
Connection ~ 1850 4600
Wire Wire Line
	1850 4600 1850 4650
Connection ~ 2000 4600
Wire Wire Line
	2000 4600 2000 4650
Connection ~ 2150 4600
Wire Wire Line
	2150 4600 2150 4650
Connection ~ 2300 4600
Wire Wire Line
	2300 4600 2300 4650
Connection ~ 1400 4600
Wire Wire Line
	1400 4550 1400 4650
Wire Wire Line
	6200 5950 6100 5950
Wire Wire Line
	6100 5950 6100 6000
Wire Wire Line
	6100 6000 5450 6000
Wire Wire Line
	5150 6050 6200 6050
Wire Wire Line
	7050 5850 7050 5950
Wire Wire Line
	7050 6050 7050 6150
Wire Wire Line
	2000 3550 2000 3600
Wire Wire Line
	2000 2200 2000 2300
Wire Wire Line
	2000 3050 2000 2800
Connection ~ 3500 4850
Wire Wire Line
	3500 5100 3500 5200
Wire Wire Line
	4200 5100 4200 5200
Wire Wire Line
	3500 4850 3600 4850
Wire Wire Line
	950  3100 950  2850
Wire Wire Line
	950  2250 950  2350
Wire Wire Line
	950  3600 950  3650
Wire Wire Line
	8700 1350 8850 1350
Wire Wire Line
	8100 1300 8100 1350
Connection ~ 8100 1350
Wire Wire Line
	8700 1500 9150 1500
Wire Wire Line
	6500 4000 6400 4000
Text GLabel 6500 4050 2    25   BiDi ~ 0
D-
Text GLabel 6500 4000 2    25   BiDi ~ 0
D+
$Comp
L R R206
U 1 1 51EE8A0C
P 8100 1050
F 0 "R206" V 8180 1050 50  0000 C CNN
F 1 "1.5k" V 8100 1050 50  0000 C CNN
F 2 "SM0603" H 8100 1050 60  0001 C CNN
F 3 "" H 8100 1050 60  0001 C CNN
	1    8100 1050
	-1   0    0    -1  
$EndComp
$Comp
L R R208
U 1 1 51EE89FF
P 8450 1500
F 0 "R208" V 8530 1500 50  0000 C CNN
F 1 "22" V 8450 1500 50  0000 C CNN
F 2 "SM0603" H 8450 1500 60  0001 C CNN
F 3 "" H 8450 1500 60  0001 C CNN
	1    8450 1500
	0    -1   1    0   
$EndComp
$Comp
L R R207
U 1 1 51EE89F9
P 8450 1350
F 0 "R207" V 8530 1350 50  0000 C CNN
F 1 "22" V 8450 1350 50  0000 C CNN
F 2 "SM0603" H 8450 1350 60  0001 C CNN
F 3 "" H 8450 1350 60  0001 C CNN
	1    8450 1350
	0    1    -1   0   
$EndComp
Text GLabel 6500 3950 2    25   Input ~ 0
EXT_JTAG_TMS
Text GLabel 6200 3300 1    25   Input ~ 0
EXT_JTAG_TCK
$Comp
L +3,3V #PWR047
U 1 1 51E94D74
P 950 2250
F 0 "#PWR047" H 950 2210 30  0001 C CNN
F 1 "+3,3V" H 950 2360 30  0000 C CNN
F 2 "" H 950 2250 60  0001 C CNN
F 3 "" H 950 2250 60  0001 C CNN
	1    950  2250
	1    0    0    -1  
$EndComp
$Comp
L +3,3V #PWR048
U 1 1 51E94D72
P 2000 2200
F 0 "#PWR048" H 2000 2160 30  0001 C CNN
F 1 "+3,3V" H 2000 2310 30  0000 C CNN
F 2 "" H 2000 2200 60  0001 C CNN
F 3 "" H 2000 2200 60  0001 C CNN
	1    2000 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR049
U 1 1 51E94D6D
P 950 3650
F 0 "#PWR049" H 950 3650 30  0001 C CNN
F 1 "GND" H 950 3580 30  0001 C CNN
F 2 "" H 950 3650 60  0001 C CNN
F 3 "" H 950 3650 60  0001 C CNN
	1    950  3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR050
U 1 1 51E94D69
P 2000 3600
F 0 "#PWR050" H 2000 3600 30  0001 C CNN
F 1 "GND" H 2000 3530 30  0001 C CNN
F 2 "" H 2000 3600 60  0001 C CNN
F 3 "" H 2000 3600 60  0001 C CNN
	1    2000 3600
	1    0    0    -1  
$EndComp
$Comp
L R R202
U 1 1 51E94D60
P 950 3350
F 0 "R202" V 1030 3350 50  0000 C CNN
F 1 "10k" V 950 3350 50  0000 C CNN
F 2 "SM0603" H 950 3350 60  0001 C CNN
F 3 "" H 950 3350 60  0001 C CNN
	1    950  3350
	1    0    0    -1  
$EndComp
$Comp
L R R210
U 1 1 51E94D5B
P 2000 3300
F 0 "R210" V 2080 3300 50  0000 C CNN
F 1 "0" V 2000 3300 50  0000 C CNN
F 2 "SM0603" H 2000 3300 60  0001 C CNN
F 3 "" H 2000 3300 60  0001 C CNN
	1    2000 3300
	1    0    0    -1  
$EndComp
$Comp
L R R201
U 1 1 51E94D3A
P 950 2600
F 0 "R201" V 1030 2600 50  0000 C CNN
F 1 "0" V 950 2600 50  0000 C CNN
F 2 "SM0603" H 950 2600 60  0001 C CNN
F 3 "" H 950 2600 60  0001 C CNN
	1    950  2600
	1    0    0    -1  
$EndComp
$Comp
L R R209
U 1 1 51E94D30
P 2000 2550
F 0 "R209" V 2080 2550 50  0000 C CNN
F 1 "10k" V 2000 2550 50  0000 C CNN
F 2 "SM0603" H 2000 2550 60  0001 C CNN
F 3 "" H 2000 2550 60  0001 C CNN
	1    2000 2550
	1    0    0    -1  
$EndComp
Text Notes 3000 600  0    50   ~ 0
Bootmode:\n- BOOT1: X - BOOT0: 0 -> User Flash Memory\n- BOOT1: 0 - BOOT0: 1 -> System Memory\n- BOOT1: 1 - BOOT0: 1 -> Embedded SRAM
Text GLabel 6150 3300 1    25   Input ~ 0
EXT_JTAG_TDI
Text GLabel 5900 3300 1    25   Output ~ 0
EXT_JTAG_TDO
$Comp
L GND #PWR051
U 1 1 51E92FAC
P 3500 5200
F 0 "#PWR051" H 3500 5200 30  0001 C CNN
F 1 "GND" H 3500 5130 30  0001 C CNN
F 2 "" H 3500 5200 60  0001 C CNN
F 3 "" H 3500 5200 60  0001 C CNN
	1    3500 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR052
U 1 1 51E92FA9
P 4200 5200
F 0 "#PWR052" H 4200 5200 30  0001 C CNN
F 1 "GND" H 4200 5130 30  0001 C CNN
F 2 "" H 4200 5200 60  0001 C CNN
F 3 "" H 4200 5200 60  0001 C CNN
	1    4200 5200
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C208
U 1 1 51E92FA1
P 3500 5000
F 0 "C208" H 3525 5050 30  0000 L CNN
F 1 "CSMALL" H 3525 4950 30  0000 L CNN
F 2 "SM0603" H 3500 5000 60  0001 C CNN
F 3 "" H 3500 5000 60  0001 C CNN
	1    3500 5000
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C209
U 1 1 51E92F9D
P 4200 5000
F 0 "C209" H 4225 5050 30  0000 L CNN
F 1 "CSMALL" H 4225 4950 30  0000 L CNN
F 2 "SM0603" H 4200 5000 60  0001 C CNN
F 3 "" H 4200 5000 60  0001 C CNN
	1    4200 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR053
U 1 1 51E98334
P 7050 6150
F 0 "#PWR053" H 7050 6150 30  0001 C CNN
F 1 "GND" H 7050 6080 30  0001 C CNN
F 2 "" H 7050 6150 60  0001 C CNN
F 3 "" H 7050 6150 60  0001 C CNN
	1    7050 6150
	1    0    0    -1  
$EndComp
$Comp
L +3,3V #PWR054
U 1 1 51E98394
P 7050 5850
F 0 "#PWR054" H 7050 5810 30  0001 C CNN
F 1 "+3,3V" H 7050 5960 30  0000 C CNN
F 2 "" H 7050 5850 60  0001 C CNN
F 3 "" H 7050 5850 60  0001 C CNN
	1    7050 5850
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C202
U 1 1 51ECEDFC
P 1550 4750
F 0 "C202" H 1575 4800 30  0000 L CNN
F 1 "1uF" H 1575 4700 30  0000 L CNN
F 2 "SM0603" H 1550 4750 60  0001 C CNN
F 3 "" H 1550 4750 60  0001 C CNN
	1    1550 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C203
U 1 1 51ECEE0B
P 1700 4750
F 0 "C203" H 1725 4800 30  0000 L CNN
F 1 "1uF" H 1725 4700 30  0000 L CNN
F 2 "SM0603" H 1700 4750 60  0001 C CNN
F 3 "" H 1700 4750 60  0001 C CNN
	1    1700 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C204
U 1 1 51ECEE1A
P 1850 4750
F 0 "C204" H 1875 4800 30  0000 L CNN
F 1 "1uF" H 1875 4700 30  0000 L CNN
F 2 "SM0603" H 1850 4750 60  0001 C CNN
F 3 "" H 1850 4750 60  0001 C CNN
	1    1850 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C205
U 1 1 51ECEE29
P 2000 4750
F 0 "C205" H 2025 4800 30  0000 L CNN
F 1 "1uF" H 2025 4700 30  0000 L CNN
F 2 "SM0603" H 2000 4750 60  0001 C CNN
F 3 "" H 2000 4750 60  0001 C CNN
	1    2000 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C206
U 1 1 51ECEE38
P 2150 4750
F 0 "C206" H 2175 4800 30  0000 L CNN
F 1 "1uF" H 2175 4700 30  0000 L CNN
F 2 "SM0603" H 2150 4750 60  0001 C CNN
F 3 "" H 2150 4750 60  0001 C CNN
	1    2150 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C207
U 1 1 51ECEE47
P 2300 4750
F 0 "C207" H 2325 4800 30  0000 L CNN
F 1 "1uF" H 2325 4700 30  0000 L CNN
F 2 "SM0603" H 2300 4750 60  0001 C CNN
F 3 "" H 2300 4750 60  0001 C CNN
	1    2300 4750
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C201
U 1 1 51ECEE92
P 1400 4750
F 0 "C201" H 1425 4800 30  0000 L CNN
F 1 "1uF" H 1425 4700 30  0000 L CNN
F 2 "SM0603" H 1400 4750 60  0001 C CNN
F 3 "" H 1400 4750 60  0001 C CNN
	1    1400 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR055
U 1 1 51ECEEB0
P 1400 4950
F 0 "#PWR055" H 1400 4950 30  0001 C CNN
F 1 "GND" H 1400 4880 30  0001 C CNN
F 2 "" H 1400 4950 60  0001 C CNN
F 3 "" H 1400 4950 60  0001 C CNN
	1    1400 4950
	1    0    0    -1  
$EndComp
$Comp
L +3,3V #PWR056
U 1 1 51ECEEBF
P 1400 4550
F 0 "#PWR056" H 1400 4510 30  0001 C CNN
F 1 "+3,3V" H 1400 4660 30  0000 C CNN
F 2 "" H 1400 4550 60  0001 C CNN
F 3 "" H 1400 4550 60  0001 C CNN
	1    1400 4550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR057
U 1 1 51ECFB75
P 9050 1050
F 0 "#PWR057" H 9050 1140 20  0001 C CNN
F 1 "+5V" H 9050 1140 30  0000 C CNN
F 2 "" H 9050 1050 60  0001 C CNN
F 3 "" H 9050 1050 60  0001 C CNN
	1    9050 1050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR058
U 1 1 51ECFC07
P 9150 1200
F 0 "#PWR058" H 9150 1200 30  0001 C CNN
F 1 "GND" H 9150 1130 30  0001 C CNN
F 2 "" H 9150 1200 60  0001 C CNN
F 3 "" H 9150 1200 60  0001 C CNN
	1    9150 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR059
U 1 1 51ECFD33
P 9700 1800
F 0 "#PWR059" H 9700 1800 30  0001 C CNN
F 1 "GND" H 9700 1730 30  0001 C CNN
F 2 "" H 9700 1800 60  0001 C CNN
F 3 "" H 9700 1800 60  0001 C CNN
	1    9700 1800
	1    0    0    -1  
$EndComp
Text GLabel 8000 1350 0    25   BiDi ~ 0
D+
Text GLabel 8000 1500 0    25   BiDi ~ 0
D-
$Comp
L USB_OTG J201
U 1 1 51F8F13B
P 9600 1250
F 0 "J201" H 9900 1100 60  0000 C CNN
F 1 "USB_OTG" H 9600 1500 60  0000 C CNN
F 2 "Molex_54819-0572" H 9600 1250 60  0001 C CNN
F 3 "" H 9600 1250 60  0000 C CNN
	1    9600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1050 9050 1350
Wire Wire Line
	9050 1350 9450 1350
Wire Wire Line
	9450 1150 9150 1150
Wire Wire Line
	9150 1150 9150 1200
NoConn ~ 9450 1200
Wire Wire Line
	8850 1350 8850 1250
Wire Wire Line
	8850 1250 9450 1250
Wire Wire Line
	9150 1500 9150 1300
Wire Wire Line
	9150 1300 9450 1300
$Comp
L STM32F103RG_LQFP64 U201
U 1 1 51FBA36E
P 5850 4200
F 0 "U201" H 5850 4150 50  0000 C CNN
F 1 "STM32F103RG_LQFP64" H 6500 3000 50  0000 C CNN
F 2 "LQFP_64" H 5850 4200 60  0001 C CNN
F 3 "" H 5850 4200 60  0000 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3300 5900 3650
Wire Wire Line
	6150 3300 6150 3650
Wire Wire Line
	6200 3300 6200 3650
Wire Wire Line
	6500 3950 6400 3950
Wire Wire Line
	5650 2950 5650 3650
Connection ~ 950  2950
Wire Wire Line
	5750 4800 5750 5100
Wire Wire Line
	5700 4800 5700 5100
Wire Wire Line
	5650 4800 5650 5100
Wire Wire Line
	6000 4800 6000 5000
Wire Wire Line
	1400 4600 2300 4600
Wire Wire Line
	1400 4900 2300 4900
Wire Wire Line
	5450 6000 5450 4800
Wire Wire Line
	5250 4600 5150 4600
Wire Wire Line
	5150 4600 5150 6050
Wire Wire Line
	6000 1900 6000 3650
Wire Wire Line
	6050 1600 6050 3650
Wire Wire Line
	5250 4100 4200 4100
Wire Wire Line
	4200 4100 4200 4900
Wire Wire Line
	5250 4050 3500 4050
Wire Wire Line
	3500 4050 3500 4900
$Comp
L LED D203
U 1 1 51FBDFB6
P 4850 1900
F 0 "D203" H 4850 2000 50  0000 C CNN
F 1 "POWER_GREEN" H 4850 1800 50  0000 C CNN
F 2 "LED-0805" H 4850 1900 60  0001 C CNN
F 3 "~" H 4850 1900 60  0000 C CNN
	1    4850 1900
	-1   0    0    1   
$EndComp
$Comp
L LED D202
U 1 1 51FBDFC5
P 4850 1600
F 0 "D202" H 4850 1700 50  0000 C CNN
F 1 "BUSY_ORANGE" H 4850 1500 50  0000 C CNN
F 2 "LED-0805" H 4850 1600 60  0001 C CNN
F 3 "~" H 4850 1600 60  0000 C CNN
	1    4850 1600
	-1   0    0    1   
$EndComp
$Comp
L R R204
U 1 1 51FBE1F8
P 5500 1600
F 0 "R204" V 5580 1600 40  0000 C CNN
F 1 "?" V 5507 1601 40  0000 C CNN
F 2 "SM0603_Resistor" V 5430 1600 30  0001 C CNN
F 3 "~" H 5500 1600 30  0000 C CNN
	1    5500 1600
	0    -1   -1   0   
$EndComp
$Comp
L R R205
U 1 1 51FBE207
P 5500 1900
F 0 "R205" V 5580 1900 40  0000 C CNN
F 1 "?" V 5507 1901 40  0000 C CNN
F 2 "SM0603_Resistor" V 5430 1900 30  0001 C CNN
F 3 "~" H 5500 1900 30  0000 C CNN
	1    5500 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 1900 4500 1900
Wire Wire Line
	4500 1900 4500 2650
Wire Wire Line
	4650 1600 4200 1600
Wire Wire Line
	4200 1600 4200 2650
$Comp
L GND #PWR060
U 1 1 51FBE43B
P 4200 2650
F 0 "#PWR060" H 4200 2650 30  0001 C CNN
F 1 "GND" H 4200 2580 30  0001 C CNN
F 2 "" H 4200 2650 60  0000 C CNN
F 3 "" H 4200 2650 60  0000 C CNN
	1    4200 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR061
U 1 1 51FBE44A
P 4500 2650
F 0 "#PWR061" H 4500 2650 30  0001 C CNN
F 1 "GND" H 4500 2580 30  0001 C CNN
F 2 "" H 4500 2650 60  0000 C CNN
F 3 "" H 4500 2650 60  0000 C CNN
	1    4500 2650
	1    0    0    -1  
$EndComp
NoConn ~ 5250 3850
NoConn ~ 5250 4150
$Comp
L +3,3V #PWR062
U 1 1 51FD25E1
P 5450 3450
F 0 "#PWR062" H 5450 3410 30  0001 C CNN
F 1 "+3,3V" H 5450 3560 30  0000 C CNN
F 2 "" H 5450 3450 60  0000 C CNN
F 3 "" H 5450 3450 60  0000 C CNN
	1    5450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3850 6450 3850
Wire Wire Line
	6400 4250 6900 4250
$Comp
L TXC_50X32_AB X201
U 1 1 5202574B
P 3850 4750
F 0 "X201" H 3850 4550 60  0000 C CNN
F 1 "TXC_50X32_AB" H 3850 5000 60  0000 C CNN
F 2 "XTAL_5.0x3.2mm" H 3850 4750 60  0001 C CNN
F 3 "" H 3850 4750 60  0000 C CNN
	1    3850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4650 4200 4650
Connection ~ 4200 4650
$Comp
L GND #PWR063
U 1 1 52025913
P 4050 5050
F 0 "#PWR063" H 4050 5050 30  0001 C CNN
F 1 "GND" H 4050 4980 30  0001 C CNN
F 2 "" H 4050 5050 60  0000 C CNN
F 3 "" H 4050 5050 60  0000 C CNN
	1    4050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4850 4100 4950
Wire Wire Line
	4100 4950 4050 4950
Wire Wire Line
	4050 4950 4050 5050
$Comp
L GND #PWR064
U 1 1 520259FA
P 3550 4700
F 0 "#PWR064" H 3550 4700 30  0001 C CNN
F 1 "GND" H 3550 4630 30  0001 C CNN
F 2 "" H 3550 4700 60  0000 C CNN
F 3 "" H 3550 4700 60  0000 C CNN
	1    3550 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4650 3550 4650
Wire Wire Line
	3550 4650 3550 4700
Text Notes 5800 6000 0    60   ~ 0
TX
Text Notes 5800 6150 0    60   ~ 0
RX
Wire Wire Line
	6500 4200 6400 4200
Text HLabel 5650 5100 3    25   Output ~ 0
FPGA_SPI_CLK
Text HLabel 5700 5100 3    25   Input ~ 0
FPGA_SPI_MISO
Text HLabel 5750 5100 3    25   Output ~ 0
FPGA_SPI_MOSI
Text HLabel 6500 4200 2    25   Output ~ 0
FPGA_CLK
Text Label 8200 700  0    25   ~ 0
USB_PUP
Text Label 6900 4250 0    25   ~ 0
USB_PUP
Text Label 5650 2950 3    25   ~ 0
BOOT0
Wire Wire Line
	950  2950 1350 2950
Text Label 1350 2950 2    25   ~ 0
BOOT0
Wire Wire Line
	5550 3650 5550 2950
Text HLabel 5550 2950 1    25   Output ~ 0
FPGA_PROG_B
Text HLabel 6500 4600 2    25   Output ~ 0
FPGA_COM_CS
Wire Wire Line
	6400 4600 6500 4600
Text HLabel 6500 4550 2    25   Output ~ 0
FPGA_COM_CLK
Text HLabel 6500 4500 2    25   Input ~ 0
FPGA_COM_MISO
Text HLabel 6500 4450 2    25   Output ~ 0
FPGA_COM_MOSI
Wire Wire Line
	6500 4550 6400 4550
Wire Wire Line
	6500 4500 6400 4500
Wire Wire Line
	6500 4450 6400 4450
$Comp
L +3,3V #PWR065
U 1 1 54915ED2
P 6450 3700
F 0 "#PWR065" H 6450 3660 30  0001 C CNN
F 1 "+3,3V" H 6450 3810 30  0000 C CNN
F 2 "" H 6450 3700 60  0000 C CNN
F 3 "" H 6450 3700 60  0000 C CNN
	1    6450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3850 6450 3700
Wire Wire Line
	5450 3450 5450 3650
Text Label 6000 5000 1    25   ~ 0
BOOT1
Wire Wire Line
	2000 2950 1650 2950
Connection ~ 2000 2950
Text Label 1650 2950 0    25   ~ 0
BOOT1
$Comp
L GND #PWR066
U 1 1 54916247
P 5500 3250
F 0 "#PWR066" H 5500 3250 30  0001 C CNN
F 1 "GND" H 5500 3180 30  0001 C CNN
F 2 "" H 5500 3250 60  0000 C CNN
F 3 "" H 5500 3250 60  0000 C CNN
	1    5500 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 3250 5500 3650
$Comp
L GND #PWR067
U 1 1 549162CE
P 6950 3950
F 0 "#PWR067" H 6950 3950 30  0001 C CNN
F 1 "GND" H 6950 3880 30  0001 C CNN
F 2 "" H 6950 3950 60  0000 C CNN
F 3 "" H 6950 3950 60  0000 C CNN
	1    6950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3900 6950 3900
Wire Wire Line
	6950 3900 6950 3950
$Comp
L GND #PWR068
U 1 1 549165A1
P 6150 5150
F 0 "#PWR068" H 6150 5150 30  0001 C CNN
F 1 "GND" H 6150 5080 30  0001 C CNN
F 2 "" H 6150 5150 60  0000 C CNN
F 3 "" H 6150 5150 60  0000 C CNN
	1    6150 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR069
U 1 1 549165B0
P 5500 5150
F 0 "#PWR069" H 5500 5150 30  0001 C CNN
F 1 "GND" H 5500 5080 30  0001 C CNN
F 2 "" H 5500 5150 60  0000 C CNN
F 3 "" H 5500 5150 60  0000 C CNN
	1    5500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4800 6150 5150
Wire Wire Line
	5500 4800 5500 5150
$Comp
L GND #PWR070
U 1 1 549166B6
P 4800 4450
F 0 "#PWR070" H 4800 4450 30  0001 C CNN
F 1 "GND" H 4800 4380 30  0001 C CNN
F 2 "" H 4800 4450 60  0000 C CNN
F 3 "" H 4800 4450 60  0000 C CNN
	1    4800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4400 4800 4400
Wire Wire Line
	4800 4400 4800 4450
$Comp
L +3,3V #PWR071
U 1 1 54916740
P 6200 5000
F 0 "#PWR071" H 6200 4960 30  0001 C CNN
F 1 "+3,3V" H 6200 5110 30  0000 C CNN
F 2 "" H 6200 5000 60  0000 C CNN
F 3 "" H 6200 5000 60  0000 C CNN
	1    6200 5000
	-1   0    0    1   
$EndComp
$Comp
L +3,3V #PWR072
U 1 1 54916746
P 5000 4450
F 0 "#PWR072" H 5000 4410 30  0001 C CNN
F 1 "+3,3V" H 5000 4560 30  0000 C CNN
F 2 "" H 5000 4450 60  0000 C CNN
F 3 "" H 5000 4450 60  0000 C CNN
	1    5000 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 4450 5250 4450
Wire Wire Line
	6200 5000 6200 4800
$Comp
L +3,3V #PWR073
U 1 1 5491684B
P 5550 5000
F 0 "#PWR073" H 5550 4960 30  0001 C CNN
F 1 "+3,3V" H 5550 5110 30  0000 C CNN
F 2 "" H 5550 5000 60  0000 C CNN
F 3 "" H 5550 5000 60  0000 C CNN
	1    5550 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 4800 5550 5000
Text HLabel 5100 4550 0    25   Input ~ 0
FPGA_DONE
Wire Wire Line
	5100 4550 5250 4550
Text HLabel 5600 5100 3    25   Input ~ 0
FPGA_INITB
Wire Wire Line
	5600 5100 5600 4800
Text Notes 7000 4550 0    60   ~ 0
SPI2
Text Notes 5600 5550 0    60   ~ 0
SPI1
Text Notes 5350 6200 0    60   ~ 0
USART2
Text HLabel 4850 3900 0    25   Output ~ 0
/CLR_DAC
Wire Wire Line
	4850 3900 5250 3900
Wire Wire Line
	5050 1600 5250 1600
Wire Wire Line
	5050 1900 5250 1900
Wire Wire Line
	5750 1900 6000 1900
Wire Wire Line
	5750 1600 6050 1600
$Comp
L CONN_2X2 P201
U 1 1 54C59C63
P 6600 6000
F 0 "P201" H 6600 6150 50  0000 C CNN
F 1 "CONN_2X2" H 6610 5870 40  0000 C CNN
F 2 "PIN_ARRAY_2X2" H 6600 6000 60  0001 C CNN
F 3 "" H 6600 6000 60  0000 C CNN
	1    6600 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5950 7000 5950
Wire Wire Line
	7000 6050 7050 6050
$EndSCHEMATC
