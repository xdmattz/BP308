EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
$Comp
L Connector:DB25_Female J3
U 1 1 5C9BC0B5
P 14450 5200
F 0 "J3" H 14700 6650 50  0000 L CNN
F 1 "DB25_FEMALE" H 14700 6550 50  0000 L CNN
F 2 "t_connectors:DB25_F_Edge" H 14450 5200 50  0001 C CNN
F 3 "" H 14450 5200 50  0001 C CNN
	1    14450 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 4600 13100 4600
Wire Wire Line
	14150 4800 13100 4800
Wire Wire Line
	14150 5000 13100 5000
Wire Wire Line
	14150 5400 13100 5400
Wire Wire Line
	14000 6300 14150 6300
Wire Wire Line
	14000 6100 14150 6100
Connection ~ 14000 6300
Wire Wire Line
	14000 5900 14150 5900
Connection ~ 14000 6100
Wire Wire Line
	14000 5700 14150 5700
Connection ~ 14000 5900
Wire Wire Line
	14000 5500 14150 5500
Connection ~ 14000 5700
Wire Wire Line
	14150 5300 14000 5300
Connection ~ 14000 5500
Wire Wire Line
	14000 5300 14000 5500
Wire Wire Line
	14000 5500 14000 5700
Wire Wire Line
	14000 5700 14000 5900
Wire Wire Line
	14000 5900 14000 6100
Wire Wire Line
	14000 6100 14000 6300
Wire Wire Line
	14000 6300 14000 6500
Wire Wire Line
	13400 4500 14150 4500
Text Notes 14700 4950 0    60   ~ 0
Green Black (LED+)\n
Text Notes 14700 5050 0    60   ~ 0
Gray (X1)\n
Text Notes 14700 4250 0    60   ~ 0
Yellow (X)\n
Text Notes 14700 4450 0    60   ~ 0
Yellow Black (Y)\n
Text Notes 14700 4650 0    60   ~ 0
Brown (Z)\n
Text Notes 14700 4850 0    60   ~ 0
Brown Black (4 or A axis)\n
Text Notes 14700 5150 0    60   ~ 0
White Black (GND LED-)\n
Text Notes 14700 5250 0    60   ~ 0
Gray Black (X10)\n
Text Notes 14700 4750 0    60   ~ 0
NC\n
Text Notes 14700 4150 0    60   ~ 0
Blue (ESTOP) - open when active\n \n
Text Notes 14700 5350 0    60   ~ 0
NC\n
Text Notes 14700 4350 0    60   ~ 0
Blue Black (+5V - ESTOP)\n
Text Notes 14700 4550 0    60   ~ 0
Red (+5V)\n
Text Notes 14700 5450 0    60   ~ 0
Orange (X100)\n
Text Notes 14700 6250 0    60   ~ 0
Violet Black (B-)\n
Text Notes 14700 6450 0    60   ~ 0
White (B+)\n
Text Notes 14700 5850 0    60   ~ 0
Violet (A-)\n
Text Notes 14700 5950 0    60   ~ 0
Shield (GND)\n
Text Notes 14700 6050 0    60   ~ 0
Green (A+)\n
Text Notes 14700 5750 0    60   ~ 0
NC\n
Text Notes 14700 5650 0    60   ~ 0
NC\n
Text Notes 14700 5550 0    60   ~ 0
Black (GND)\n
Text Notes 14700 4150 0    60   ~ 0
Brown Black (Enable Switch)
Text Notes 14700 6150 0    60   ~ 0
NC\n
Text Notes 14700 6350 0    60   ~ 0
NC\n
$Comp
L Connector_Generic:Conn_02x05_Top_Bottom J1
U 1 1 5C9C5363
P 2300 3350
F 0 "J1" H 2350 3767 50  0000 C CNN
F 1 "Conn_02x05_Top_Bottom" H 2350 3676 50  0000 C CNN
F 2 "t_connectors:c-5-103168-3" H 2300 3350 50  0001 C CNN
F 3 "~" H 2300 3350 50  0001 C CNN
	1    2300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3550 1700 3550
Wire Wire Line
	2100 3350 1500 3350
Wire Wire Line
	2100 3250 1500 3250
Wire Wire Line
	3200 3350 2600 3350
Wire Wire Line
	3200 3250 2600 3250
Text Label 1800 3550 0    50   ~ 0
RX-
Text Label 2750 3550 0    50   ~ 0
RX+
Text Label 1800 3450 0    50   ~ 0
TX-
Text Label 2750 3450 0    50   ~ 0
TX+
Text Label 2750 3350 0    50   ~ 0
MPG_A+
Text Label 2750 3250 0    50   ~ 0
MPG_B+
Text Label 1800 3350 0    50   ~ 0
MPG_A-
Text Label 1800 3250 0    50   ~ 0
MPG_B-
$Comp
L t_Power:+5.0Vx #PWR0101
U 1 1 5C9CB923
P 3200 2950
F 0 "#PWR0101" H 3200 2925 60  0001 C CNN
F 1 "+5.0Vx" H 3182 3056 60  0000 C CNN
F 2 "" H 3200 2950 60  0000 C CNN
F 3 "" H 3200 2950 60  0000 C CNN
	1    3200 2950
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0102
U 1 1 5C9CC49A
P 1300 3200
F 0 "#PWR0102" H 1300 3200 30  0001 C CNN
F 1 "GND" H 1300 3130 30  0001 C CNN
F 2 "" H 1300 3200 60  0000 C CNN
F 3 "" H 1300 3200 60  0000 C CNN
	1    1300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3200 1300 3150
Wire Wire Line
	3200 3150 3200 3050
Wire Wire Line
	2600 3150 3200 3150
$Comp
L t_LTC:LTC485 U2
U 1 1 5C9D5E78
P 2300 5700
F 0 "U2" H 2325 6015 50  0000 C CNN
F 1 "LTC485" H 2325 5924 50  0000 C CNN
F 2 "t_so:SOIC-8" H 2375 5750 50  0001 C CNN
F 3 "" H 2375 5750 50  0001 C CNN
	1    2300 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3450 3100 3450
