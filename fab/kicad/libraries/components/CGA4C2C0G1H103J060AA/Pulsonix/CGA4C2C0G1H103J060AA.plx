PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//361058/877297/2.50/2/2/Capacitor

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r147_62"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.62) (shapeHeight 1.47))
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
	(patternDef "CAPC2012X75N" (originalName "CAPC2012X75N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r147_62) (pt -1, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r147_62) (pt 1, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.46 0.89) (pt 1.46 0.89) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.46 0.89) (pt 1.46 -0.89) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.46 -0.89) (pt -1.46 -0.89) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.46 -0.89) (pt -1.46 0.89) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 0.625) (pt 1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 0.625) (pt 1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 -0.625) (pt -1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 -0.625) (pt -1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 0.525) (pt 0 -0.525) (width 0.2))
		)
	)
	(symbolDef "CGA4C2C0G1H103J060AA" (originalName "CGA4C2C0G1H103J060AA")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Normal"))
		))
		(line (pt 220 mils 100 mils) (pt 220 mils -100 mils) (width 6 mils))
		(line (pt 280 mils 100 mils) (pt 280 mils -100 mils) (width 6 mils))
		(line (pt 200 mils 0 mils) (pt 220 mils 0 mils) (width 6 mils))
		(line (pt 280 mils 0 mils) (pt 300 mils 0 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 350 mils 150 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "CGA4C2C0G1H103J060AA" (originalName "CGA4C2C0G1H103J060AA") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "CGA4C2C0G1H103J060AA"))
		(attachedPattern (patternNum 1) (patternName "CAPC2012X75N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "TDK")
		(attr "Manufacturer_Part_Number" "CGA4C2C0G1H103J060AA")
		(attr "Mouser Part Number" "810-CGA4C2C0G1H103J")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TDK/CGA4C2C0G1H103J060AA?qs=FxQuwy19cyC9M6v0nMqjhA%3D%3D")
		(attr "Arrow Part Number" "CGA4C2C0G1H103J060AA")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/cga4c2c0g1h103j060aa/tdk?region=nac")
		(attr "Description" "TDK 2012 CGA 10nF Ceramic Multilayer Capacitor, 50 V dc, +125C, C0G Dielectric, +/-5%")
		(attr "<Hyperlink>" "http://docs-europe.electrocomponents.com/webdocs/14e9/0900766b814e9125.pdf")
		(attr "<Component Height>" "0.75")
		(attr "<STEP Filename>" "CGA4C2C0G1H103J060AA.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)