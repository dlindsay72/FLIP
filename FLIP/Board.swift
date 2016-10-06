//
//  Board.swift
//  FLIP
//
//  Created by Dan Lindsay on 2016-10-05.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit

class Board: NSObject {

    static let size = 8
    static let moves = [Move(row: -1, col: -1), Move(row: 0, col: -1), Move(row: 1, col: -1), Move(row: -1, col: 0), Move(row: 1, col: 0), Move(row: -1, col: 1), Move(row: 0, col: 1), Move(row: 1, col: 1)]
    
    var currentPlayer = Player.allPlayers[0]
    
    var rows = [[StoneColor]]()
    
    func canMoveIn(row: Int, col: Int) -> Bool {
        
        if !isInBounds(row: row, col: col) { return false }
        
        let stone = rows[row][col]
        if stone != .empty { return false }
        
        for move in Board.moves {
            var passedOpponent = false
            
            var currentRow = row
            var currentCol = col
            for _ in 0..<Board.size {
                currentRow += move.row
                currentCol += move.col
                
                guard isInBounds(row: currentRow, col: currentCol) else { break }
                
                let stone = rows[currentRow][currentCol]
                
                if (stone == currentPlayer.opponoent.stoneColor) {
                    passedOpponent = true
                } else if stone == currentPlayer.stoneColor && passedOpponent {
                    return true
                } else {
                    break
                }
            }
        }
        return false
    }
    
    func isInBounds(row: Int, col: Int) -> Bool {
        
        if row < 0 { return false }
        if col < 0 { return false }
        if row >= Board.size { return false }
        if col >= Board.size { return false }
        
        return true
    }
    
    func makeMove(player: Player, row: Int, col: Int) -> [Move] {
        var didCapture = [Move]()
        
        rows[row][col] = player.stoneColor
        
        didCapture.append(Move(row: row, col: col))
        
        for move in Board.moves {
            var mightCapture = [Move]()
            var currentRow = row
            var currentCol = col
            
            for _ in 0..<Board.size {
                currentRow += move.row
                currentCol += move.col
                
                guard isInBounds(row: currentRow, col: currentCol) else { break }
                
                let stone = rows[currentRow][currentCol]
                
                if stone == player.opponoent.stoneColor {
                    
                    mightCapture.append(Move(row: currentRow, col: currentCol))
                } else if stone == player.stoneColor {
                    
                    didCapture.append(contentsOf: mightCapture)
                    
                    mightCapture.forEach {
                        rows[$0.row][$0.col] = player.stoneColor
                    }
                    
                    break
                } else {
                    
                    break
                }
            }
        }
        return didCapture
    }
    
}