Wire Wire Line
	3000 3850 1600 3850
Wire Wire Line
	1600 3850 1600 3450
Wire Wire Line
	1600 3450 2100 3450
Wire Wire Line
	1700 3750 1700 3550
Wire Wire Line
	2700 5950 2800 5950
Wire Wire Line
	2800 5950 2800 6100
$Comp
L t_Power:GND #PWR0103
U 1 1 5C9E2D2C
P 2800 6100
F 0 "#PWR0103" H 2800 6100 30  0001 C CNN
F 1 "GND" H 2800 6030 30  0001 C CNN
F 2 "" H 2800 6100 60  0000 C CNN
F 3 "" H 2800 6100 60  0000 C CNN
	1    2800 6100
	1    0    0    -1  
$EndComp
$Comp
L t_Power:+5.0Vx #PWR0104
U 1 1 5C9E7D45
P 2800 5500
F 0 "#PWR0104" H 2800 5475 60  0001 C CNN
F 1 "+5.0Vx" H 2782 5606 60  0000 C CNN
F 2 "" H 2800 5500 60  0000 C CNN
F 3 "" H 2800 5500 60  0000 C CNN
	1    2800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5600 2800 5650
Wire Wire Line
	2800 5650 2700 5650
Wire Wire Line
	1950 5750 1850 5750
Wire Wire Line
	1850 5750 1850 5850
Wire Wire Line
	1950 5850 1850 5850
Connection ~ 1850 5850
Wire Wire Line
	1850 5850 1850 5950
Wire Wire Line
	1950 5950 1850 5950
Connection ~ 1850 5950
Wire Wire Line
	1850 5950 1850 6100
$Comp
L t_Power:GND #PWR0105
U 1 1 5CA37735
P 1850 6100
F 0 "#PWR0105" H 1850 6100 30  0001 C CNN
F 1 "GND" H 1850 6030 30  0001 C CNN
F 2 "" H 1850 6100 60  0000 C CNN
F 3 "" H 1850 6100 60  0000 C CNN
	1    1850 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5650 1650 5650
Wire Wire Line
	1650 5650 1650 6400
$Comp
L t_Power:GND #PWR0106
U 1 1 5CA428FE
P 1500 4550
F 0 "#PWR0106" H 1500 4550 30  0001 C CNN
F 1 "GND" H 1500 4480 30  0001 C CNN
F 2 "" H 1500 4550 60  0000 C CNN
F 3 "" H 1500 4550 60  0000 C CNN
	1    1500 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4400 1500 4550
Wire Wire Line
	1950 4400 1500 4400
Wire Wire Line
	1950 4500 1750 4500
Wire Wire Line
	1950 4600 1850 4600
Wire Wire Line
	2750 4300 2700 4300
Wire Wire Line
	2750 4200 2750 4300
$Comp
L t_Power:+5.0Vx #PWR0107
U 1 1 5C9E59E2
P 2750 4100
F 0 "#PWR0107" H 2750 4075 60  0001 C CNN
F 1 "+5.0Vx" H 2732 4206 60  0000 C CNN
F 2 "" H 2750 4100 60  0000 C CNN
F 3 "" H 2750 4100 60  0000 C CNN
	1    2750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4600 2700 4600
Wire Wire Line
	2800 4700 2800 4600
$Comp
L t_Power:GND #PWR0108
U 1 1 5C9E3624
P 2800 4700
F 0 "#PWR0108" H 2800 4700 30  0001 C CNN
F 1 "GND" H 2800 4630 30  0001 C CNN
F 2 "" H 2800 4700 60  0000 C CNN
F 3 "" H 2800 4700 60  0000 C CNN
	1    2800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4400 3000 3850
Wire Wire Line
	2700 4400 3000 4400
Wire Wire Line
	3100 4500 3100 3450
Wire Wire Line
	2700 4500 3100 4500
$Comp
L t_LTC:LTC485 U1
U 1 1 5C9D4295
P 2300 4350
F 0 "U1" H 2325 4665 50  0000 C CNN
F 1 "LTC485" H 2325 4574 50  0000 C CNN
F 2 "t_so:SOIC-8" H 2375 4400 50  0001 C CNN
F 3 "" H 2375 4400 50  0001 C CNN
	1    2300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3750 1700 3750
Wire Wire Line
	2700 5750 3300 5750
Wire Wire Line
	2600 3550 3400 3550
Wire Wire Line
	2700 5850 3400 5850
Wire Wire Line
	3300 5750 3300 5350
Wire Wire Line
	3400 5850 3400 3550
Wire Wire Line
	1850 4600 1850 4950
Wire Wire Line
	1850 4950 5900 4950
Wire Wire Line
	1750 4500 1750 5050
Text Label 4100 4950 0    50   ~ 0
TX
Text Label 4100 5050 0    50   ~ 0
TX_EN
Text Label 3850 6400 0    50   ~ 0
RX
$Comp
L t_Cypress:CY8C58LP_QFN68 U3
U 1 1 5CA73D90
P 8300 4600
F 0 "U3" H 9750 6000 60  0000 L CNN
F 1 "CY8C58LP_QFN68" H 9750 5900 60  0000 L CNN
F 2 "t_qfn:QFN_68" H 8300 4600 60  0001 C CNN
F 3 "http://www.cypress.com/file/45906/download" H 9744 4494 60  0001 L CNN
	1    8300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 6400 13250 6400
Wire Wire Line
	14150 6200 13250 6200
Wire Wire Line
	14150 6000 13250 6000
Wire Wire Line
	14150 5800 13250 5800
Text Label 13500 6000 0    50   ~ 0
MPG_A+
Text Label 13500 5800 0    50   ~ 0
MPG_A-
Text Label 13500 6400 0    50   ~ 0
MPG_B+
Text Label 13500 6200 0    50   ~ 0
MPG_B-
Wire Wire Line
	13100 5200 14150 5200
Wire Wire Line
	14150 4200 13100 4200
Wire Wire Line
	13100 4400 14150 4400
Wire Wire Line
	13100 4000 14150 4000
Wire Wire Line
	8300 6000 8300 6650
Wire Wire Line
	8300 6650 10700 6650
