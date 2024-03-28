SamacSys ECAD Model
341389/877297/2.50/2/2/Capacitor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r94_54"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.54) (shapeHeight 0.94))
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
	(patternDef "CAPC1608X80N" (originalName "CAPC1608X80N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r94_54) (pt -0.8, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r94_54) (pt 0.8, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.22 0.62) (pt 1.22 0.62) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.22 0.62) (pt 1.22 -0.62) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 1.22 -0.62) (pt -1.22 -0.62) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.22 -0.62) (pt -1.22 0.62) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.8 0.4) (pt 0.8 0.4) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.8 0.4) (pt 0.8 -0.4) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.8 -0.4) (pt -0.8 -0.4) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.8 -0.4) (pt -0.8 0.4) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 0.3) (pt 0 -0.3) (width 0.2))
		)
	)
	(symbolDef "C1608X6S1C475K080AC" (originalName "C1608X6S1C475K080AC")

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
	(compDef "C1608X6S1C475K080AC" (originalName "C1608X6S1C475K080AC") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "C1608X6S1C475K080AC"))
		(attachedPattern (patternNum 1) (patternName "CAPC1608X80N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "TDK")
		(attr "Manufacturer_Part_Number" "C1608X6S1C475K080AC")
		(attr "Mouser Part Number" "810-C1608X6S1C475K")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TDK/C1608X6S1C475K080AC?qs=dfay7wIA1uELNO4%252B8xvBDw%3D%3D")
		(attr "Arrow Part Number" "C1608X6S1C475K080AC")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/c1608x6s1c475k080ac/tdk?region=nac")
		(attr "Description" "MULTILAYER CERAMIC CHIP CAPACITORS, 1608, Commercial grade, general (Up to 75V)")
		(attr "Datasheet Link" "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf")
		(attr "Height" "0.8 mm")
	)

)