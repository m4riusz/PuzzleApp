//
//  PuzzleMapGameView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapGameView: View {
    let puzzleSettings: PuzzleSettings
    @ObservedObject var viewModel: PuzzleMapGameViewModel
    
    var body: some View {
        PuzzleMapView(puzzleMap: self.viewModel.puzzleMap,
                      onPuzzleLongPressed: { self.viewModel.togglePreview() },
                      onPuzzleTap: { self.viewModel.onPuzzleTap(row: $0, column: $1) })
            .padding()
            .navigationBarTitle("Play title",
                                displayMode: .inline)
            .navigationBarItems(leading: HStack {
                NavigationBarItem(imageName: "list.bullet",
                                  enabled: self.viewModel.puzzleMap != nil) {
                                    
                }
                }, trailing: HStack {
                    NavigationBarItem(imageName: "shuffle",
                                      enabled: self.viewModel.puzzleMap != nil) {
                                        self.viewModel.shuffleMap()
                    }
                    NavigationBarItem(imageName: "square.and.pencil",
                                      enabled: self.viewModel.puzzleMap != nil) {
                                        
                    }
                    NavigationLink(destination: PuzzleMapForm(puzzleMapFormViewModel:
                        .init(puzzleSettings: self.puzzleSettings,
                              operationType: .create(puzzleMap: .fromSettings(self.puzzleSettings))))) {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .padding(5)
                    }
            })
    }
}

struct PuzzleMapGameView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapGameView(puzzleSettings: .init(minNumberOfRows: 4,
                                                maxNumberOfRows: 10,
                                                minNumberOfColumns: 4,
                                                maxNumberOfColumns: 10),
                          viewModel: .init(puzzleMapRepository: PuzzleMapRepository()))
    }
}