Wire Wire Line
	11250 6650 11250 2300
Wire Wire Line
	11250 2300 8600 2300
Wire Wire Line
	8600 2300 8600 3200
Wire Wire Line
	6900 4000 5750 4000
Wire Wire Line
	5750 4000 5750 5050
Wire Wire Line
	1750 5050 5750 5050
Wire Wire Line
	6900 3900 5650 3900
Wire Wire Line
	5650 3900 5650 6400
Wire Wire Line
	1650 6400 5650 6400
Wire Wire Line
	7700 6000 7700 6650
Wire Wire Line
	7700 6650 5900 6650
Wire Wire Line
	5900 6650 5900 4950
Wire Wire Line
	8200 6000 8200 6800
$Comp
L t_Power:GND #PWR0109
U 1 1 5CAB0403
P 8200 6800
F 0 "#PWR0109" H 8200 6800 30  0001 C CNN
F 1 "GND" H 8200 6730 30  0001 C CNN
F 2 "" H 8200 6800 60  0000 C CNN
F 3 "" H 8200 6800 60  0000 C CNN
	1    8200 6800
	1    0    0    -1  
$EndComp
$Comp
L t_Connectors:USB_micro-B J2
U 1 1 5CAB8592
P 6500 7900
F 0 "J2" H 6508 8191 60  0000 C CNN
F 1 "USB_micro-B" H 6550 8250 60  0001 C CNN
F 2 "t_connectors:conn_usb_B_mini_smd" H 6500 7900 60  0001 C CNN
F 3 "" H 6500 7900 60  0000 C CNN
F 4 "VCC" H 6825 8050 50  0001 C CNN "VCC"
F 5 "D+" H 6800 7950 50  0001 C CNN "Data+"
F 6 "D-" H 6800 7850 50  0001 C CNN "Data-"
F 7 "GND" H 6800 7750 50  0001 C CNN "Ground"
	1    6500 7900
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:Res6 R1
U 1 1 5CABCAFC
P 7450 7850
F 0 "R1" V 7233 7850 50  0000 C CNN
F 1 "Res6" V 7324 7850 50  0000 C CNN
F 2 "t_passive_smd:res_0603" H 7450 7860 60  0001 C CNN
F 3 "" H 7450 7860 60  0000 C CNN
	1    7450 7850
	0    1    1    0   
$EndComp
$Comp
L t_Devices:Res6 R2
U 1 1 5CABDBA4
P 7450 7950
F 0 "R2" V 7550 7950 50  0000 C CNN
F 1 "Res6" V 7650 7950 50  0000 C CNN
F 2 "t_passive_smd:res_0603" H 7450 7960 60  0001 C CNN
F 3 "" H 7450 7960 60  0000 C CNN
	1    7450 7950
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 7950 7900 7950
Wire Wire Line
	7600 7850 8000 7850
Wire Wire Line
	7300 7850 6700 7850
$Comp
L t_Power:GND #PWR0110
U 1 1 5CACB1DD
P 6800 8250
F 0 "#PWR0110" H 6800 8250 30  0001 C CNN
F 1 "GND" H 6800 8180 30  0001 C CNN
F 2 "" H 6800 8250 60  0000 C CNN
F 3 "" H 6800 8250 60  0000 C CNN
	1    6800 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 8150 6800 8150
Wire Wire Line
	6800 8150 6800 8050
Wire Wire Line
	6800 8050 6700 8050
Wire Wire Line
	6700 7750 6800 7750
Wire Wire Line
	6800 7750 6800 7550
Wire Wire Line
	6800 7550 6850 7550
$Comp
L MPG_PSoC-rescue:1N5819HW-t_Devices D1
U 1 1 5CAD99EA
P 7050 7550
F 0 "D1" H 7050 7766 50  0000 C CNN
F 1 "1N5819HW" H 7050 7675 50  0000 C CNN
F 2 "t_so:SOD-123" H 7050 7550 60  0001 C CNN
F 3 "http://www.diodes.com/datasheets/ds30217.pdf" H 7050 7682 60  0001 C CNN
	1    7050 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 7550 8100 7550
Wire Wire Line
	8100 7550 8100 6000
Wire Wire Line
	8100 7550 8550 7550
Wire Wire Line
	8650 7550 8650 7400
Connection ~ 8100 7550
$Comp
L t_Power:+5.0Vx #PWR0111
U 1 1 5CAE24B1
P 8650 7300
F 0 "#PWR0111" H 8650 7275 60  0001 C CNN
F 1 "+5.0Vx" H 8632 7406 60  0000 C CNN
F 2 "" H 8650 7300 60  0000 C CNN
F 3 "" H 8650 7300 60  0000 C CNN
	1    8650 7300
	1    0    0    -1  
$EndComp
$Comp
L t_Power:+5.0Vx #PWR0112
U 1 1 5CAE3E4E
P 13400 3550
F 0 "#PWR0112" H 13400 3525 60  0001 C CNN
F 1 "+5.0Vx" H 13382 3656 60  0000 C CNN
F 2 "" H 13400 3550 60  0000 C CNN
F 3 "" H 13400 3550 60  0000 C CNN
	1    13400 3550
	1    0    0    -1  
$EndComp
$Comp
L t_Power:+5.0Vx #PWR0113
U 1 1 5CAE5244
P 6300 5500
F 0 "#PWR0113" H 6300 5475 60  0001 C CNN
F 1 "+5.0Vx" V 6283 5553 60  0000 L CNN
F 2 "" H 6300 5500 60  0000 C CNN
F 3 "" H 6300 5500 60  0000 C CNN
	1    6300 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 5500 6900 5500
$Comp
L t_Power:GND #PWR0114
U 1 1 5CAEA26A
P 6550 4400
F 0 "#PWR0114" H 6550 4400 30  0001 C CNN
F 1 "GND" H 6550 4330 30  0001 C CNN
F 2 "" H 6550 4400 60  0000 C CNN
F 3 "" H 6550 4400 60  0000 C CNN
	1    6550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4700 6850 4700
Wire Wire Line
	6550 4300 6550 4400
