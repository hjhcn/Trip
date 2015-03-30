//
//  Other.swift
//  Trip
//
//  Created by haojunhua on 15/3/25.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation

class Other: NSObject {
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
