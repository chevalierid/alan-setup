PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//231402/877297/2.50/16/3/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r192.5_65"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.65) (shapeHeight 1.925))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "SOIC127P1032X265-16N" (originalName "SOIC127P1032X265-16N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r192.5_65) (pt -4.712, 4.445) (rotation 90))
			(pad (padNum 2) (padStyleRef r192.5_65) (pt -4.712, 3.175) (rotation 90))
			(pad (padNum 3) (padStyleRef r192.5_65) (pt -4.712, 1.905) (rotation 90))
			(pad (padNum 4) (padStyleRef r192.5_65) (pt -4.712, 0.635) (rotation 90))
			(pad (padNum 5) (padStyleRef r192.5_65) (pt -4.712, -0.635) (rotation 90))
			(pad (padNum 6) (padStyleRef r192.5_65) (pt -4.712, -1.905) (rotation 90))
			(pad (padNum 7) (padStyleRef r192.5_65) (pt -4.712, -3.175) (rotation 90))
			(pad (padNum 8) (padStyleRef r192.5_65) (pt -4.712, -4.445) (rotation 90))
			(pad (padNum 9) (padStyleRef r192.5_65) (pt 4.712, -4.445) (rotation 90))
			(pad (padNum 10) (padStyleRef r192.5_65) (pt 4.712, -3.175) (rotation 90))
			(pad (padNum 11) (padStyleRef r192.5_65) (pt 4.712, -1.905) (rotation 90))
			(pad (padNum 12) (padStyleRef r192.5_65) (pt 4.712, -0.635) (rotation 90))
			(pad (padNum 13) (padStyleRef r192.5_65) (pt 4.712, 0.635) (rotation 90))
			(pad (padNum 14) (padStyleRef r192.5_65) (pt 4.712, 1.905) (rotation 90))
			(pad (padNum 15) (padStyleRef r192.5_65) (pt 4.712, 3.175) (rotation 90))
			(pad (padNum 16) (padStyleRef r192.5_65) (pt 4.712, 4.445) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -5.925 5.5) (pt 5.925 5.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 5.925 5.5) (pt 5.925 -5.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 5.925 -5.5) (pt -5.925 -5.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -5.925 -5.5) (pt -5.925 5.5) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.75 5.15) (pt 3.75 5.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.75 5.15) (pt 3.75 -5.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.75 -5.15) (pt -3.75 -5.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.75 -5.15) (pt -3.75 5.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.75 3.88) (pt -2.48 5.15) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.4 5.15) (pt 3.4 5.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.4 5.15) (pt 3.4 -5.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.4 -5.15) (pt -3.4 -5.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.4 -5.15) (pt -3.4 5.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -5.675 5.12) (pt -3.75 5.12) (width 0.2))
		)
	)
	(symbolDef "DS3231SN#" (originalName "DS3231SN#")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 0 mils -400 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -425 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 6) (pt 0 mils -500 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -525 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 7) (pt 0 mils -600 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -625 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 8) (pt 0 mils -700 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -725 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 9) (pt 1400 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 10) (pt 1400 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 11) (pt 1400 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 12) (pt 1400 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 13) (pt 1400 mils -400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -425 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 14) (pt 1400 mils -500 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -525 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 15) (pt 1400 mils -600 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -625 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 16) (pt 1400 mils -700 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -725 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1200 mils 100 mils) (width 6 mils))
		(line (pt 1200 mils 100 mils) (pt 1200 mils -800 mils) (width 6 mils))
		(line (pt 1200 mils -800 mils) (pt 200 mils -800 mils) (width 6 mils))
		(line (pt 200 mils -800 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1250 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1250 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "DS3231SN#" (originalName "DS3231SN#") (compHeader (numPins 16) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "32KHZ") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "VCC") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "__INT__/SQW") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "__RST") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "5" (pinName "N.C._1") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "6" (pinName "N.C._2") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "7" (pinName "N.C._3") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "8" (pinName "N.C._4") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "16" (pinName "SCL") (partNum 1) (symPinNum 9) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "15" (pinName "SDA") (partNum 1) (symPinNum 10) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "14" (pinName "VBAT") (partNum 1) (symPinNum 11) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "13" (pinName "GND") (partNum 1) (symPinNum 12) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "12" (pinName "N.C._8") (partNum 1) (symPinNum 13) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "11" (pinName "N.C._7") (partNum 1) (symPinNum 14) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "10" (pinName "N.C._6") (partNum 1) (symPinNum 15) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "9" (pinName "N.C._5") (partNum 1) (symPinNum 16) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "DS3231SN#"))
		(attachedPattern (patternNum 1) (patternName "SOIC127P1032X265-16N")
			(numPads 16)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
				(padNum 8) (compPinRef "8")
				(padNum 9) (compPinRef "9")
				(padNum 10) (compPinRef "10")
				(padNum 11) (compPinRef "11")
				(padNum 12) (compPinRef "12")
				(padNum 13) (compPinRef "13")
				(padNum 14) (compPinRef "14")
				(padNum 15) (compPinRef "15")
				(padNum 16) (compPinRef "16")
			)
		)
		(attr "Manufacturer_Name" "Analog Devices")
		(attr "Manufacturer_Part_Number" "DS3231SN#")
		(attr "Mouser Part Number" "700-DS3231SN#")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Analog-Devices-Maxim-Integrated/DS3231SN?qs=1eQvB6Dk1vhUlr8%2FOrV0Fw%3D%3D")
		(attr "Arrow Part Number" "DS3231SN#")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/ds3231sn/analog-devices?region=nac")
		(attr "Description" "Real Time Clock Serial Maxim DS3231SN# Real Time Clock, Battery Backup, Calendar, Clock, I2C, 5.5 V, 16-Pin SOIC")
		(attr "<Hyperlink>" "https://datasheets.maximintegrated.com/en/ds/DS3231.pdf")
		(attr "<Component Height>" "2.65")
		(attr "<STEP Filename>" "DS3231SN#.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)