Wire Wire Line
	6900 4600 6850 4600
Wire Wire Line
	6850 4600 6850 4700
Wire Wire Line
	6900 4500 6850 4500
Wire Wire Line
	6850 4500 6850 4600
Connection ~ 6850 4600
Wire Wire Line
	6900 4300 6850 4300
Wire Wire Line
	6850 4300 6850 4500
Connection ~ 6850 4500
$Comp
L t_Power:+5.0Vx #PWR0115
U 1 1 5CAFCA84
P 10150 5500
F 0 "#PWR0115" H 10150 5475 60  0001 C CNN
F 1 "+5.0Vx" V 10132 5553 60  0000 L CNN
F 2 "" H 10150 5500 60  0000 C CNN
F 3 "" H 10150 5500 60  0000 C CNN
	1    10150 5500
	0    1    1    0   
$EndComp
$Comp
L t_Power:+5.0Vx #PWR0116
U 1 1 5CAFDA9A
P 10000 4600
F 0 "#PWR0116" H 10000 4575 60  0001 C CNN
F 1 "+5.0Vx" V 9982 4653 60  0000 L CNN
F 2 "" H 10000 4600 60  0000 C CNN
F 3 "" H 10000 4600 60  0000 C CNN
	1    10000 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 4700 9800 4700
Wire Wire Line
	9800 4700 9800 4500
Wire Wire Line
	9800 4500 9700 4500
Wire Wire Line
	9700 4600 9900 4600
Wire Wire Line
	9700 4800 10500 4800
Wire Wire Line
	10500 4800 10500 4900
Wire Wire Line
	10050 5500 9700 5500
$Comp
L t_Power:GND #PWR0117
U 1 1 5CB273D7
P 10500 4650
F 0 "#PWR0117" H 10500 4650 30  0001 C CNN
F 1 "GND" H 10500 4580 30  0001 C CNN
F 2 "" H 10500 4650 60  0000 C CNN
F 3 "" H 10500 4650 60  0000 C CNN
	1    10500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 4650 10500 4500
Wire Wire Line
	10500 4500 9800 4500
Connection ~ 9800 4500
$Comp
L t_Devices:C_small C5
U 1 1 5CB4DC86
P 10500 5000
F 0 "C5" H 10588 5046 50  0000 L CNN
F 1 "0.1uF" H 10588 4955 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 10538 4850 50  0001 C CNN
F 3 "" H 10500 5000 50  0001 C CNN
	1    10500 5000
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0118
U 1 1 5CB4E5BC
P 10500 5150
F 0 "#PWR0118" H 10500 5150 30  0001 C CNN
F 1 "GND" H 10500 5080 30  0001 C CNN
F 2 "" H 10500 5150 60  0000 C CNN
F 3 "" H 10500 5150 60  0000 C CNN
	1    10500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5100 10500 5150
$Comp
L t_Power:+5.0Vx #PWR0119
U 1 1 5CB5E27D
P 9300 3000
F 0 "#PWR0119" H 9300 2975 60  0001 C CNN
F 1 "+5.0Vx" V 9282 3053 60  0000 L CNN
F 2 "" H 9300 3000 60  0000 C CNN
F 3 "" H 9300 3000 60  0000 C CNN
	1    9300 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 3200 9100 3000
Wire Wire Line
	9100 3000 9200 3000
Wire Wire Line
	8500 3200 8500 2300
Wire Wire Line
	8500 2300 8050 2300
Wire Wire Line
	8050 2300 8050 2400
Wire Wire Line
	8400 3200 8400 3050
$Comp
L t_Power:+5.0Vx #PWR0120
U 1 1 5CB6F641
P 8400 2950
F 0 "#PWR0120" H 8400 2925 60  0001 C CNN
F 1 "+5.0Vx" V 8382 3003 60  0000 L CNN
F 2 "" H 8400 2950 60  0000 C CNN
F 3 "" H 8400 2950 60  0000 C CNN
	1    8400 2950
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0121
U 1 1 5CB705A5
P 8050 2400
F 0 "#PWR0121" H 8050 2400 30  0001 C CNN
F 1 "GND" H 8050 2330 30  0001 C CNN
F 2 "" H 8050 2400 60  0000 C CNN
F 3 "" H 8050 2400 60  0000 C CNN
	1    8050 2400
	1    0    0    -1  
$EndComp
$Comp
L t_Power:+5.0Vx #PWR0122
U 1 1 5CB71B7D
P 7050 2300
F 0 "#PWR0122" H 7050 2275 60  0001 C CNN
F 1 "+5.0Vx" V 7032 2353 60  0000 L CNN
F 2 "" H 7050 2300 60  0000 C CNN
F 3 "" H 7050 2300 60  0000 C CNN
	1    7050 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 3200 7600 2300
Wire Wire Line
	7600 2300 7150 2300
Wire Wire Line
	7400 3200 7400 3000
Wire Wire Line
	7400 3000 7150 3000
$Comp
L t_Power:GND #PWR0123
U 1 1 5CB7E143
P 7150 3100
F 0 "#PWR0123" H 7150 3100 30  0001 C CNN
F 1 "GND" H 7150 3030 30  0001 C CNN
F 2 "" H 7150 3100 60  0000 C CNN
F 3 "" H 7150 3100 60  0000 C CNN
	1    7150 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3000 7150 3100
Wire Wire Line
	9700 4200 10550 4200
Text Label 13500 5400 0    50   ~ 0
X100
Text Label 13500 5200 0    50   ~ 0
X10
Text Label 13500 5000 0    50   ~ 0
X1
Text Label 13500 4900 0    50   ~ 0
LED+
Text Label 13500 4200 0    50   ~ 0
X
Text Label 13500 4400 0    50   ~ 0
Y
Text Label 13500 4600 0    50   ~ 0
Z
Text Label 13500 4800 0    50   ~ 0
A
Text Label 13500 4000 0    50   ~ 0
ESTOP
Wire Wire Line
	13400 3650 13400 4500
Wire Wire Line
	14150 4300 13100 4300
Wire Wire Line
	6900 5100 6250 5100
Wire Wire Line
	6900 5200 6250 5200
