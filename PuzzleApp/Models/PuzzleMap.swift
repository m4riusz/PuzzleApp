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
    let name: String
    let minNumerOfRows: Int
    let numberOfRows: Int
    let maxNumberOfRows: Int
    let minNumberOfColumns: Int
    let numberOfColumns: Int
    let maxNumberOfColumns: Int
    let image: UIImage?
    let puzzles: [Puzzle]
}
