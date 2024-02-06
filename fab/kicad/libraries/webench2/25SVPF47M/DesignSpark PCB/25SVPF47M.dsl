SamacSys ECAD Model
391755/877297/2.50/2/2/Capacitor Polarised

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r350_160"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.600) (shapeHeight 3.500))
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
	(patternDef "16SVF180M" (originalName "16SVF180M")
		(multiLayer
			(pad (padNum 1) (padStyleRef r350_160) (pt 0.000, -2.800) (rotation 0))
			(pad (padNum 2) (padStyleRef r350_160) (pt 0.000, 2.800) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0.000, 0.000) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -4.3 5.55) (pt 4.3 5.55) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 4.3 5.55) (pt 4.3 -5.55) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 4.3 -5.55) (pt -4.3 -5.55) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -4.3 -5.55) (pt -4.3 5.55) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -5.1) (pt 0 -5.1) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -5.15) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -5.2) (pt 0 -5.2) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -5.15) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -5.1) (pt 0 -5.1) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -5.15) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.3 2.7) (pt -3.3 -1.8) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.3 -1.8) (pt -1.8 -3.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.8 -3.3) (pt 1.8 -3.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.8 -3.3) (pt 3.3 -1.8) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.3 -1.8) (pt 3.3 3.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.3 3.3) (pt -3.3 3.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.3 3.3) (pt -3.3 2.7) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.5 3.3) (pt -3.3 3.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.3 3.3) (pt -3.3 -1.8) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.3 -1.8) (pt -1.8 -3.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.8 -3.3) (pt -1.5 -3.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.5 -3.3) (pt 1.8 -3.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.8 -3.3) (pt 3.3 -1.8) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.3 -1.8) (pt 3.3 3.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.3 3.3) (pt 1.5 3.3) (width 0.2))
		)
	)
	(symbolDef "25SVPF47M" (originalName "25SVPF47M")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 200 mils -100 mils) (width 6 mils))
		(line (pt 200 mils -100 mils) (pt 230 mils -100 mils) (width 6 mils))
		(line (pt 230 mils -100 mils) (pt 230 mils 100 mils) (width 6 mils))
		(line (pt 230 mils 100 mils) (pt 200 mils 100 mils) (width 6 mils))
		(line (pt 180 mils 50 mils) (pt 140 mils 50 mils) (width 6 mils))
		(line (pt 160 mils 70 mils) (pt 160 mils 30 mils) (width 6 mils))
		(line (pt 100 mils 0 mils) (pt 200 mils 0 mils) (width 6 mils))
		(line (pt 300 mils 0 mils) (pt 400 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 100 mils) (pt 300 mils -100 mils) (pt 270 mils -100 mils) (pt 270 mils 100 mils) (pt 300 mils 100 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "25SVPF47M" (originalName "25SVPF47M") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "-") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "25SVPF47M"))
		(attachedPattern (patternNum 1) (patternName "16SVF180M")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Panasonic")
		(attr "Manufacturer_Part_Number" "25SVPF47M")
		(attr "Mouser Part Number" "667-25SVPF47M")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Panasonic/25SVPF47M?qs=OE1iw1LrrPH6vnYaLYl%2FJw%3D%3D")
		(attr "Arrow Part Number" "25SVPF47M")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/25svpf47m/panasonic?region=nac")
		(attr "Description" "Panasonic 47uF 25 V dc Polymer Aluminium Electrolytic Capacitor C6, OS-CON Series 5000h 6.3 x 5.9mm")
		(attr "Datasheet Link" "http://industrial.panasonic.com/cdbs/www-data/pdf/AAB8000/AAB8000C177.pdf")
		(attr "Height" "6 mm")
	)

)
