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
Sheet 4 4
Title ""
Date "31 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L XC3S200A U401
U 1 1 54825DB5
P 10350 1500
F 0 "U401" H 10350 2200 60  0000 C CNN
F 1 "XC3S200A" H 10350 2400 60  0000 C CNN
F 2 "TQFP_100" H 10450 1400 60  0001 C CNN
F 3 "~" H 10450 1400 60  0000 C CNN
	1    10350 1500
	1    0    0    -1  
$EndComp
$Comp
L XC3S200A U401
U 5 1 54825DC4
P 2100 5700
F 0 "U401" H 2100 6400 60  0000 C CNN
F 1 "XC3S200A" H 2100 6600 60  0000 C CNN
F 2 "~" H 2200 5600 60  0000 C CNN
F 3 "~" H 2200 5600 60  0000 C CNN
	5    2100 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0100
U 1 1 54825DD3
P 1600 6850
F 0 "#PWR0100" H 1600 6850 30  0001 C CNN
F 1 "GND" H 1600 6780 30  0001 C CNN
F 2 "" H 1600 6850 60  0000 C CNN
F 3 "" H 1600 6850 60  0000 C CNN
	1    1600 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5400 1600 5400
Wire Wire Line
	1600 5400 1600 6850
Wire Wire Line
	1800 5500 1600 5500
Connection ~ 1600 5500
Wire Wire Line
	1800 5600 1600 5600
Connection ~ 1600 5600
Wire Wire Line
	1800 5700 1600 5700
Connection ~ 1600 5700
Wire Wire Line
	1800 5800 1600 5800
Connection ~ 1600 5800
Wire Wire Line
	1800 5900 1600 5900
Connection ~ 1600 5900
Wire Wire Line
	1800 6000 1600 6000
Connection ~ 1600 6000
Wire Wire Line
	1800 6100 1600 6100
Connection ~ 1600 6100
Wire Wire Line
	1800 6200 1600 6200
Connection ~ 1600 6200
Wire Wire Line
	1800 6300 1600 6300
Connection ~ 1600 6300
Wire Wire Line
	1800 6400 1600 6400
Connection ~ 1600 6400
Wire Wire Line
	1800 6500 1600 6500
Connection ~ 1600 6500
Wire Wire Line
	1800 6600 1600 6600
Connection ~ 1600 6600
$Comp
L XC3S200A U401
U 3 1 54826A0A
P 10350 5550
F 0 "U401" H 10350 6250 60  0000 C CNN
F 1 "XC3S200A" H 10350 6450 60  0000 C CNN
F 2 "~" H 10450 5450 60  0000 C CNN
F 3 "~" H 10450 5450 60  0000 C CNN
	3    10350 5550
	1    0    0    -1  
$EndComp
$Comp
L R R401
U 1 1 54826A3C
P 7150 5300
F 0 "R401" V 7230 5300 40  0000 C CNN
F 1 "R" V 7157 5301 40  0000 C CNN
F 2 "SM0603" V 7080 5300 30  0001 C CNN
F 3 "~" H 7150 5300 30  0000 C CNN
	1    7150 5300
	1    0    0    -1  
$EndComp
$Comp
L R R402
U 1 1 54826A4B
P 7400 5300
F 0 "R402" V 7480 5300 40  0000 C CNN
F 1 "R" V 7407 5301 40  0000 C CNN
F 2 "SM0603" V 7330 5300 30  0001 C CNN
F 3 "~" H 7400 5300 30  0000 C CNN
	1    7400 5300
	1    0    0    -1  
$EndComp
$Comp
L R R404
U 1 1 54826A5A
P 7650 5300
F 0 "R404" V 7730 5300 40  0000 C CNN
F 1 "R" V 7657 5301 40  0000 C CNN
F 2 "SM0603" V 7580 5300 30  0001 C CNN
F 3 "~" H 7650 5300 30  0000 C CNN
	1    7650 5300
	1    0    0    -1  
$EndComp
$Comp
L R R403
U 1 1 54826A8B
P 7400 6150
F 0 "R403" V 7480 6150 40  0000 C CNN
F 1 "NE" V 7407 6151 40  0000 C CNN
F 2 "SM0603" V 7330 6150 30  0001 C CNN
F 3 "~" H 7400 6150 30  0000 C CNN
	1    7400 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0101
