PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//1586574/877297/2.50/2/3/Schottky Diode

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c225_h150"
		(holeDiam 1.5)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 2.25) (shapeHeight 2.25))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 2.25) (shapeHeight 2.25))
	)
	(padStyleDef "s225_h150"
		(holeDiam 1.5)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 2.25) (shapeHeight 2.25))
		(padShape (layerNumRef 16) (padShapeType Rect)  (shapeWidth 2.25) (shapeHeight 2.25))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "DIOAD3020W130L900D530" (originalName "DIOAD3020W130L900D530")
		(multiLayer
			(pad (padNum 1) (padStyleRef s225_h150) (pt 0, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef c225_h150) (pt 30.2, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.375 3) (pt 31.575 3) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 31.575 3) (pt 31.575 -3) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 31.575 -3) (pt -1.375 -3) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.375 -3) (pt -1.375 3) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt 10.6 2.65) (pt 19.6 2.65) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 19.6 2.65) (pt 19.6 -2.65) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 19.6 -2.65) (pt 10.6 -2.65) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 10.6 -2.65) (pt 10.6 2.65) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 10.6 0) (pt 13.25 2.65) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0 0) (pt 10.6 0) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 19.6 0) (pt 30.2 0) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt 10.6 2.65) (pt 19.6 2.65) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 19.6 2.65) (pt 19.6 -2.65) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 19.6 -2.65) (pt 10.6 -2.65) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 10.6 -2.65) (pt 10.6 2.65) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 10.6 0) (pt 13.25 2.65) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.475 0) (pt 10.6 0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 19.6 0) (pt 28.725 0) (width 0.2))
		)
	)
	(symbolDef "SB10150TA" (originalName "SB10150TA")

		(pin (pinNum 1) (pt 100 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 240 mils -15 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 560 mils -15 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 300 mils 100 mils) (pt 300 mils -100 mils) (width 6 mils))
		(line (pt 300 mils 100 mils) (pt 340 mils 100 mils) (width 6 mils))
		(line (pt 340 mils 100 mils) (pt 340 mils 60 mils) (width 6 mils))
		(line (pt 300 mils -100 mils) (pt 260 mils -100 mils) (width 6 mils))
		(line (pt 260 mils -100 mils) (pt 260 mils -60 mils) (width 6 mils))
		(line (pt 200 mils 0 mils) (pt 300 mils 0 mils) (width 6 mils))
		(line (pt 500 mils 0 mils) (pt 600 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 0 mils) (pt 500 mils 100 mils) (pt 500 mils -100 mils) (pt 300 mils 0 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 500 mils 350 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 500 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "SB10150TA" (originalName "SB10150TA") (compHeader (numPins 2) (numParts 1) (refDesPrefix D)
		)
		(compPin "1" (pinName "K") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "A") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "SB10150TA"))
		(attachedPattern (patternNum 1) (patternName "DIOAD3020W130L900D530")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "SMC Diode Solutions")
		(attr "Manufacturer_Part_Number" "SB10150TA")
		(attr "Mouser Part Number" "")
		(attr "Mouser Price/Stock" "")
		(attr "Arrow Part Number" "")
		(attr "Arrow Price/Stock" "")
		(attr "Description" "SB10150 SCHOTTKY RECTIFIER")
		(attr "<Hyperlink>" "http://www.smc-diodes.com/propdf/SB10150%20N0884%20REV.A.pdf")
		(attr "<STEP Filename>" "SB10150TA.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
