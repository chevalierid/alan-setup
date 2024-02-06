SamacSys ECAD Model
640264/877297/2.50/2/3/Capacitor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r147_97"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.97) (shapeHeight 1.47))
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
	(patternDef "CAPC2012X145N" (originalName "CAPC2012X145N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r147_97) (pt -0.83, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r147_97) (pt 0.83, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.465 0.89) (pt 1.465 0.89) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.465 0.89) (pt 1.465 -0.89) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.465 -0.89) (pt -1.465 -0.89) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.465 -0.89) (pt -1.465 0.89) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 0.625) (pt 1 0.625) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 0.625) (pt 1 -0.625) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 -0.625) (pt -1 -0.625) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 -0.625) (pt -1 0.625) (width 0.1))
		)
	)
	(symbolDef "GRM21BR61E106MA73L" (originalName "GRM21BR61E106MA73L")

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
	(compDef "GRM21BR61E106MA73L" (originalName "GRM21BR61E106MA73L") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "GRM21BR61E106MA73L"))
		(attachedPattern (patternNum 1) (patternName "CAPC2012X145N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Murata Electronics")
		(attr "Manufacturer_Part_Number" "GRM21BR61E106MA73L")
		(attr "Mouser Part Number" "81-GRM21BR61E106MA3L")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Murata-Electronics/GRM21BR61E106MA73L?qs=2W5sgKM%2F371odLMyCilkag%3D%3D")
		(attr "Arrow Part Number" "GRM21BR61E106MA73L")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/grm21br61e106ma73l/murata-manufacturing?region=nac")
		(attr "Description" "Murata 0805 (2012M) 10uF MLCC 25V dc +/-20% SMD GRM21BR61E106MA73L")
		(attr "Datasheet Link" "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf")
		(attr "Height" "1.45 mm")
	)

)
