//
//  Player.swift
//  FLIP
//
//  Created by Dan Lindsay on 2016-10-05.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit
import GameplayKit

class Player: NSObject {
    
    static let allPlayers = [Player(stone: .black), Player(stone: .white)]
    
    var stoneColor: StoneColor
    
    init(stone: StoneColor) {
        stoneColor = stone
    }
    
    var opponoent: Player {
        if stoneColor == .black {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
}
