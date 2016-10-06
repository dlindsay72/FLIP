//
//  Move.swift
//  FLIP
//
//  Created by Dan Lindsay on 2016-10-06.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit
import GameplayKit

class Move: NSObject {
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
}
