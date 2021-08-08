//
//  GSECreateGrid.swift
//  PuzzleGame
//
//  Created by David Malicke on 8/8/21.
//

import Foundation
import SpriteKit

extension GameScene {
    
    
    func createGrid() {
        
        let xOffset = -440
        let yOffset = -280
        var imageNumber = 0
        
        for row in 0 ..< 8 {
            imageNumber = imageNumber + 1
            for col in 0 ..< 12 {
                let item = SKSpriteNode(imageNamed: "\(imageNumber)")
                item.position = CGPoint(x: xOffset + (col * 80), y: yOffset + (row * 80))
                addChild(item)
            }
        }
        
        
        
    }
    
    
    
}
