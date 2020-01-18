EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
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
$EndDescr
Wire Wire Line
	5900 3000 7900 3000
Wire Wire Line
	5900 2900 8750 2900
$Comp
L MPG_Micro-rescue:DB25_FEMALE J?
U 1 1 5C9BC0B5
P 9050 3900
F 0 "J?" H 9300 5350 50  0000 L CNN
F 1 "DB25_FEMALE" H 9300 5250 50  0000 L CNN
F 2 "t_connectors:DB25_F_Edge" H 9050 3900 50  0001 C CNN
F 3 "" H 9050 3900 50  0001 C CNN
	1    9050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3100 7900 3100
Wire Wire Line
	7900 3100 7900 3000
Wire Wire Line
	8750 3300 7800 3300
Wire Wire Line
	8750 3500 7700 3500
Wire Wire Line
	8750 3700 7600 3700
Wire Wire Line
	8750 4100 7400 4100
Wire Wire Line
	7300 4300 8750 4300
Wire Wire Line
	8600 5000 8750 5000
Wire Wire Line
	8600 4800 8750 4800
Connection ~ 8600 5000
Wire Wire Line
	8600 4600 8750 4600
Connection ~ 8600 4800
Wire Wire Line
	8600 4400 8750 4400
Connection ~ 8600 4600
Wire Wire Line
	8600 4200 8750 4200
Connection ~ 8600 4400
Wire Wire Line
	8750 4000 8600 4000
Connection ~ 8600 4200
Wire Wire Line
	8750 3800 8600 3800
Connection ~ 8600 4000
$Comp
L power:GND #PWR?
U 1 1 5C9BC0CF
P 8600 5200
F 0 "#PWR?" H 8600 4950 50  0001 C CNN
F 1 "GND" H 8605 5027 50  0000 C CNN
F 2 "" H 8600 5200 50  0001 C CNN
F 3 "" H 8600 5200 50  0001 C CNN
	1    8600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4500 8750 4500
Wire Wire Line
	6500 4700 8750 4700
Wire Wire Line
	5900 3900 8150 3900
Wire Wire Line
	8000 3000 8750 3000
Wire Wire Line
	8000 2350 8000 3000
Wire Wire Line
	8000 3000 8000 3200
Wire Wire Line
	6650 5100 8750 5100
Wire Wire Line
	7000 4900 8750 4900
Wire Wire Line
	6400 2700 8200 2700
Wire Wire Line
	8200 2700 8750 2700
$Comp
L power:+5V #PWR?
U 1 1 5C9BC0DF
P 8000 2350
F 0 "#PWR?" H 8000 2200 50  0001 C CNN
F 1 "+5V" H 8015 2523 50  0000 C CNN
F 2 "" H 8000 2350 50  0001 C CNN
F 3 "" H 8000 2350 50  0001 C CNN
	1    8000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4000 8450 4000
Wire Wire Line
	8450 4000 8450 3900
Wire Wire Line
	8450 3900 8750 3900
Wire Wire Line
	8250 3800 8250 3600
Wire Wire Line
	8150 3900 8150 3400
Text Label 8300 3200 0    60   ~ 0
+5V
Text Label 8300 3000 0    60   ~ 0
+5V
Wire Wire Line
	8600 3800 8600 4000
Wire Wire Line
	8600 4000 8600 4200
Wire Wire Line
	8600 4200 8600 4400
Wire Wire Line
	8600 4400 8600 4600
Wire Wire Line
	8600 4600 8600 4800
Wire Wire Line
	8600 4800 8600 5000
Wire Wire Line
	8600 5000 8600 5200
$Comp
L BOB-cache:TEST_POINT TP?
U 1 1 5C9BC0F3
P 8450 2400
F 0 "TP?" V 8450 2550 60  0000 C CNN
F 1 "TEST_POINT" V 8450 2600 60  0001 C CNN
F 2 "t_misc:TP50" H 8450 2400 60  0001 C CNN
F 3 "" H 8450 2400 60  0000 C CNN
	1    8450 2400
	-1   0    0    -1  
$EndComp
$Comp
L BOB-cache:TEST_POINT TP?
U 1 1 5C9BC0F9
P 8200 2450
F 0 "TP?" V 8200 2600 60  0000 C CNN
F 1 "TEST_POINT" V 8200 2650 60  0001 C CNN
F 2 "t_misc:TP50" H 8200 2450 60  0001 C CNN
F 3 "" H 8200 2450 60  0000 C CNN
	1    8200 2450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8200 2600 8200 2700
Connection ~ 8200 2700
Wire Wire Line
	8250 3800 6900 3800
Wire Wire Line
	8000 3200 8750 3200
Connection ~ 8000 3000
Wire Wire Line
	8750 2800 8450 2800
Wire Wire Line
	8450 2800 8450 2550
Wire Wire Line
	8250 3600 8750 3600
Wire Wire Line
	8150 3400 8750 3400
Text Notes 9300 3650 0    60   ~ 0
Pink (LED+)\n
Text Notes 9300 3750 0    60   ~ 0
Dk Green (X1)\n
Text Notes 9300 2950 0    60   ~ 0
Brown (X)\n
Text Notes 9300 3150 0    60   ~ 0
Orange (Y)\n
Text Notes 9300 3350 0    60   ~ 0
Lt Blue (Z)\n
Text Notes 9300 3550 0    60   ~ 0
Blue (4)\n
Text Notes 9300 3850 0    60   ~ 0
Gray (GND LED-)\n
Text Notes 9300 3950 0    60   ~ 0
Green (X10)\n
Text Notes 9300 3450 0    60   ~ 0
NC\n
Text Notes 9300 2850 0    60   ~ 0
Red Black (ESTOP)\n\n
Text Notes 9300 2850 0    60   ~ 0
NC\n
Text Notes 9300 3050 0    60   ~ 0
Green Black (+5V - ESTOP)\n
Text Notes 9300 3250 0    60   ~ 0
Red (+5V)\n
Text Notes 9300 4150 0    60   ~ 0
Lt Purple (X100)\n
Text Notes 9300 4950 0    60   ~ 0
Clear (B-)\n
Text Notes 9300 5150 0    60   ~ 0
White (B+)\n
Text Notes 9300 4550 0    60   ~ 0
Lt Yellow (A-)\n
Text Notes 9300 4650 0    60   ~ 0
Shield (GND)\n
Text Notes 9300 4750 0    60   ~ 0
Yellow (A+)\n
Text Notes 9300 4450 0    60   ~ 0
Clear Black (GND - ESTOP)\n
Text Notes 9300 4350 0    60   ~ 0
NC\n
Text Notes 9300 4250 0    60   ~ 0
Black (GND)\n
Text Notes 9300 4050 0    60   ~ 0
Purple (GND Com)
Text Notes 9300 4850 0    60   ~ 0
NC\n
Text Notes 9300 5050 0    60   ~ 0
NC\n
$EndSCHEMATC
