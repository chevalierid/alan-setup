SamacSys ECAD Model
668592/877297/2.50/2/3/Capacitor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r99_81"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.81) (shapeHeight 0.99))
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
	(patternDef "CAPC1608X95N" (originalName "CAPC1608X95N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r99_81) (pt -0.69, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r99_81) (pt 0.69, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.245 0.65) (pt 1.245 0.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.245 0.65) (pt 1.245 -0.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.245 -0.65) (pt -1.245 -0.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.245 -0.65) (pt -1.245 0.65) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.825 0.425) (pt 0.825 0.425) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.825 0.425) (pt 0.825 -0.425) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.825 -0.425) (pt -0.825 -0.425) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.825 -0.425) (pt -0.825 0.425) (width 0.1))
		)
	)
	(symbolDef "EMK107B7104KA-T" (originalName "EMK107B7104KA-T")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(line (pt 220 mils 100 mils) (pt 220 mils -100 mils) (width 6 mils))
		(line (pt 280 mils 100 mils) (pt 280 mils -100 mils) (width 6 mils))
		(line (pt 200 mils 0 mils) (pt 220 mils 0 mils) (width 6 mils))
		(line (pt 280 mils 0 mils) (pt 300 mils 0 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "EMK107B7104KA-T" (originalName "EMK107B7104KA-T") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "EMK107B7104KA-T"))
		(attachedPattern (patternNum 1) (patternName "CAPC1608X95N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "TAIYO YUDEN")
		(attr "Manufacturer_Part_Number" "EMK107B7104KA-T")
		(attr "Mouser Part Number" "963-EMK107B7104KA-T")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TAIYO-YUDEN/EMK107B7104KA-T?qs=I6KAKw0tg2ybqzX8hKPgfw%3D%3D")
		(attr "Arrow Part Number" "EMK107B7104KA-T")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/emk107b7104ka-t/taiyo-yuden")
		(attr "Description" "EMK107B7104KA-T 0.1F +/-10% 16V Ceramic Capacitor X7R 0603")
		(attr "Datasheet Link" "http://www.farnell.com/datasheets/746258.pdf")
		(attr "Height" "0.95 mm")
	)

)
