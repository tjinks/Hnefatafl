//
//  BoardConfig.swift
//  test2
//
//  Created by Tony Jinks on 13/10/2019.
//  Copyright © 2019 Tony Jinks. All rights reserved.
//

import Foundation
import CoreGraphics

struct BoardConfig {
    let numSquares = 11
    let gridLineSize: CGFloat = 1
    var boardSize: CGFloat
    var boardRect: NSRect
    var squareSize: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        boardSize = min(width, height);
        let padTop = 0.5 * (height - boardSize)
        let padLeft = 0.5 * (width - boardSize)
        boardRect = NSRect(x: padLeft, y: padTop, width: boardSize, height: boardSize)
        squareSize = (boardSize - gridLineSize) / CGFloat(numSquares)
    }
}