Wire Wire Line
	6900 5300 6250 5300
Wire Wire Line
	6900 5400 6250 5400
Text Label 6500 5100 0    50   ~ 0
MPG_A+
Text Label 6500 5200 0    50   ~ 0
MPG_A-
Text Label 6500 5300 0    50   ~ 0
MPG_B+
Text Label 6500 5400 0    50   ~ 0
MPG_B-
$Comp
L t_Devices:C_small C1
U 1 1 5C9E4A90
P 8950 7700
F 0 "C1" H 9038 7746 50  0000 L CNN
F 1 "0.1uF" H 9038 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 8988 7550 50  0001 C CNN
F 3 "" H 8950 7700 50  0001 C CNN
	1    8950 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C2
U 1 1 5C9E73A2
P 9350 7700
F 0 "C2" H 9438 7746 50  0000 L CNN
F 1 "0.1uF" H 9438 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 9388 7550 50  0001 C CNN
F 3 "" H 9350 7700 50  0001 C CNN
	1    9350 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C3
U 1 1 5C9E7827
P 9750 7700
F 0 "C3" H 9838 7746 50  0000 L CNN
F 1 "0.1uF" H 9838 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 9788 7550 50  0001 C CNN
F 3 "" H 9750 7700 50  0001 C CNN
	1    9750 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C4
U 1 1 5C9E7B1C
P 10150 7700
F 0 "C4" H 10238 7746 50  0000 L CNN
F 1 "0.1uF" H 10238 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 10188 7550 50  0001 C CNN
F 3 "" H 10150 7700 50  0001 C CNN
	1    10150 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C6
U 1 1 5C9E7E20
P 10550 7700
F 0 "C6" H 10638 7746 50  0000 L CNN
F 1 "0.1uF" H 10638 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 10588 7550 50  0001 C CNN
F 3 "" H 10550 7700 50  0001 C CNN
	1    10550 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0124
U 1 1 5C9E83B5
P 8950 7950
F 0 "#PWR0124" H 8950 7950 30  0001 C CNN
F 1 "GND" H 8950 7880 30  0001 C CNN
F 2 "" H 8950 7950 60  0000 C CNN
F 3 "" H 8950 7950 60  0000 C CNN
	1    8950 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 7800 8950 7850
Wire Wire Line
	9350 7800 9350 7850
Wire Wire Line
	9350 7850 8950 7850
Connection ~ 8950 7850
Wire Wire Line
	8950 7850 8950 7950
Wire Wire Line
	9750 7800 9750 7850
Wire Wire Line
	9750 7850 9350 7850
Connection ~ 9350 7850
Wire Wire Line
	10150 7800 10150 7850
Wire Wire Line
	10150 7850 9750 7850
Connection ~ 9750 7850
Wire Wire Line
	10550 7800 10550 7850
Wire Wire Line
	10550 7850 10150 7850
Connection ~ 10150 7850
Wire Wire Line
	10550 7600 10550 7550
Wire Wire Line
	10550 7550 10150 7550
Wire Wire Line
	10150 7550 10150 7600
Wire Wire Line
	10150 7550 9750 7550
Wire Wire Line
	9750 7550 9750 7600
Connection ~ 10150 7550
Wire Wire Line
	9750 7550 9350 7550
Wire Wire Line
	9350 7550 9350 7600
Connection ~ 9750 7550
Wire Wire Line
	9350 7550 8950 7550
Wire Wire Line
	8950 7550 8950 7600
Connection ~ 9350 7550
Connection ~ 8950 7550
Connection ~ 8650 7550
Wire Wire Line
	8650 7550 8950 7550
Wire Wire Line
	9700 4100 10550 4100
Wire Wire Line
	9700 4000 10550 4000
Wire Wire Line
	9700 3900 10550 3900
Wire Wire Line
	8600 6000 8600 6550
Wire Wire Line
	8600 6550 9700 6550
Wire Wire Line
	8700 6000 8700 6450
Wire Wire Line
	8700 6450 9700 6450
Wire Wire Line
	8800 6000 8800 6350
Wire Wire Line
	8800 6350 9700 6350
Wire Wire Line
	8900 6000 8900 6250
Text Label 9250 6550 0    50   ~ 0
X100
Text Label 9250 6450 0    50   ~ 0
X10
Text Label 9250 6350 0    50   ~ 0
X1
Text Label 13500 5100 0    50   ~ 0
LED-
$Comp
L t_Devices:Res6 R3
U 1 1 5CAA5585
P 12250 4900
F 0 "R3" V 12033 4900 50  0000 C CNN
F 1 "Res6" V 12124 4900 50  0000 C CNN
F 2 "t_passive_smd:res_0603" H 12250 4910 60  0001 C CNN
F 3 "" H 12250 4910 60  0000 C CNN
	1    12250 4900
	0    1    1    0   
$EndComp
$Comp
L t_Devices:MOS_N_SOT-23 Q1
U 1 1 5CAA6F1D
P 11850 5500
F 0 "Q1" H 12027 5599 50  0000 L CNN
F 1 "BSS123" H 12027 5508 50  0000 L CNN
F 2 "t_sot:sot-23" H 12027 5409 60  0001 L CNN
F 3 "" H 11850 5500 60  0000 C CNN
	1    11850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 5700 11950 5750
Wire Wire Line
	11950 5100 11950 5300
Wire Wire Line
	12400 4900 14150 4900
Wire Wire Line
	12100 4900 11950 4900
Wire Wire Line
	11950 4900 11950 4800
Wire Wire Line
	11950 5100 14150 5100
$Comp
L t_Power:+5.0Vx #PWR0125
U 1 1 5CAF9381
P 11950 4700
F 0 "#PWR0125" H 11950 4675 60  0001 C CNN
F 1 "+5.0Vx" H 11932 4806 60  0000 C CNN
F 2 "" H 11950 4700 60  0000 C CNN
F 3 "" H 11950 4700 60  0000 C CNN
	1    11950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 6250 11550 5500
Wire Wire Line
	11550 5500 11650 5500
Wire Wire Line
	8900 6250 11550 6250
