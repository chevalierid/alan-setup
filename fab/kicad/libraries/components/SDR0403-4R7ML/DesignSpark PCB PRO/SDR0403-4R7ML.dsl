SamacSys ECAD Model
955737/877297/2.50/2/4/Inductor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r450_180"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.8) (shapeHeight 4.5))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "SDR0403" (originalName "SDR0403")
		(multiLayer
			(pad (padNum 1) (padStyleRef r450_180) (pt 0, 1.65) (rotation 90))
			(pad (padNum 2) (padStyleRef r450_180) (pt 0, -1.65) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -0.358, 0.054) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(arc (pt 0, 0) (radius 2.25) (startAngle 0.0) (sweepAngle 0.0) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(arc (pt 0, 0) (radius 2.25) (startAngle 180.0) (sweepAngle 180.0) (width 0.2))
		)
	)
	(symbolDef "SDR0403-4R7ML" (originalName "SDR0403-4R7ML")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 800 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 800 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(arc (pt 250 mils -2 mils) (radius 50 mils) (startAngle 177.7) (sweepAngle -175.4) (width 6 mils))
		(arc (pt 350 mils -2 mils) (radius 50 mils) (startAngle 177.7) (sweepAngle -175.4) (width 6 mils))
		(arc (pt 450 mils -2 mils) (radius 50 mils) (startAngle 177.7) (sweepAngle -175.4) (width 6 mils))
		(arc (pt 550 mils -2 mils) (radius 50 mils) (startAngle 177.7) (sweepAngle -175.4) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 650 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "SDR0403-4R7ML" (originalName "SDR0403-4R7ML") (compHeader (numPins 2) (numParts 1) (refDesPrefix L)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "SDR0403-4R7ML"))
		(attachedPattern (patternNum 1) (patternName "SDR0403")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Bourns")
		(attr "Manufacturer_Part_Number" "SDR0403-4R7ML")
		(attr "Mouser Part Number" "652-SDR0403-4R7ML")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Bourns/SDR0403-4R7ML?qs=xrpI9KL%2FXvtm2g7dmggyxA%3D%3D")
		(attr "Arrow Part Number" "SDR0403-4R7ML")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/sdr0403-4r7ml/bourns?region=nac")
		(attr "Description" "SDR0403 SMD Power Inductors 4.7uH 20% Bourns SDR0403 Series Wire-wound SMD Inductor with a Ferrite Core, 4.7 uH +/-20% Wire-Wound 1.7A Idc Q:28")
		(attr "Datasheet Link" "http://www.bourns.com/docs/Product-Datasheets/sdr0403.pdf")
	)

)