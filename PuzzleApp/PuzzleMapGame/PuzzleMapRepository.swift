//
//  PuzzleMapRepository.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 09/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol PuzzleMapRepositoryProtocol {
    func selectMapById(_ mapId: Int)
    func shuffleMapWithId(_ mapId: Int)
    func tapOnPuzzle(mapId: Int,
                     row: Int,
                     column: Int)
    func deleteMapById(_ mapId: Int)
    func getSelectedMap() -> AnyPublisher<PuzzleMap?, Never>
    func getAllMaps() -> AnyPublisher<[PuzzleMap], Never>
}

struct PuzzleMapRepository: PuzzleMapRepositoryProtocol {
    
    func selectMapById(_ id: Int) {
        
    }
    
    func shuffleMapWithId(_ id: Int) {
        
    }
    
    func tapOnPuzzle(mapId: Int, row: Int, column: Int) {
        
    }
    
    func deleteMapById(_ mapId: Int) {
        
    }
    
    func getSelectedMap() -> AnyPublisher<PuzzleMap?, Never> {
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
        let puzzleMap = PuzzleMap(id: 1,
                                  selected: true,
                                  name: "Puzzle",
                                  numberOfRows: 3,
                                  numberOfColumns: 2,
                                  image: UIImage(named: "AppIcon"),
                                  puzzles: [[puzzle0, puzzle1],
                                            [puzzle2, puzzle3],
                                            [puzzle4, puzzle5]])
        return Just(puzzleMap).eraseToAnyPublisher()
    }
    
    
    func getAllMaps() -> AnyPublisher<[PuzzleMap], Never> {
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
        let puzzleMap1 = PuzzleMap(id: 1,
                                   selected: true,
                                   name: "Puzzle 1",
                                   numberOfRows: 3,
                                   numberOfColumns: 2,
                                   image: UIImage(named: "AppIcon"),
                                   puzzles: [[puzzle0, puzzle1],
                                             [puzzle2, puzzle3],
                                             [puzzle4, puzzle5]])
        let puzzleMap2 = PuzzleMap(id: 2,
                                   selected: false,
                                   name: "Puzzle 2",
                                   numberOfRows: 2,
                                   numberOfColumns: 3,
                                   image: UIImage(named: "AppIcon"),
                                   puzzles: [[puzzle0, puzzle1, puzzle2],
                                             [puzzle5, puzzle4, puzzle3]])
        let puzzleMap3 = PuzzleMap(id: 3,
                                   selected: false,
                                   name: "Puzzle 3",
                                   numberOfRows: 3,
                                   numberOfColumns: 3,
                                   image: UIImage(named: "AppIcon"),
                                   puzzles: [[puzzle0, puzzle1, puzzle2],
                                             [puzzle4, puzzle5, puzzle1],
                                             [puzzle2, puzzle3, puzzle4]])
        
        return Just([puzzleMap1, puzzleMap2, puzzleMap3]).eraseToAnyPublisher()
    }
}