U 1 1 54826AA8
P 7400 6600
F 0 "#PWR0101" H 7400 6600 30  0001 C CNN
F 1 "GND" H 7400 6530 30  0001 C CNN
F 2 "" H 7400 6600 60  0000 C CNN
F 3 "" H 7400 6600 60  0000 C CNN
	1    7400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6400 7400 6600
Wire Wire Line
	7400 5550 7400 5900
Wire Wire Line
	10050 6050 8550 6050
Wire Wire Line
	8550 6050 8550 5650
Wire Wire Line
	8550 5650 7150 5650
Wire Wire Line
	7400 5750 8450 5750
Wire Wire Line
	8450 5750 8450 6100
Wire Wire Line
	8450 6100 10050 6100
Connection ~ 7400 5750
Wire Wire Line
	10050 6150 8350 6150
Wire Wire Line
	8350 6150 8350 5850
Wire Wire Line
	8350 5850 7650 5850
Text Notes 6050 5200 0    39   ~ 0
M0
Text Notes 6200 5200 0    39   ~ 0
M1
Text Notes 6350 5200 0    39   ~ 0
M2
Wire Notes Line
	6000 5125 6850 5125
Wire Notes Line
	6000 5200 6850 5200
Text Notes 6475 5275 0    39   ~ 0
Slave Serial
Text Notes 6575 5350 0    39   ~ 0
JTAG
Wire Notes Line
	6000 5275 6850 5275
Wire Notes Line
	6000 5350 6850 5350
Text Notes 6075 5275 0    39   ~ 0
1
Text Notes 6225 5275 0    39   ~ 0
1
Text Notes 6375 5275 0    39   ~ 0
1
Text Notes 6075 5350 0    39   ~ 0
1
Text Notes 6375 5350 0    39   ~ 0
1
Text Notes 6225 5350 0    39   ~ 0
0
Wire Notes Line
	6850 5350 6850 5125
Wire Notes Line
	6450 5350 6450 5125
Wire Notes Line
	6300 5350 6300 5125
Wire Notes Line
	6150 5350 6150 5125
Wire Notes Line
	6000 5125 6000 5350
Text Notes 6000 5450 0    39   ~ 0
For other mode: UG332 (PDF)
Wire Wire Line
	9650 5350 10050 5350
Wire Wire Line
	9650 5450 10050 5450
$Comp
L XC3S200A U401
U 6 1 54826FE4
P 4700 5700
F 0 "U401" H 4700 6400 60  0000 C CNN
F 1 "XC3S200A" H 4700 6600 60  0000 C CNN
F 2 "~" H 4800 5600 60  0000 C CNN
F 3 "~" H 4800 5600 60  0000 C CNN
	6    4700 5700
	1    0    0    -1  
$EndComp
Text GLabel 3900 5800 0    25   Input ~ 0
FPGA_TCK
Text GLabel 3900 5850 0    25   Input ~ 0
FPGA_TDI
Text GLabel 3900 5900 0    25   Output ~ 0
FPGA_TDO
Text GLabel 3900 5950 0    25   Input ~ 0
FPGA_TMS
Wire Wire Line
	7150 5650 7150 5550
Wire Wire Line
	7650 5850 7650 5550
$Comp
L +1.2V #PWR0102
U 1 1 5483571D
P 4150 6600
F 0 "#PWR0102" H 4150 6740 20  0001 C CNN
F 1 "+1.2V" H 4150 6710 30  0000 C CNN
F 2 "" H 4150 6600 60  0000 C CNN
F 3 "" H 4150 6600 60  0000 C CNN
	1    4150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6600 4150 6900
Wire Wire Line
	4150 6750 4400 6750
Wire Wire Line
	3200 6800 4400 6800
Connection ~ 4150 6750
Wire Wire Line
	4150 6850 4400 6850
Connection ~ 4150 6800
Wire Wire Line
	4150 6900 4400 6900
Connection ~ 4150 6850
$Comp
L +3,3V #PWR0103
U 1 1 54835855
P 4150 6100
F 0 "#PWR0103" H 4150 6060 30  0001 C CNN
F 1 "+3,3V" H 4150 6210 30  0000 C CNN
F 2 "" H 4150 6100 60  0000 C CNN
F 3 "" H 4150 6100 60  0000 C CNN
	1    4150 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6100 4150 6350
Wire Wire Line
	4150 6350 4400 6350
Wire Wire Line
	3400 6300 4400 6300