Text Label 10200 3900 0    50   ~ 0
X
Text Label 10200 4000 0    50   ~ 0
Y
Text Label 10200 4100 0    50   ~ 0
Z
Text Label 10200 4200 0    50   ~ 0
A
$Comp
L t_Devices:TEST_POINT TP7
U 1 1 5CB04291
P 8700 2600
F 0 "TP7" H 8600 2700 60  0000 L CNN
F 1 "TP" H 8778 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 8778 2436 60  0001 L CNN
F 3 "" H 8700 2600 60  0000 C CNN
	1    8700 2600
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP8
U 1 1 5CB05E21
P 8800 2850
F 0 "TP8" H 8700 2950 60  0000 L CNN
F 1 "TP" H 8878 2739 60  0001 L CNN
F 2 "t_misc:TP60" H 8878 2686 60  0001 L CNN
F 3 "" H 8800 2850 60  0000 C CNN
	1    8800 2850
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP9
U 1 1 5CB0615C
P 8900 2600
F 0 "TP9" H 8800 2700 60  0000 L CNN
F 1 "TP" H 8978 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 8978 2436 60  0001 L CNN
F 3 "" H 8900 2600 60  0000 C CNN
	1    8900 2600
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP10
U 1 1 5CB066FE
P 9000 2850
F 0 "TP10" H 8950 2950 60  0000 L CNN
F 1 "TP" H 9078 2739 60  0001 L CNN
F 2 "t_misc:TP60" H 9078 2686 60  0001 L CNN
F 3 "" H 9000 2850 60  0000 C CNN
	1    9000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2750 8700 3200
Wire Wire Line
	8800 3200 8800 3000
Wire Wire Line
	8900 2750 8900 3200
Wire Wire Line
	9000 3200 9000 3000
$Comp
L t_Devices:TEST_POINT TP2
U 1 1 5CB2BA55
P 7700 2600
F 0 "TP2" H 7650 2700 60  0000 L CNN
F 1 "TP" H 7778 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 7778 2436 60  0001 L CNN
F 3 "" H 7700 2600 60  0000 C CNN
	1    7700 2600
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP4
U 1 1 5CB5984B
P 7900 2600
F 0 "TP4" H 7850 2700 60  0000 L CNN
F 1 "TP" H 7978 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 7978 2436 60  0001 L CNN
F 3 "" H 7900 2600 60  0000 C CNN
	1    7900 2600
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP5
U 1 1 5CB59D1A
P 8000 2850
F 0 "TP5" H 7925 2950 60  0000 L CNN
F 1 "TP" H 8078 2739 60  0001 L CNN
F 2 "t_misc:TP60" H 8078 2686 60  0001 L CNN
F 3 "" H 8000 2850 60  0000 C CNN
	1    8000 2850
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP6
U 1 1 5CB5A566
P 8100 2600
F 0 "TP6" H 8050 2700 60  0000 L CNN
F 1 "TP" H 8178 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 8178 2436 60  0001 L CNN
F 3 "" H 8100 2600 60  0000 C CNN
	1    8100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3200 8100 2750
Wire Wire Line
	8000 3000 8000 3200
Wire Wire Line
	7900 2750 7900 3200
Wire Wire Line
	7800 3000 7800 3200
Wire Wire Line
	7700 3200 7700 2750
$Comp
L t_Devices:TEST_POINT TP1
U 1 1 5CB8A308
P 7500 2600
F 0 "TP1" H 7425 2700 60  0000 L CNN
F 1 "TP" H 7578 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 7578 2436 60  0001 L CNN
F 3 "" H 7500 2600 60  0000 C CNN
	1    7500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2750 7500 3200
$Comp
L t_Devices:C_small C7
U 1 1 5CBA789A
P 10700 6900
F 0 "C7" H 10788 6946 50  0000 L CNN
F 1 "0.1uF" H 10788 6855 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 10738 6750 50  0001 C CNN
F 3 "" H 10700 6900 50  0001 C CNN
	1    10700 6900
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C9
U 1 1 5CBA866A
P 11250 6900
F 0 "C9" H 11338 6946 50  0000 L CNN
F 1 "0.1uF" H 11338 6855 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 11288 6750 50  0001 C CNN
F 3 "" H 11250 6900 50  0001 C CNN
	1    11250 6900
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0126
U 1 1 5CBA8BDE
P 11250 7150
F 0 "#PWR0126" H 11250 7150 30  0001 C CNN
F 1 "GND" H 11250 7080 30  0001 C CNN
F 2 "" H 11250 7150 60  0000 C CNN
F 3 "" H 11250 7150 60  0000 C CNN
	1    11250 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 7000 11250 7050
Wire Wire Line
	10700 7000 10700 7050
Wire Wire Line
	10700 7050 11250 7050
Connection ~ 11250 7050
Wire Wire Line
	11250 7050 11250 7150
Wire Wire Line
	11250 6800 11250 6650
Connection ~ 11250 6650
Wire Wire Line
	10700 6800 10700 6650
Connection ~ 10700 6650
Wire Wire Line
	10700 6650 11250 6650
$Comp
L t_Devices:C_small C8
U 1 1 5CBE9AF5
P 10950 7700
F 0 "C8" H 11038 7746 50  0000 L CNN
F 1 "10uF" H 11038 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_1210" H 10988 7550 50  0001 C CNN
F 3 "" H 10950 7700 50  0001 C CNN
	1    10950 7700
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:C_small C10
U 1 1 5CBE9AFF
P 11350 7700
F 0 "C10" H 11438 7746 50  0000 L CNN
F 1 "10uF" H 11438 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_1210" H 11388 7550 50  0001 C CNN
F 3 "" H 11350 7700 50  0001 C CNN
	1    11350 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 7800 10950 7850
Wire Wire Line
	10950 7850 10550 7850
Wire Wire Line
	11350 7800 11350 7850
Wire Wire Line
	11350 7850 10950 7850
Connection ~ 10950 7850
Wire Wire Line
	11350 7600 11350 7550
Wire Wire Line
	11350 7550 10950 7550
Wire Wire Line
	10950 7550 10950 7600
Wire Wire Line
	10950 7550 10550 7550
