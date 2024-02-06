PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//1093219/877297/2.50/11/3/MOSFET N-Channel

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r66_42"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.420) (shapeHeight 0.660))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r47_42"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.420) (shapeHeight 0.470))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r237_108"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.080) (shapeHeight 2.370))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r346_57"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.570) (shapeHeight 3.460))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r237_18"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.180) (shapeHeight 2.370))
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
	(patternDef "NVTFS5C673NLTAG" (originalName "NVTFS5C673NLTAG")
		(multiLayer
			(pad (padNum 1) (padStyleRef r66_42) (pt -0.975, -1.470) (rotation 0))
			(pad (padNum 2) (padStyleRef r66_42) (pt -0.325, -1.470) (rotation 0))
			(pad (padNum 3) (padStyleRef r66_42) (pt 0.325, -1.470) (rotation 0))
			(pad (padNum 4) (padStyleRef r66_42) (pt 0.975, -1.470) (rotation 0))
			(pad (padNum 5) (padStyleRef r47_42) (pt 0.975, 1.565) (rotation 0))
			(pad (padNum 6) (padStyleRef r47_42) (pt 0.325, 1.565) (rotation 0))
			(pad (padNum 7) (padStyleRef r47_42) (pt -0.325, 1.565) (rotation 0))
			(pad (padNum 8) (padStyleRef r47_42) (pt -0.975, 1.565) (rotation 0))
			(pad (padNum 9) (padStyleRef r237_108) (pt 0.000, 0.790) (rotation 90))
			(pad (padNum 10) (padStyleRef r346_57) (pt 0.000, -0.035) (rotation 90))
			(pad (padNum 11) (padStyleRef r237_18) (pt 0.000, -0.410) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0.000, -0.000) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.525 1.525) (pt 1.525 1.525) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.525 1.525) (pt 1.525 -1.525) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.525 -1.525) (pt -1.525 -1.525) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.525 -1.525) (pt -1.525 1.525) (width 0.025))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.73 -2.8) (pt 2.73 -2.8) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.73 -2.8) (pt 2.73 2.8) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.73 2.8) (pt -2.73 2.8) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.73 2.8) (pt -2.73 -2.8) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.975 -2.5) (pt -0.975 -2.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -0.975, -2.45) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.975 -2.4) (pt -0.975 -2.4) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -0.975, -2.45) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.975 -2.5) (pt -0.975 -2.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -0.975, -2.45) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
	)
	(symbolDef "NVTFS5C673NLTAG" (originalName "NVTFS5C673NLTAG")

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
		(pin (pinNum 7) (pt 1000 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 8) (pt 1000 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 9) (pt 1000 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 10) (pt 1000 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 11) (pt 1000 mils -400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -425 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 800 mils 100 mils) (width 6 mils))
		(line (pt 800 mils 100 mils) (pt 800 mils -600 mils) (width 6 mils))
		(line (pt 800 mils -600 mils) (pt 200 mils -600 mils) (width 6 mils))
		(line (pt 200 mils -600 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 850 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 850 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "NVTFS5C673NLTAG" (originalName "NVTFS5C673NLTAG") (compHeader (numPins 11) (numParts 1) (refDesPrefix Q)
		)
		(compPin "1" (pinName "S_1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "S_2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "S_3") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "G") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "5" (pinName "D_1") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "6" (pinName "D_2") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "7" (pinName "D_3") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "8" (pinName "D_4") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "9" (pinName "D_5") (partNum 1) (symPinNum 9) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "10" (pinName "D_6") (partNum 1) (symPinNum 10) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "11" (pinName "D_7") (partNum 1) (symPinNum 11) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "NVTFS5C673NLTAG"))
		(attachedPattern (patternNum 1) (patternName "NVTFS5C673NLTAG")
			(numPads 11)
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
			)
		)
		(attr "Manufacturer_Name" "onsemi")
		(attr "Manufacturer_Part_Number" "NVTFS5C673NLTAG")
		(attr "Mouser Part Number" "863-NVTFS5C673NLTAG")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/NVTFS5C673NLTAG?qs=5aG0NVq1C4w4bkBmZ0y2Ug%3D%3D")
		(attr "Arrow Part Number" "NVTFS5C673NLTAG")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/nvtfs5c673nltag/on-semiconductor")
		(attr "Description" "Trans MOSFET N-CH 60V 13A Automotive 8-Pin WDFN EP T/R")
		(attr "<Hyperlink>" "https://www.onsemi.com/pdf/datasheet/nvtfs5c673nl-d.pdf")
		(attr "<Component Height>" "0.8")
	)

)
