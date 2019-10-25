//
//  PuzzleMapView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapView: View {
    let puzzleMap: PuzzleMap?
    var body: some View {
        VStack {
            if self.puzzleMap != nil {
                ForEach (0..<self.puzzleMap!.numberOfRows, id: \.self) { row in
                    HStack {
                        ForEach (0..<self.puzzleMap!.numberOfColumns, id: \.self) { column in
                            PuzzleView(puzzle:
                                self.puzzleMap!.puzzles[row][column])
                        }
                    }
                }
            } else {
                Text("Map not selected")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct PuzzleMapView_Previews: PreviewProvider {
    static var previews: some View {
        let puzzle0 = Puzzle(numer: 0,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle1 = Puzzle(numer: 1,
                             preview: true,
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
        return PuzzleMapView(puzzleMap: PuzzleMap(id: 1,
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
                                                            [puzzle4, puzzle5]]))
    }
}