Connection ~ 4150 6300
Wire Wire Line
	4400 6250 4150 6250
Connection ~ 4150 6250
$Comp
L +3,3V #PWR0104
U 1 1 5483592A
P 7400 4900
F 0 "#PWR0104" H 7400 4860 30  0001 C CNN
F 1 "+3,3V" H 7400 5010 30  0000 C CNN
F 2 "" H 7400 4900 60  0000 C CNN
F 3 "" H 7400 4900 60  0000 C CNN
	1    7400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4900 7400 5050
Wire Wire Line
	7650 4950 7650 5050
Wire Wire Line
	7150 4950 7650 4950
Connection ~ 7400 4950
Wire Wire Line
	7150 4950 7150 5050
$Comp
L CSMALL C406
U 1 1 54835A12
P 3800 6450
F 0 "C406" H 3825 6500 30  0000 L CNN
F 1 "10n" H 3825 6400 30  0000 L CNN
F 2 "SM0603" H 3800 6450 60  0001 C CNN
F 3 "~" H 3800 6450 60  0000 C CNN
	1    3800 6450
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C404
U 1 1 54835A21
P 3600 6450
F 0 "C404" H 3625 6500 30  0000 L CNN
F 1 "100n" H 3625 6400 30  0000 L CNN
F 2 "SM0603" H 3600 6450 60  0001 C CNN
F 3 "~" H 3600 6450 60  0000 C CNN
	1    3600 6450
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C402
U 1 1 54835A30
P 3400 6450
F 0 "C402" H 3425 6500 30  0000 L CNN
F 1 "1u" H 3425 6400 30  0000 L CNN
F 2 "SM0603" H 3400 6450 60  0001 C CNN
F 3 "~" H 3400 6450 60  0000 C CNN
	1    3400 6450
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C407
U 1 1 54835A3F
P 3800 6950
F 0 "C407" H 3825 7000 30  0000 L CNN
F 1 "10n" H 3825 6900 30  0000 L CNN
F 2 "SM0603" H 3800 6950 60  0001 C CNN
F 3 "~" H 3800 6950 60  0000 C CNN
	1    3800 6950
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C405
U 1 1 54835A4E
P 3600 6950
F 0 "C405" H 3625 7000 30  0000 L CNN
F 1 "100n" H 3625 6900 30  0000 L CNN
F 2 "SM0603" H 3600 6950 60  0001 C CNN
F 3 "~" H 3600 6950 60  0000 C CNN
	1    3600 6950
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C403
U 1 1 54835A5D
P 3400 6950
F 0 "C403" H 3425 7000 30  0000 L CNN
F 1 "100n" H 3425 6900 30  0000 L CNN
F 2 "SM0603" H 3400 6950 60  0001 C CNN
F 3 "~" H 3400 6950 60  0000 C CNN
	1    3400 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 6800 3400 6850
Wire Wire Line
	3600 6850 3600 6800
Connection ~ 3600 6800
Wire Wire Line
	3800 6850 3800 6800
Connection ~ 3800 6800
Wire Wire Line
	3800 6300 3800 6350
Wire Wire Line
	3600 6300 3600 6350
Connection ~ 3800 6300
Wire Wire Line
	3400 6300 3400 6350
Connection ~ 3600 6300
$Comp
L CSMALL C401
U 1 1 54835C44
P 3200 6950
F 0 "C401" H 3225 7000 30  0000 L CNN
F 1 "1u" H 3225 6900 30  0000 L CNN
F 2 "SM0603" H 3200 6950 60  0001 C CNN
F 3 "~" H 3200 6950 60  0000 C CNN
	1    3200 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 6800 3200 6850
Connection ~ 3400 6800
$Comp
L GND #PWR0105
U 1 1 54835CA2
P 3800 7150
F 0 "#PWR0105" H 3800 7150 30  0001 C CNN
F 1 "GND" H 3800 7080 30  0001 C CNN
F 2 "" H 3800 7150 60  0000 C CNN
F 3 "" H 3800 7150 60  0000 C CNN
	1    3800 7150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0106
U 1 1 54835CB1
P 3600 7150
F 0 "#PWR0106" H 3600 7150 30  0001 C CNN
F 1 "GND" H 3600 7080 30  0001 C CNN
F 2 "" H 3600 7150 60  0000 C CNN
F 3 "" H 3600 7150 60  0000 C CNN
	1    3600 7150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0107
