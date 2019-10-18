//
//  BoardView.swift
//  test2
//
//  Created by Tony Jinks on 13/10/2019.
//  Copyright © 2019 Tony Jinks. All rights reserved.
//

import Foundation
import CoreGraphics
import Cocoa


class BoardView : NSView
{
    let boardColor = CGColor(red: 0.5, green: 0.3, blue: 0, alpha: 1)
    let lineColor = CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    var boardConfig = BoardConfig(width: 0, height: 0)
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var acceptsFirstResponder: Bool {
        get {true}
    }
    
    override func mouseUp(with event: NSEvent) {
        if event.type == .leftMouseUp {
            let lw = event.locationInWindow
            let converted = self.convert(lw, from: nil)
            let px = converted.x - boardConfig.boardRect.origin.x
            let py = converted.y - boardConfig.boardRect.origin.y
            if (px >= 0 && px < boardConfig.boardSize) {
                if (py >= 0 && py < boardConfig.boardSize) {
                    let lx = px / boardConfig.squareSize
                    let ly = py / boardConfig.squareSize
                    let x = Int(lx)
                    let y = Int(ly)
                    print("(\(x), \(y))")
                }
            }
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let ctx = NSGraphicsContext.current?.cgContext else {
            return
        }
        
        ctx.saveGState()
        ctx.setFillColor(boardColor);
        let w = bounds.width
        let h = bounds.height
        boardConfig = BoardConfig(width: w, height: h)
        ctx.translateBy(x: boardConfig.boardRect.origin.x, y: boardConfig.boardRect.origin.y)
        ctx.fill(CGRect(x: 0, y: 0, width: boardConfig.boardSize, height: boardConfig.boardSize))
        drawGridLines(ctx)
        ctx.restoreGState()
    }
    
    private func drawGridLines(_ ctx: CGContext) {
        ctx.setLineWidth(boardConfig.gridLineSize)
        ctx.setStrokeColor(lineColor)
        for i in 0...boardConfig.numSquares - 1 {
            let y = CGFloat(i) * boardConfig.squareSize
            ctx.move(to: CGPoint(x: 0, y: y))
            ctx.addLine(to: CGPoint(x: boardConfig.boardSize, y: y))
            ctx.strokePath();
        }
        
        for i in 0...boardConfig.numSquares - 1 {
            let x = CGFloat(i) * boardConfig.squareSize
            ctx.move(to: CGPoint(x: x, y: 0))
            ctx.addLine(to: CGPoint(x: x, y: boardConfig.boardSize))
            ctx.strokePath();
        }
        
        ctx.move(to: CGPoint(x: 0, y: boardConfig.boardSize))
        ctx.addLine(to: CGPoint(x: boardConfig.boardSize, y: boardConfig.boardSize))
        ctx.strokePath();
        
        ctx.move(to: CGPoint(x: boardConfig.boardSize, y: 0))
        ctx.addLine(to: CGPoint(x: boardConfig.boardSize, y: boardConfig.boardSize))
        ctx.strokePath();
    }
}
