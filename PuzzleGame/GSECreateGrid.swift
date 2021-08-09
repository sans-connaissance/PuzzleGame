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

        for row in 0 ..< 8 {
            for col in 0 ..< 12 {
                let item = SKSpriteNode(imageNamed: "1")
                item.position = CGPoint(x: xOffset + (col * 80), y: yOffset + (row * 80))
                addChild(item)
            }
        }
    }
    
    func createLevel() {
        var itemsToShow = 4 + (level * 4)
        
        // find all nodes that belong to our scene that are not called "Background"
        //This is the trick!!
        let items = children.filter{$0.name != "background"}
        
        //Shuffle those nodes so they are in a random order
        let shuffled = items.shuffled() as! [SKSpriteNode]
        
        //loop over them
        for item in shuffled {
            //and hide each one
            item.alpha = 0
        }
        
       // figure out the hightest number we're going to show
        let highest = Int.random(in: 5...15)
        var others = [Int]()
        
        // generate lots of numbers lower than that
        for _ in 1 ..< itemsToShow {
            let num = Int.random(in: 0 ..< highest)
            others.append(num)
        }
        
        for (index, number) in others.enumerated() {
            //pull out one of the random balls
            let item = shuffled[index]
            
            //give it the correct texture for its new number
            item.texture = SKTexture(imageNamed: String(number))
            
            // show it immediately
            item.alpha = 1
            item.name = "wrong"

        }
        
        shuffled.last?.texture = SKTexture(imageNamed: String(highest))
        shuffled.last?.alpha = 1
        shuffled.last?.name = "correct"
        
    }
    
    func correctAnswer(node: SKNode) {
        let fade = SKAction.fadeOut(withDuration: 0.5)
        
        for child in children {
            guard child.name == "wrong" else { continue }
            child.run(fade)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.level += 1
            self.createLevel()
        }
        
        let scaleUP = SKAction.scale(to: 2, duration: 0.5)
        let scaleDown = SKAction.scaleY(to: 1, duration: 0.5)
        let sequence = SKAction.sequence([scaleUP, scaleDown])
        node.run(sequence)
        
    }
    
    
}