U 1 1 54835CC0
P 3400 7150
F 0 "#PWR0107" H 3400 7150 30  0001 C CNN
F 1 "GND" H 3400 7080 30  0001 C CNN
F 2 "" H 3400 7150 60  0000 C CNN
F 3 "" H 3400 7150 60  0000 C CNN
	1    3400 7150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0108
U 1 1 54835CCF
P 3200 7150
F 0 "#PWR0108" H 3200 7150 30  0001 C CNN
F 1 "GND" H 3200 7080 30  0001 C CNN
F 2 "" H 3200 7150 60  0000 C CNN
F 3 "" H 3200 7150 60  0000 C CNN
	1    3200 7150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0109
U 1 1 54835CDE
P 3400 6650
F 0 "#PWR0109" H 3400 6650 30  0001 C CNN
F 1 "GND" H 3400 6580 30  0001 C CNN
F 2 "" H 3400 6650 60  0000 C CNN
F 3 "" H 3400 6650 60  0000 C CNN
	1    3400 6650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0110
U 1 1 54835CED
P 3600 6650
F 0 "#PWR0110" H 3600 6650 30  0001 C CNN
F 1 "GND" H 3600 6580 30  0001 C CNN
F 2 "" H 3600 6650 60  0000 C CNN
F 3 "" H 3600 6650 60  0000 C CNN
	1    3600 6650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0111
U 1 1 54835CFC
P 3800 6650
F 0 "#PWR0111" H 3800 6650 30  0001 C CNN
F 1 "GND" H 3800 6580 30  0001 C CNN
F 2 "" H 3800 6650 60  0000 C CNN
F 3 "" H 3800 6650 60  0000 C CNN
	1    3800 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6550 3800 6650
Wire Wire Line
	3600 6550 3600 6650
Wire Wire Line
	3400 6550 3400 6650
Wire Wire Line
	3200 7050 3200 7150
Wire Wire Line
	3400 7050 3400 7150
Wire Wire Line
	3600 7050 3600 7150
Wire Wire Line
	3800 7050 3800 7150
Wire Wire Line
	9650 5300 10050 5300
Wire Wire Line
	4150 5250 4400 5250
Wire Wire Line
	4150 5350 4400 5350
$Comp
L +3,3V #PWR0112
U 1 1 5483645D
P 9800 4950
F 0 "#PWR0112" H 9800 4910 30  0001 C CNN
F 1 "+3,3V" H 9800 5060 30  0000 C CNN
F 2 "" H 9800 4950 60  0000 C CNN
F 3 "" H 9800 4950 60  0000 C CNN
	1    9800 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4950 9800 5100
Wire Wire Line
	9800 5100 10050 5100
Wire Wire Line
	9000 5050 10050 5050
Connection ~ 9800 5050
Wire Wire Line
	3900 5800 4400 5800
Wire Wire Line
	3900 5850 4400 5850
Wire Wire Line
	3900 5900 4400 5900
Wire Wire Line
	3900 5950 4400 5950
$Comp
L XC3S200A U401
U 2 1 5483689D
P 7750 1500
F 0 "U401" H 7750 2200 60  0000 C CNN
F 1 "XC3S200A" H 7750 2400 60  0000 C CNN
F 2 "~" H 7850 1400 60  0000 C CNN
F 3 "~" H 7850 1400 60  0000 C CNN
	2    7750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1550 10050 1550
$Comp
L CSMALL C409
U 1 1 54836AF0
P 9150 5200
F 0 "C409" H 9175 5250 30  0000 L CNN
F 1 "100n" H 9175 5150 30  0000 L CNN
F 2 "SM0603" H 9150 5200 60  0001 C CNN
F 3 "~" H 9150 5200 60  0000 C CNN
	1    9150 5200
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C408
U 1 1 54836AFF
P 9000 5200
F 0 "C408" H 9025 5250 30  0000 L CNN
F 1 "1u" H 9025 5150 30  0000 L CNN
F 2 "SM0603" H 9000 5200 60  0001 C CNN
F 3 "~" H 9000 5200 60  0000 C CNN
	1    9000 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0113
U 1 1 54836B1F
P 9150 5400
F 0 "#PWR0113" H 9150 5400 30  0001 C CNN
F 1 "GND" H 9150 5330 30  0001 C CNN
F 2 "" H 9150 5400 60  0000 C CNN
F 3 "" H 9150 5400 60  0000 C CNN
	1    9150 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0114
