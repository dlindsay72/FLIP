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
    
    var currentPlayer = Player.allPlayers[0]
    
    var rows = [[StoneColor]]()
    
}
