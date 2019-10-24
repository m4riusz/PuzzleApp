//
//  PuzzleMap.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct PuzzleMap {
    let id: Int
    let name: String
    let numberOfRows: Int
    let numberOfColumns: Int
    let puzzles: [Puzzle]
}