U 1 1 54836B2E
P 9000 5400
F 0 "#PWR0114" H 9000 5400 30  0001 C CNN
F 1 "GND" H 9000 5330 30  0001 C CNN
F 2 "" H 9000 5400 60  0000 C CNN
F 3 "" H 9000 5400 60  0000 C CNN
	1    9000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5050 9150 5100
Wire Wire Line
	9000 5050 9000 5100
Connection ~ 9150 5050
Wire Wire Line
	9150 5300 9150 5400
Wire Wire Line
	9000 5300 9000 5400
$Comp
L +3,3V #PWR0115
U 1 1 54836D47
P 9800 900
F 0 "#PWR0115" H 9800 860 30  0001 C CNN
F 1 "+3,3V" H 9800 1010 30  0000 C CNN
F 2 "" H 9800 900 60  0000 C CNN
F 3 "" H 9800 900 60  0000 C CNN
	1    9800 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 900  9800 1050
Wire Wire Line
	9800 1050 10050 1050
Wire Wire Line
	9000 1000 10050 1000
Connection ~ 9800 1000
$Comp
L CSMALL C413
U 1 1 54836D51
P 9150 1150
F 0 "C413" H 9175 1200 30  0000 L CNN
F 1 "100n" H 9175 1100 30  0000 L CNN
F 2 "SM0603" H 9150 1150 60  0001 C CNN
F 3 "~" H 9150 1150 60  0000 C CNN
	1    9150 1150
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C412
U 1 1 54836D57
P 9000 1150
F 0 "C412" H 9025 1200 30  0000 L CNN
F 1 "1u" H 9025 1100 30  0000 L CNN
F 2 "SM0603" H 9000 1150 60  0001 C CNN
F 3 "~" H 9000 1150 60  0000 C CNN
	1    9000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1000 9150 1050
Wire Wire Line
	9000 1000 9000 1050
Connection ~ 9150 1000
$Comp
L +3,3V #PWR0116
U 1 1 54836D60
P 7200 900
F 0 "#PWR0116" H 7200 860 30  0001 C CNN
F 1 "+3,3V" H 7200 1010 30  0000 C CNN
F 2 "" H 7200 900 60  0000 C CNN
F 3 "" H 7200 900 60  0000 C CNN
	1    7200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1000 7450 1000
$Comp
L CSMALL C411
U 1 1 54836D6A
P 6550 1150
F 0 "C411" H 6575 1200 30  0000 L CNN
F 1 "100n" H 6575 1100 30  0000 L CNN
F 2 "SM0603" H 6550 1150 60  0001 C CNN
F 3 "~" H 6550 1150 60  0000 C CNN
	1    6550 1150
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C410
U 1 1 54836D70
P 6400 1150
F 0 "C410" H 6425 1200 30  0000 L CNN
F 1 "1u" H 6425 1100 30  0000 L CNN
F 2 "SM0603" H 6400 1150 60  0001 C CNN
F 3 "~" H 6400 1150 60  0000 C CNN
	1    6400 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1000 6550 1050
Wire Wire Line
	6400 1000 6400 1050
Connection ~ 6550 1000
Wire Wire Line
	7200 900  7200 1000
Connection ~ 7200 1000
$Comp
L GND #PWR0117
U 1 1 54836DF1
P 6400 1350
F 0 "#PWR0117" H 6400 1350 30  0001 C CNN
F 1 "GND" H 6400 1280 30  0001 C CNN
F 2 "" H 6400 1350 60  0000 C CNN
F 3 "" H 6400 1350 60  0000 C CNN
	1    6400 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0118
U 1 1 54836E00
P 6550 1350
F 0 "#PWR0118" H 6550 1350 30  0001 C CNN
F 1 "GND" H 6550 1280 30  0001 C CNN
F 2 "" H 6550 1350 60  0000 C CNN
F 3 "" H 6550 1350 60  0000 C CNN
	1    6550 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0119
U 1 1 54836E0F
P 9000 1350
F 0 "#PWR0119" H 9000 1350 30  0001 C CNN
F 1 "GND" H 9000 1280 30  0001 C CNN
F 2 "" H 9000 1350 60  0000 C CNN
F 3 "" H 9000 1350 60  0000 C CNN
	1    9000 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0120
