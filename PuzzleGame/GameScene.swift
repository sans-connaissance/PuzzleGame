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
    let scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
    var score = 0 {
        didSet {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    var startTime = 0.0
    var timeLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
    var isGameRunning = true
    
    override func didMove(to view: SKView) {
       
        //added music here because it exists throughout.. not a one off use like the SKAction calls in correct and wrong answer functions
        let background = SKSpriteNode(imageNamed: "background-pattern")
        background.name = "background"
        background.zPosition = -1
        addChild(background)
        
        scoreLabel.position = CGPoint(x: -480, y: 330)
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.zPosition = 1
        background.addChild(scoreLabel)
        
        timeLabel.position = CGPoint(x: 480, y: 330)
        timeLabel.horizontalAlignmentMode = .right
        timeLabel.zPosition = 1
        background.addChild(timeLabel)
        
        createGrid()
        createLevel()
        
        score = 0
        let music = SKAudioNode(fileNamed: "truth-in-the-stones")
        background.addChild(music)

    }
    
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard isGameRunning else { return }

        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        
        guard let tapped = tappedNodes.first else { return }
        
        
        //Pretty cool how you are using the assigned names to drive logic and behavior.
        if tapped.name == "correct" {
            correctAnswer(node: tapped)
            score += 1
        } else if tapped.name == "wrong" {
            wrongAnswer(node: tapped)
            score -= 1
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
        if isGameRunning {
            if startTime == 0 {
                startTime = currentTime
            }
            
            let timePassed = currentTime - startTime
            let remainingTime = Int(ceil(10 - timePassed))
            timeLabel.text = "TIME: \(remainingTime)"
            timeLabel.alpha = 1
            
            if remainingTime <= 0 {
                isGameRunning = false
                let gameOver = SKSpriteNode(imageNamed: "gameOver1")
                gameOver.zPosition = 100
                addChild(gameOver)
            }
            
        } else {
            timeLabel.alpha = 0
        }
        
    }
    
}
