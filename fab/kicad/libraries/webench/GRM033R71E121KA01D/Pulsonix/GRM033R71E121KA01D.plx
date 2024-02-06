PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//731057/877297/2.50/2/5/Capacitor

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r46_42"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.42) (shapeHeight 0.46))
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
	(patternDef "CAPC0603X33N" (originalName "CAPC0603X33N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r46_42) (pt -0.33, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r46_42) (pt 0.33, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -0.71 0.36) (pt 0.71 0.36) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 0.71 0.36) (pt 0.71 -0.36) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 0.71 -0.36) (pt -0.71 -0.36) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -0.71 -0.36) (pt -0.71 0.36) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.3 0.15) (pt 0.3 0.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.3 0.15) (pt 0.3 -0.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 0.3 -0.15) (pt -0.3 -0.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.3 -0.15) (pt -0.3 0.15) (width 0.025))
		)
	)
	(symbolDef "GRM033R71E121KA01D" (originalName "GRM033R71E121KA01D")

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
	(compDef "GRM033R71E121KA01D" (originalName "GRM033R71E121KA01D") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "GRM033R71E121KA01D"))
		(attachedPattern (patternNum 1) (patternName "CAPC0603X33N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Murata Electronics")
		(attr "Manufacturer_Part_Number" "GRM033R71E121KA01D")
		(attr "Mouser Part Number" "81-GRM033R71E121KA1D")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Murata-Electronics/GRM033R71E121KA01D?qs=DgSEN5cN%252B77aTTnmwSmLEA%3D%3D")
		(attr "Arrow Part Number" "GRM033R71E121KA01D")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/grm033r71e121ka01d/murata-manufacturing")
		(attr "Description" "Multilayer Ceramic Capacitors MLCC - SMD/SMT 120pF 25 volts 10%")
		(attr "<Hyperlink>" "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf")
		(attr "<Component Height>" "0.33")
		(attr "<STEP Filename>" "GRM033R71E121KA01D.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