U 1 1 54836E1E
P 9150 1350
F 0 "#PWR0120" H 9150 1350 30  0001 C CNN
F 1 "GND" H 9150 1280 30  0001 C CNN
F 2 "" H 9150 1350 60  0000 C CNN
F 3 "" H 9150 1350 60  0000 C CNN
	1    9150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1250 9150 1350
Wire Wire Line
	9000 1250 9000 1350
Wire Wire Line
	6400 1250 6400 1350
Wire Wire Line
	6550 1250 6550 1350
Text HLabel 4150 5350 0    60   Input ~ 0
PROG_B
Text HLabel 4150 5250 0    60   Output ~ 0
DONE
Text HLabel 9650 5300 0    25   Output ~ 0
INIT_B
Text HLabel 9650 5350 0    25   Input ~ 0
CCLK
Text HLabel 9650 5450 0    25   Input ~ 0
DIN
Text HLabel 9900 1550 0    25   Input ~ 0
FPGA_CLK_IN
Text HLabel 7350 1200 0    25   Input ~ 0
COM_MOSI
Text HLabel 7350 1150 0    25   Output ~ 0
COM_MISO
Text HLabel 7350 1400 0    25   Input ~ 0
COM_CS
Text HLabel 7350 1450 0    25   Input ~ 0
COM_CLK
Wire Wire Line
	7350 1150 7450 1150
Wire Wire Line
	7350 1200 7450 1200
Wire Wire Line
	7350 1400 7450 1400
Wire Wire Line
	7350 1450 7450 1450
Text HLabel 7150 1850 0    25   Output ~ 0
M0_EN
Text HLabel 7150 2000 0    25   Output ~ 0
M0_RESET
Text HLabel 7150 1600 0    25   Output ~ 0
M0_STEP
Text HLabel 7150 1800 0    25   Output ~ 0
M0_DIR
Text HLabel 7150 2050 0    25   Input ~ 0
M0_FAULT
Text HLabel 9900 1400 0    25   Output ~ 0
M1_STEP
Wire Wire Line
	9900 1400 10050 1400
Text HLabel 9900 1500 0    25   Output ~ 0
M1_EN
Wire Wire Line
	9900 1500 10050 1500
Text HLabel 9900 1650 0    25   Output ~ 0
M1_DIR
Wire Wire Line
	9900 1650 10050 1650
Text HLabel 9900 1600 0    25   Input ~ 0
M1_FAULT
Wire Wire Line
	9900 1600 10050 1600
Text HLabel 9900 1800 0    25   Output ~ 0
M1_RESET
Wire Wire Line
	10050 1800 9900 1800
$Comp
L XC3S200A U401
U 4 1 54A9A820
P 4800 1500
F 0 "U401" H 4800 2200 60  0000 C CNN
F 1 "XC3S200A" H 4800 2400 60  0000 C CNN
F 2 "~" H 4900 1400 60  0000 C CNN
F 3 "~" H 4900 1400 60  0000 C CNN
	4    4800 1500
	1    0    0    -1  
$EndComp
$Comp
L +3,3V #PWR0121
U 1 1 54A9A83C
P 4250 900
F 0 "#PWR0121" H 4250 860 30  0001 C CNN
F 1 "+3,3V" H 4250 1010 30  0000 C CNN
F 2 "" H 4250 900 60  0000 C CNN
F 3 "" H 4250 900 60  0000 C CNN
	1    4250 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1000 4500 1000
$Comp
L CSMALL C415
U 1 1 54A9A843
P 3600 1150
F 0 "C415" H 3625 1200 30  0000 L CNN
F 1 "100n" H 3625 1100 30  0000 L CNN
F 2 "SM0603" H 3600 1150 60  0001 C CNN
F 3 "~" H 3600 1150 60  0000 C CNN
	1    3600 1150
	1    0    0    -1  
$EndComp
$Comp
L CSMALL C414
U 1 1 54A9A849
P 3450 1150
F 0 "C414" H 3475 1200 30  0000 L CNN
F 1 "1u" H 3475 1100 30  0000 L CNN
F 2 "SM0603" H 3450 1150 60  0001 C CNN
F 3 "~" H 3450 1150 60  0000 C CNN
	1    3450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1000 3600 1050
Wire Wire Line
	3450 1000 3450 1050
Connection ~ 3600 1000
Wire Wire Line
	4250 900  4250 1000
