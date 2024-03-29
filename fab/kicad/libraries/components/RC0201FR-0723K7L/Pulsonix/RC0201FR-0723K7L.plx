PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//16188737/877297/2.50/2/3/Resistor

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r62.5_40"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.4) (shapeHeight 0.625))
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
	(patternDef "RESC0603X26N" (originalName "RESC0603X26N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r62.5_40) (pt -0.412, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r62.5_40) (pt 0.412, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -0.975 0.45) (pt 0.975 0.45) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 0.975 0.45) (pt 0.975 -0.45) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 0.975 -0.45) (pt -0.975 -0.45) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -0.975 -0.45) (pt -0.975 0.45) (width 0.05))
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
	(symbolDef "RC0201FR-0723K7L" (originalName "RC0201FR-0723K7L")

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
	(compDef "RC0201FR-0723K7L" (originalName "RC0201FR-0723K7L") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "RC0201FR-0723K7L"))
		(attachedPattern (patternNum 1) (patternName "RESC0603X26N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "YAGEO")
		(attr "Manufacturer_Part_Number" "RC0201FR-0723K7L")
		(attr "Mouser Part Number" "603-RC0201FR-0723K7L")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/YAGEO/RC0201FR-0723K7L?qs=Q4gDqC5t5%2FAQco3wz1Gmbw%3D%3D")
		(attr "Arrow Part Number" "RC0201FR-0723K7L")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/rc0201fr-0723k7l/yageo?region=nac")
		(attr "Description" "Res Thick Film 0201 23.7K Ohm 1% 0.05W(1/20W) +/-200ppm/C Epoxy Pad SMD T/R")
		(attr "<Hyperlink>" "https://www.mouser.in/datasheet/2/447/PYu_RC_Group_51_RoHS_L_11-1984063.pdf")
		(attr "<Component Height>" "0.26")
		(attr "<STEP Filename>" "RC0201FR-0723K7L.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
