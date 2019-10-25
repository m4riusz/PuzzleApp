//
//  PuzzleMapGameViewModel.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Combine
import UIKit
import Foundation

final class PuzzleMapGameViewModel: ObservableObject {
    
    @Published private (set) var preview: Bool = false
    @Published private (set) var puzzleMap: PuzzleMap?
    
    init() {
        let puzzle0 = Puzzle(numer: 0,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle1 = Puzzle(numer: 1,
                             preview: false,
                             image: UIImage(named: "AppIcon")!)
        let puzzle2 = Puzzle(numer: 2,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle3 = Puzzle(numer: 3,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle4 = Puzzle(numer: 4,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle5 = Puzzle(numer: 5,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        self.puzzleMap = PuzzleMap(id: 1,
                                   name: "Puzzle",
                                   minNumerOfRows: 1,
                                   numberOfRows: 3,
                                   maxNumberOfRows: 2,
                                   minNumberOfColumns: 1,
                                   numberOfColumns: 2,
                                   maxNumberOfColumns: 2,
                                   image: UIImage(named: "AppIcon"),
                                   puzzles: [[puzzle0, puzzle1],
                                             [puzzle2, puzzle3],
                                             [puzzle4, puzzle5]])
    }
    
    func shuffleMap() {
        guard let map = self.puzzleMap else {
            return
        }
        let joinedElements = map.puzzles.reduce([Puzzle](), { $0 + $1 })
        let mixed = joinedElements.shuffled().chunks(map.numberOfColumns)
        self.puzzleMap = PuzzleMap(id: map.id,
                                   name: map.name,
                                   minNumerOfRows: map.minNumerOfRows,
                                   numberOfRows: map.numberOfRows,
                                   maxNumberOfRows: map.maxNumberOfRows,
                                   minNumberOfColumns: map.minNumberOfColumns,
                                   numberOfColumns: map.numberOfColumns,
                                   maxNumberOfColumns: map.maxNumberOfColumns,
                                   image: map.image,
                                   puzzles: mixed)
    }
    
    func togglePreview() {
        self.preview.toggle()
    }
}
