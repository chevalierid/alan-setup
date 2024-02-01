
*   DEVICE = TLC074
*
*   Rev. A     	TLC074 operational amplifier "macromodel" subcircuit
* 			created using Parts release 8.0 on 12/16/99 at 08:38
* 			Parts is a MicroSim product.
*
*   Rev. B    	7 October 2003 By Neil Albaugh: ADDED HEADER TEXT & EDITED MODEL 
*			FROM TLC074_5V DATA SHEET TEXT MACROMODEL
*
* connections:         non-inverting input
*		 |   inverting input
* 		 |   |  positive power supply
* 		 |   |  |  negative power supply
* 		 |   |  |  |   output
*                                |   |  |  |   |
.subckt TLC07X_5V 1 2 3 4 5
*
c1 11 12 4.8697E-12
c2 6 7 8.0000E-12
css 10 99 4.0063E-12
dc 5 53 dy
de 54 5 dy
dlp 90 91 dx
dln 92 90 dx
dp 4 3 dx
egnd 99 0 poly(2) (3,0) (4,0) 0 .5 .5
fb 7 99 poly(5) vb vc ve vlp vln 0 6.9132E6 -1E3 1E3 6E6 -6E6
ga 6 0 11 12 457.42E-6
gcm 0 6 10 99 1.1293E-6
iss 3 10 dc 183.67E-6
ioff 0 6 dc .806E-6
hlim 90 0 vlim 1K
j1 11 2 10 jx1
j2 12 1 10 jx2
r2 6 9 100.00E3
rd1 4 11 2.1862E3
rd2 4 12 2.1862E3
ro1 8 5 10
ro2 7 99 10
rp 3 4 2.4728E3
rss 10 99 1.0889E6
vb 9 0 dc 0
vc 3 53 dc 1.5410
ve 54 4 dc .84403
vlim 7 8 dc 0
vlp 91 0 dc 119
vln 0 92 dc 119
.model dx D(Is=800.00E-18)
.model dy D(Is=800.00E-18 Rs=1m Cjo=10p)
.model jx1 PJF(Is=117.50E-15 Beta=1.1391E-3 Vto=-1)
.model jx2 PJF(Is=117.50E-15 Beta=1.1391E-3 Vto=-1)
.ends
* END MODEL TL074

