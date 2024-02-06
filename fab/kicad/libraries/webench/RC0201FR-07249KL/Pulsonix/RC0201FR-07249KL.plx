PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//18527388/877297/2.50/2/3/Resistor

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
	(symbolDef "RC0201FR-07249KL" (originalName "RC0201FR-07249KL")

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
	(compDef "RC0201FR-07249KL" (originalName "RC0201FR-07249KL") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "RC0201FR-07249KL"))
		(attachedPattern (patternNum 1) (patternName "RESC0603X26N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "YAGEO")
		(attr "Manufacturer_Part_Number" "RC0201FR-07249KL")
		(attr "Mouser Part Number" "")
		(attr "Mouser Price/Stock" "")
		(attr "Arrow Part Number" "")
		(attr "Arrow Price/Stock" "")
		(attr "Description" "The resistor is constructed on top of a high-grade ceramic body. Internal metal electrodes are added on each end to make the contacts to the thick film resistive element. The composition of the resistive element is a noble metal imbedded into a glass and covered by a second glass to prevent environmental influences. The resistor is laser trimmed to the rated resistance value. The resistor is covered with a protective epoxy coat, finally the two external terminations")
		(attr "<Hyperlink>" "https://www.mouser.com/datasheet/2/447/PYu-RC_Group_51_RoHS_L_9-1314892.pdf")
		(attr "<Component Height>" "0.26")
		(attr "<STEP Filename>" "RC0201FR-07249KL.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
