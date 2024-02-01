* LMH6643 SPICE MODEL rev 10-MAY-05
*//////////////////////////////////////////////////////////////////////
* (C) National Semiconductor, Corporation.
* Models developed and under copyright by:
* National Semiconductor, Corporation.  
*/////////////////////////////////////////////////////////////////////
* Legal Notice:  
* The model may be copied, and distributed without any modifications;
* however, reselling or licensing the material is illegal.
* We reserve the right to make changes to the model without prior notice. 
* Pspice Models are provided "AS IS, WITH NO WARRANTY OF ANY KIND" 
*////////////////////////////////////////////////////////////////////
* PINOUT ORDER -IN +IN VCC VEE OUT
* PINOUT ORDER  2   3   7   4   6
.SUBCKT LMH6643 2 3 7 4 6
C4 30 94 7E-20
R50 94 14 700E3
C10 20 96 0.35E-15
R52 96 0 20E3
CC2 14 30 0.0085E-12
E1 39 63 14 62 16
C8 45 0 1E-12
C9 2 0 1E-12
RC1 42 0 1E12
I1 7 46 175E-6
I2 5 4 50E-6
D2 18 0 DVM
I3 7 12 50E-6
C1 13 92 8E-12
D7 23 0 DVM
R1 14 13 100
I4 0 18 1.068E-4
R2 7 15 1
R3 4 16 1
R4 17 98 100
R5 19 97 100
R6 46 8 1
R7 7 21 500
R8 7 22 500
R9 24 80 500
R10 25 80 500
I8 0 23 1.068E-4
I5 26 7 20E-6
I6 80 27 20E-6
I7 28 29 13E-6
E3 3 45 23 18 7.8
D8 37 0 DIM
Q1 30 27 24 Q2M
Q2 14 27 25 Q2M
Q3 34 9 80 Q1M
Q4 9 9 80 Q1M
Q5 92 34 16 Q5M
Q8 34 17 4 Q1M
D9 40 0 DIM
I9 0 37 1.068E-4
Q26 12 12 31 Q1M
Q27 7 12 34 Q1M
Q28 92 8 15 Q28M
Q29 20 19 7 Q29M
Q30 5 5 32 Q29M
Q31 34 5 46 Q29M
Q32 30 26 21 Q33M
Q33 14 26 22 Q33M
Q34 33 28 29 Q29M
Q35 84 35 36 Q35M
Q36 83 2 38 Q35M
R11 33 36 135
R12 33 38 135
Q37 32 32 7 Q29M
Q38 31 31 4 Q1M
R13 20 41 100E3
M1 9 20 46 46 WPM
I10 0 40 1.068E-4
E2 41 39 42 43 1
V3 7 42 2
R14 7 43 10E6
R15 43 80 10E6
D1 46 44 D1M
V4 44 20 0.75
V6 35 45 1E-3
IQA 7 4 -1.00E-3
G3 2 45 40 37 2.3E-4
D3 35 7 D3M
D4 2 7 D3M
D5 64 35 D3M
D6 64 2 D3M
V7 7 29 0.2
G1 0 48 7 0 1
R17 49 48 1
L2 0 49 10E-6
R20 0 49 10
G2 22 21 48 0 7.8E-7
G9 0 57 4 0 1
R21 74 57 1
L5 0 74 12E-6
R22 0 74 120
G10 21 22 57 0 -7.8E-7
R34 81 82 1
L6 82 0 20E-6
R35 82 0 100
G11 21 22 81 0 2.6E-8
G12 0 81 33 0 1
R48 92 6 3
E5 97 7 7 15 -6.7
E6 98 4 16 4 4.85
VCM1 4 80 1.5
VCM2 84 25 0.55
VCM3 83 24 0.55
RN1 62 0 1E12
RN2 63 0 1E12
VF1 62 43 0.99
VF2 7 63 1.2
VCM4 64 4 -0.7
.MODEL Q1M NPN
.MODEL Q2M NPN (VAF=150)
.MODEL Q5M NPN (BF=1000 VAF=125)
.MODEL Q28M PNP (BF=165 VAF=100)
.MODEL Q29M PNP
.MODEL Q33M PNP (VAF=150)
.MODEL Q35M PNP (BF=406 KF=3E-17)
.MODEL WPM PMOS (KP=1E-3 VTO=-0.6)
.MODEL DVM D (IS=1E-16 KF=2.7E-15)
.MODEL DIM D (IS=1E-16 KF=4.5E-15)
.MODEL D1M D (IS=7E-14 M=0.45 N=2 TT=6E-09)
.MODEL D3M D (IS=3E-14)
.ENDS
* END LMH6643 MODEL
