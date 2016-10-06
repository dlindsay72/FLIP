//
//  GameScene.swift
//  FLIP
//
//  Created by Dan Lindsay on 2016-10-05.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var rows = [[Stone]]()
    
    var board: Board!
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        
        background.blendMode = .replace
        background.zPosition = 1
        addChild(background)
        
        let gameBoard = SKSpriteNode(imageNamed: "board")
        
        gameBoard.name = "board"
        gameBoard.zPosition = 2
        addChild(gameBoard)
        
        board = Board()
        
        let offsetX = -280
        let offsetY = -281
        let stoneSize = 80
        
        for row in 0..<Board.size {
            var colArray = [Stone]()
            
            for col in 0..<Board.size {
                let stone = Stone(color: UIColor.clear, size: CGSize(width: stoneSize, height: stoneSize))
                
                stone.position = CGPoint(x: offsetX + (col * stoneSize), y: offsetY + (row * stoneSize))
                
                stone.row = row
                stone.col = col
                
                gameBoard.addChild(stone)
                colArray.append(stone)
            }
            
            board.rows.append([StoneColor](repeatElement(.empty, count: Board.size)))
            
            rows.append(colArray)
        }
        
        rows[4][3].setPlayer(.white)
        rows[4][4].setPlayer(.black)
        rows[3][4].setPlayer(.white)
        rows[3][3].setPlayer(.black)
        
        board.rows[4][3] = .white
        board.rows[4][4] = .black
        board.rows[3][4] = .white
        board.rows[3][3] = .black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        guard let touch = touches.first else { return }
        
        guard let gameBoard = childNode(withName: "board") else { return }
        
        let location = touch.location(in: gameBoard)
        
        let nodesAtPoint = nodes(at: location)
        
        let tappedStones = nodesAtPoint.filter { $0 is Stone }
        
        guard tappedStones.count > 0 else { return }
        
        let tappedStone = tappedStones[0] as! Stone
        
        if board.canMoveIn(row: tappedStone.row, col: tappedStone.col) {
            print("Move is legal")
        } else {
            print("Move is illegal")
        }
        
    }
    
}















