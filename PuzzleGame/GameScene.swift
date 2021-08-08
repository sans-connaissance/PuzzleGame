//
//  GameScene.swift
//  PuzzleGame
//
//  Created by David Malicke on 8/8/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var level = 1
    
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background-pattern")
        background.name = "background"
        background.zPosition = -1
        addChild(background)
        
        createGrid()
        createLevel()

    }
    
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        
        guard let tapped = tappedNodes.first else { return }
        
        if tapped.name == "correct" {
            print("Correct!")
        } else if tapped.name == "wrong" {
            print("Wrong!")
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
     
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
