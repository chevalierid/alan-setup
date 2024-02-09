PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//921593/877297/2.50/2/2/Resistor

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r50_47.5"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.475) (shapeHeight 0.500))
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
	(patternDef "ERJ2RKD1004X" (originalName "ERJ2RKD1004X")
		(multiLayer
			(pad (padNum 1) (padStyleRef r50_47.5) (pt -0.512, 0.000) (rotation 0))
			(pad (padNum 2) (padStyleRef r50_47.5) (pt 0.512, 0.000) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0.000, 0.000) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.175 0.55) (pt 1.175 0.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.175 0.55) (pt 1.175 -0.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.175 -0.55) (pt -1.175 -0.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.175 -0.55) (pt -1.175 0.55) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.5 0.25) (pt 0.5 0.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.5 0.25) (pt 0.5 -0.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.5 -0.25) (pt -0.5 -0.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.5 -0.25) (pt -0.5 0.25) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.95 0.025) (pt -0.95 0.025) (width 0.05))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -0.95, 0) (radius 0.025) (startAngle 90.0) (sweepAngle 180.0) (width 0.05))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.95 -0.025) (pt -0.95 -0.025) (width 0.05))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -0.95, 0) (radius 0.025) (startAngle 270) (sweepAngle 180.0) (width 0.05))
		)
	)
	(symbolDef "ERJ-2RKF2400X" (originalName "ERJ-2RKF2400X")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 700 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 50 mils) (pt 500 mils 50 mils) (width 6 mils))
		(line (pt 500 mils 50 mils) (pt 500 mils -50 mils) (width 6 mils))
		(line (pt 500 mils -50 mils) (pt 200 mils -50 mils) (width 6 mils))
		(line (pt 200 mils -50 mils) (pt 200 mils 50 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 550 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 550 mils 150 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "ERJ-2RKF2400X" (originalName "ERJ-2RKF2400X") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "ERJ-2RKF2400X"))
		(attachedPattern (patternNum 1) (patternName "ERJ2RKD1004X")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Panasonic")
		(attr "Manufacturer_Part_Number" "ERJ-2RKF2400X")
		(attr "Mouser Part Number" "667-ERJ-2RKF2400X")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Panasonic/ERJ-2RKF2400X?qs=YMBIwoNQYdU72k3QMprnfQ%3D%3D")
		(attr "Arrow Part Number" "ERJ-2RKF2400X")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/erj-2rkf2400x/panasonic?region=nac")
		(attr "Description" "Thick Film Resistors - SMD 0402 240ohms 1% AEC-Q200")
		(attr "<Hyperlink>" "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C86.pdf")
		(attr "<Component Height>" "0.4")
		(attr "<STEP Filename>" "ERJ-2RKF2400X.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
