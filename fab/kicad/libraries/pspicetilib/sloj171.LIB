* TL3474 OPERATIONAL AMPLIFIER "MACROMODEL" SUBCIRCUIT

* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TL3474-X   1 2 3 4 5
*
  c1   11 12 4.5496E-12
  c2    6  7 25.000E-12
  cee  10 99 9.0000E-12
  dc    5 53 dy
  de   54  5 dy
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 6.3662E6 -1E3 1E3 6E6 -6E6
  ga    6  0 11 12 942.48E-6
  gcm   0  6 10 99 9.4248E-9
  iee   3 10 dc 39.194E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx1
  q2   12  1 14 qx2
  r2    6  9 100.00E3
  rc1   4 11 1.0610E3
  rc2   4 12 1.0610E3
  re1  13 10 .1
  re2  14 10 .1
  ree  10 99 5.1028E6
  ro1   8  5 50
  ro2   7 99 25
  rp    3  4 109.87E3
  vb    9  0 dc 0
  vc    3 53 dc 1.8066
  ve   54  4 dc 1.8066
  vlim  7  8 dc 0
  vlp  91  0 dc 28
  vln   0 92 dc 28
.model dx D(Is=800.00E-18)
.model dy D(Is=800.00E-18 Rs=1m Cjo=10p)
.model qx1 PNP(Is=800.00E-18 Bf=201.03)
.model qx2 PNP(Is=831.5365E-18 Bf=201.03)
.ends
*$

******************************************************************************
[Disclaimer]    Property of Texas Instruments Incorporated.  Unauthorized
                reproduction and/or distribution is strictly prohibited.

                This product is protected under copyright law.
                Created  2002, (C) Copyright  2002, Texas Instruments 
                Incorporated, All Rights Reserved

                UNLESS THERE IS A SIGNED, WRITTEN AGREEMENT TO THE
                CONTRARY, TEXAS INSTRUMENTS (TI) IS PROVIDING THE SPICE
                MODELS  AND WITHOUT ANY WARRANTY, EXPRESSED OR
                IMPLIED.  TI assumes no liability for:
                 1) the accuracy of the P-Spice models provided to your
                    company;
                 2) the proper functioning of these P-Spice Models in your
                    design or for any resulting applications; or
                 3) infringement of patents, copyrights or intellectual
                    property rights resulting from your use of these P-Spice
                    models.

                TI provides P-Spice Models as a service to our customers.
                You and your company shall not distribute, sell or give
                these models to anyone else without prior written
                permission from TI.

                TI reserves the right to make changes to our products or
                to discontinue any semiconductor product or service
                without notice, and advises our customers to obtain the
                latest version of relevant information to verify, before
                placing orders, that the information being relied on is
                current.

                Please be aware that your receipt and use of the P-Spice
                information provided shall serve as acceptance of these
                terms and conditions.  If you do not accept these terms,
                you should return or destroy the P-Spice models and any
                other accompanying information immediately.

******************************************************************************