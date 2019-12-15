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
    let onPuzzleLongPressed: () -> Void
    let onPuzzleTap: (_ row: Int, _ column: Int) -> Void
    var body: some View {
        VStack {
            if self.puzzleMap != nil {
                ForEach (0..<self.puzzleMap!.numberOfRows, id: \.self) { row in
                    HStack {
                        ForEach (0..<self.puzzleMap!.numberOfColumns, id: \.self) { column in
                            PuzzleView(puzzle: self.puzzleMap!.puzzles[row][column])
                                .onLongPressGesture { self.onPuzzleLongPressed() }
                                .onTapGesture { self.onPuzzleTap(row, column) }
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
        let puzzle0 = Puzzle(id: 0,
                             numer: 0,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle1 = Puzzle(id: 1,
                             numer: 1,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle2 = Puzzle(id: 2,
                             numer: 2,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle3 = Puzzle(id: 3,
                             numer: 3,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle4 = Puzzle(id: 4,
                             numer: 4,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        let puzzle5 = Puzzle(id: 5,
                             numer: 5,
                             preview: true,
                             image: UIImage(named: "AppIcon")!)
        return PuzzleMapView(puzzleMap: .init(id: 1,
                                              selected: true,
                                              name: "Puzzle",
                                              numberOfRows: 3,
                                              numberOfColumns: 2,
                                              image: UIImage(named: "AppIcon"),
                                              puzzles: [[puzzle0, puzzle1],
                                                        [puzzle2, puzzle3],
                                                        [puzzle4, puzzle5]]),
                             onPuzzleLongPressed: {},
                             onPuzzleTap: {_, _ in })
    }
}
