//
//  MainView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        PuzzleMapForm(puzzleMapFormViewModel:
            PuzzleMapFormViewModel(operationType:
                .create(puzzleMap: PuzzleMap(id: 1,
                                             name: "AA",
                                             minNumerOfRows: 4,
                                             numberOfRows: 5,
                                             maxNumberOfRows: 10,
                                             minNumberOfColumns: 4,
                                             numberOfColumns: 7,
                                             maxNumberOfColumns: 10,
                                             image: nil,
                                             puzzles: [])
                )
            )
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