Connection ~ 10950 7550
Connection ~ 10550 7550
Connection ~ 10550 7850
$Comp
L t_Power:GND #PWR0127
U 1 1 5CBF7535
P 14000 6500
F 0 "#PWR0127" H 14000 6500 30  0001 C CNN
F 1 "GND" H 14000 6430 30  0001 C CNN
F 2 "" H 14000 6500 60  0000 C CNN
F 3 "" H 14000 6500 60  0000 C CNN
	1    14000 6500
	1    0    0    -1  
$EndComp
$Comp
L t_Power:GND #PWR0128
U 1 1 5CC04A6D
P 11950 5750
F 0 "#PWR0128" H 11950 5750 30  0001 C CNN
F 1 "GND" H 11950 5680 30  0001 C CNN
F 2 "" H 11950 5750 60  0000 C CNN
F 3 "" H 11950 5750 60  0000 C CNN
	1    11950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 8250 6800 8150
Connection ~ 6800 8150
Wire Wire Line
	1300 3150 2100 3150
Wire Wire Line
	6700 7950 7300 7950
Wire Wire Line
	8000 6000 8000 7850
Wire Wire Line
	7900 7950 7900 6000
Wire Wire Line
	9700 5300 10400 5300
Text Label 10000 5300 0    50   ~ 0
ESTOP
$Comp
L t_Devices:Res6 R4
U 1 1 5C9E0AF6
P 3600 5600
F 0 "R4" H 3520 5554 50  0000 R CNN
F 1 "Res6" H 3520 5645 50  0000 R CNN
F 2 "t_passive_smd:res_0603" H 3600 5610 60  0001 C CNN
F 3 "" H 3600 5610 60  0000 C CNN
	1    3600 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 5750 3600 5850
Wire Wire Line
	3600 5850 3400 5850
Connection ~ 3400 5850
Wire Wire Line
	3600 5450 3600 5350
Wire Wire Line
	3600 5350 3300 5350
Connection ~ 3300 5350
Wire Wire Line
	3300 5350 3300 3750
$Comp
L t_Devices:C_small C11
U 1 1 5CA07013
P 8550 7700
F 0 "C11" H 8638 7746 50  0000 L CNN
F 1 "0.1uF" H 8638 7655 50  0000 L CNN
F 2 "t_passive_smd:cap_0603" H 8588 7550 50  0001 C CNN
F 3 "" H 8550 7700 50  0001 C CNN
	1    8550 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 7850 8550 7850
Wire Wire Line
	8550 7850 8550 7800
Wire Wire Line
	8550 7600 8550 7550
Connection ~ 8550 7550
Wire Wire Line
	8550 7550 8650 7550
$Comp
L t_Devices:TEST_POINT TP11
U 1 1 5CA9724C
P 10000 2600
F 0 "TP11" H 10000 2731 60  0000 C CNN
F 1 "TP" H 10078 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 10078 2436 60  0001 L CNN
F 3 "" H 10000 2600 60  0000 C CNN
	1    10000 2600
	1    0    0    -1  
$EndComp
$Comp
L t_Power:+5.0Vx #PWR01
U 1 1 5CA97D6B
P 10000 2950
F 0 "#PWR01" H 10000 2925 60  0001 C CNN
F 1 "+5.0Vx" H 9900 3050 60  0000 L CNN
F 2 "" H 10000 2950 60  0000 C CNN
F 3 "" H 10000 2950 60  0000 C CNN
	1    10000 2950
	-1   0    0    1   
$EndComp
$Comp
L t_Power:GND #PWR02
U 1 1 5CA98648
P 10300 2850
F 0 "#PWR02" H 10300 2850 30  0001 C CNN
F 1 "GND" H 10300 2780 30  0001 C CNN
F 2 "" H 10300 2850 60  0000 C CNN
F 3 "" H 10300 2850 60  0000 C CNN
	1    10300 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2750 10300 2850
Wire Wire Line
	10000 2750 10000 2850
Wire Wire Line
	6900 5000 6250 5000
Wire Wire Line
	6900 4900 6250 4900
Wire Wire Line
	6550 4300 6850 4300
Connection ~ 6850 4300
Wire Wire Line
	6900 4800 6400 4800
$Comp
L t_Devices:TEST_POINT TP13
U 1 1 5CB0A87F
P 6100 4800
F 0 "TP13" V 6100 4900 60  0000 L CNN
F 1 "TP" H 6178 4689 60  0001 L CNN
F 2 "t_misc:TP60" H 6178 4636 60  0001 L CNN
F 3 "" H 6100 4800 60  0000 C CNN
	1    6100 4800
	0    -1   -1   0   
$EndComp
$Comp
L t_Devices:TEST_POINT TP14
U 1 1 5CB0C501
P 6100 4900
F 0 "TP14" V 6100 5000 60  0000 L CNN
F 1 "TP" H 6178 4789 60  0001 L CNN
F 2 "t_misc:TP60" H 6178 4736 60  0001 L CNN
F 3 "" H 6100 4900 60  0000 C CNN
	1    6100 4900
	0    -1   -1   0   
$EndComp
$Comp
L t_Devices:TEST_POINT TP15
U 1 1 5CB0C7FE
P 6100 5000
F 0 "TP15" V 6000 4950 60  0000 L CNN
F 1 "TP" H 6178 4889 60  0001 L CNN
F 2 "t_misc:TP60" H 6178 4836 60  0001 L CNN
F 3 "" H 6100 5000 60  0000 C CNN
	1    6100 5000
	0    -1   -1   0   
$EndComp
$Comp
L t_Devices:Res6 R5
U 1 1 5CB0D5F2
P 5100 4000
F 0 "R5" H 5020 3954 50  0000 R CNN
F 1 "Res6" H 5020 4045 50  0000 R CNN
F 2 "t_passive_smd:res_0603" H 5100 4010 60  0001 C CNN
F 3 "" H 5100 4010 60  0000 C CNN
	1    5100 4000
	-1   0    0    1   
