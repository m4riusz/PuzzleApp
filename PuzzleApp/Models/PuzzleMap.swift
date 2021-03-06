//
//  PuzzleMap.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import UIKit

struct PuzzleMap {
    let id: Int
    let selected: Bool
    let name: String
    let numberOfRows: Int
    let numberOfColumns: Int
    let image: UIImage?
    let puzzles: [[Puzzle]]
    
    static func fromSettings(_ puzzleSettings: PuzzleSettings) -> PuzzleMap {
        .init(id: 0,
              selected: false,
              name: "",
              numberOfRows: puzzleSettings.minNumberOfRows,
              numberOfColumns: puzzleSettings.minNumberOfColumns,
              image: nil,
              puzzles: [])
    }
}