Connection ~ 4250 1000
$Comp
L GND #PWR0122
U 1 1 54A9A854
P 3450 1350
F 0 "#PWR0122" H 3450 1350 30  0001 C CNN
F 1 "GND" H 3450 1280 30  0001 C CNN
F 2 "" H 3450 1350 60  0000 C CNN
F 3 "" H 3450 1350 60  0000 C CNN
	1    3450 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0123
U 1 1 54A9A85A
P 3600 1350
F 0 "#PWR0123" H 3600 1350 30  0001 C CNN
F 1 "GND" H 3600 1280 30  0001 C CNN
F 2 "" H 3600 1350 60  0000 C CNN
F 3 "" H 3600 1350 60  0000 C CNN
	1    3600 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1250 3450 1350
Wire Wire Line
	3600 1250 3600 1350
Text HLabel 4350 2000 0    25   BiDi ~ 0
IO_L01P
Wire Wire Line
	4350 2000 4500 2000
Text HLabel 4350 2050 0    25   BiDi ~ 0
IO_L01N
Text HLabel 4350 2150 0    25   BiDi ~ 0
IO_L02P
Text HLabel 4350 2200 0    25   Output ~ 0
M2_STEP
Wire Wire Line
	4350 2050 4500 2050
Wire Wire Line
	4350 2150 4500 2150
Wire Wire Line
	4350 2200 4500 2200
Text HLabel 4350 1400 0    25   Output ~ 0
M2_EN
Wire Wire Line
	4350 1400 4500 1400
Text HLabel 4350 1450 0    25   Output ~ 0
M2_DIR
Wire Wire Line
	4350 1450 4500 1450
Text HLabel 4350 1500 0    25   Input ~ 0
M2_FAULT
Wire Wire Line
	4350 1500 4500 1500
Text HLabel 4350 1550 0    25   Output ~ 0
M2_RESET
Wire Wire Line
	4350 1550 4500 1550
Wire Wire Line
	7150 2000 7450 2000
Wire Wire Line
	7150 2050 7450 2050
Wire Wire Line
	7150 1800 7450 1800
Wire Wire Line
	7450 1850 7150 1850
Wire Wire Line
	7450 1600 7150 1600
Text HLabel 9650 5200 0    25   BiDi ~ 0
L02N
Text HLabel 9650 5250 0    25   BiDi ~ 0
L03P
Text HLabel 9650 5950 0    25   BiDi ~ 0
L03N
Text HLabel 9650 5900 0    25   BiDi ~ 0
L04P
Text HLabel 9650 5850 0    25   BiDi ~ 0
L04N
Text HLabel 9650 5800 0    25   BiDi ~ 0
L06P
Text HLabel 9650 5750 0    25   BiDi ~ 0
L06N
Text HLabel 9650 5700 0    25   BiDi ~ 0
L07P
Text HLabel 9650 5650 0    25   BiDi ~ 0
L07N
Text HLabel 9650 5600 0    25   BiDi ~ 0
L10N
Text HLabel 9650 5550 0    25   BiDi ~ 0
L11P
Text HLabel 9650 5500 0    25   BiDi ~ 0
L11N
Wire Wire Line
	9650 5500 10050 5500
Wire Wire Line
	9650 5550 10050 5550
Wire Wire Line
	9650 5600 10050 5600
Wire Wire Line
	9650 5650 10050 5650
Wire Wire Line
	9650 5700 10050 5700
Wire Wire Line
	9650 5750 10050 5750
Wire Wire Line
	9650 5800 10050 5800
Wire Wire Line
	9650 5850 10050 5850
Wire Wire Line
	9650 5900 10050 5900
Wire Wire Line
	9650 5950 10050 5950
Wire Wire Line
	9650 5200 10050 5200
Wire Wire Line
	9650 5250 10050 5250
Text HLabel 4350 1600 0    25   BiDi ~ 0
IO_L05P
Text HLabel 4350 1650 0    25   BiDi ~ 0
IO_L05N
Text HLabel 4350 2300 0    25   BiDi ~ 0
IO_L06P
Text HLabel 4350 2350 0    25   BiDi ~ 0
IO_L06N
Wire Wire Line
	4350 1600 4500 1600
Wire Wire Line
	4350 1650 4500 1650
Wire Wire Line
	4350 2300 4500 2300
Wire Wire Line
	4350 2350 4500 2350
$EndSCHEMATC