$EndComp
$Comp
L t_Devices:Res6 R6
U 1 1 5CB0E85C
P 5350 4300
F 0 "R6" V 5225 4300 50  0000 C CNN
F 1 "Res6" V 5134 4300 50  0000 C CNN
F 2 "t_passive_smd:res_0603" H 5350 4310 60  0001 C CNN
F 3 "" H 5350 4310 60  0000 C CNN
	1    5350 4300
	0    -1   -1   0   
$EndComp
$Comp
L t_Devices:C_small C12
U 1 1 5CB0EEEF
P 5100 4600
F 0 "C12" H 5013 4646 50  0000 R CNN
F 1 "0.1uF" H 5013 4555 50  0000 R CNN
F 2 "t_passive_smd:cap_0603" H 5138 4450 50  0001 C CNN
F 3 "" H 5100 4600 50  0001 C CNN
	1    5100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4300 5100 4300
Wire Wire Line
	5100 4300 5100 4150
Wire Wire Line
	5100 4300 5100 4500
Connection ~ 5100 4300
Wire Wire Line
	6400 4800 6400 4300
Wire Wire Line
	6400 4300 5500 4300
Connection ~ 6400 4800
Wire Wire Line
	6400 4800 6250 4800
$Comp
L t_Power:GND #PWR04
U 1 1 5CB46196
P 5100 4750
F 0 "#PWR04" H 5100 4750 30  0001 C CNN
F 1 "GND" H 5100 4680 30  0001 C CNN
F 2 "" H 5100 4750 60  0000 C CNN
F 3 "" H 5100 4750 60  0000 C CNN
	1    5100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4700 5100 4750
$Comp
L t_Power:+5.0Vx #PWR03
U 1 1 5CB54C8D
P 5100 3700
F 0 "#PWR03" H 5100 3675 60  0001 C CNN
F 1 "+5.0Vx" V 5083 3753 60  0000 L CNN
F 2 "" H 5100 3700 60  0000 C CNN
F 3 "" H 5100 3700 60  0000 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3800 5100 3850
Text Label 6550 4800 0    50   ~ 0
XRES
Text Label 6550 4900 0    50   ~ 0
SWDIO
Text Label 6550 5000 0    50   ~ 0
SWDCLK
Text Notes 1500 3100 0    30   ~ 0
yellow
Text Notes 2800 3100 0    30   ~ 0
orange
Text Notes 3100 3200 0    30   ~ 0
red
Text Notes 1600 3200 0    30   ~ 0
black
Text Notes 3100 3300 0    30   ~ 0
green
Text Notes 1600 3300 0    30   ~ 0
black
Text Notes 3150 3500 0    30   ~ 0
blue
Text Notes 1600 3400 0    30   ~ 0
black
Text Notes 3100 3400 0    30   ~ 0
white
Text Notes 1650 3500 0    30   ~ 0
black
Wire Notes Line
	14100 4100 11750 4100
Wire Notes Line
	11750 4100 11750 2050
Wire Notes Line
	11750 2050 9000 2050
Wire Notes Line
	9000 2050 9000 2650
Text Notes 9400 2000 0    50   ~ 0
white wire connection to P0.4
Wire Notes Line
	13200 5800 12850 5800
Wire Notes Line
	12850 5800 12850 1550
Wire Notes Line
	12850 1550 8900 1550
Wire Notes Line
	8900 1550 8900 2450
Wire Notes Line
	13200 6200 12750 6200
Wire Notes Line
	12750 6200 12750 1400
Wire Notes Line
	12750 1400 8800 1400
Wire Notes Line
	8800 1400 8800 2650
$Comp
L t_Devices:TEST_POINT TP3
U 1 1 5CB2C4DF
P 7800 2850
F 0 "TP3" H 7725 2950 60  0000 L CNN
F 1 "TP" H 7878 2739 60  0001 L CNN
F 2 "t_misc:TP60" H 7878 2686 60  0001 L CNN
F 3 "" H 7800 2850 60  0000 C CNN
	1    7800 2850
	1    0    0    -1  
$EndComp
$Comp
L t_Devices:TEST_POINT TP12
U 1 1 5CA97B37
P 10300 2600
F 0 "TP12" H 10200 2725 60  0000 L CNN
F 1 "TP" H 10378 2489 60  0001 L CNN
F 2 "t_misc:TP60" H 10378 2436 60  0001 L CNN
F 3 "" H 10300 2600 60  0000 C CNN
	1    10300 2600
	1    0    0    -1  
$EndComp
Wire Notes Line
	7500 1800 7500 2400
Wire Notes Line
	6200 1800 7500 1800
Wire Notes Line
	7700 2400 7700 1650
Wire Notes Line
	6150 1650 7700 1650
Text Notes 5450 1750 0    50   ~ 0
Local MPG Input
Wire Notes Line
	7800 2650 7800 1000
Wire Notes Line
	6200 1000 7800 1000
Wire Notes Line
	7900 2400 7900 850 
Wire Notes Line
	6200 850  7900 850 
$Comp
L t_Power:GND #PWR?
U 1 1 5E211BE3
P 5700 1100
F 0 "#PWR?" H 5700 1100 30  0001 C CNN
F 1 "GND" H 5700 1030 30  0001 C CNN
F 2 "" H 5700 1100 60  0000 C CNN
F 3 "" H 5700 1100 60  0000 C CNN
	1    5700 1100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E212B10
P 6000 850
F 0 "SW?" H 6000 1135 50  0000 C CNN
F 1 "SW_Push" H 6000 1044 50  0000 C CNN
F 2 "" H 6000 1050 50  0001 C CNN
F 3 "~" H 6000 1050 50  0001 C CNN
	1    6000 850 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E215686
P 6000 1000
F 0 "SW?" H 6000 950 50  0000 C CNN
F 1 "SW_Push" H 6000 850 50  0000 C CNN
F 2 "" H 6000 1200 50  0001 C CNN
F 3 "~" H 6000 1200 50  0001 C CNN
	1    6000 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1100 5700 1000
Wire Wire Line
	5700 1000 5800 1000
Wire Wire Line
	5700 1000 5700 850 
Wire Wire Line
	5700 850  5800 850 
Connection ~ 5700 1000
$EndSCHEMATC