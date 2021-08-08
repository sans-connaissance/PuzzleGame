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
    
    func createLevel() {
        var itemsToShow = 4 + (level * 4)
        
        // find all nodes that belong to our scene that are not called "Background"
        
        let items = children.filter{$0.name != "background"}
        
        //Shuffle those nodes so they are in a random order
        let shuffled = items.shuffled() as! [SKSpriteNode]
        
        //loop over them
        for item in shuffled {
            //and hide each one
            item.alpha = 0
        }
    }
    
}
