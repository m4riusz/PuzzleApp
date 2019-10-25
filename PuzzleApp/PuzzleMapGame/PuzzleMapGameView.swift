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
        PuzzleMapView(puzzleMap: self.viewModel.puzzleMap)
            .padding()
            .navigationBarItems(trailing: HStack {
                NavigationBarItem(imageName: self.viewModel.preview ? "eye.slash" : "eye",
                                  enabled: self.viewModel.puzzleMap != nil) {
                                    self.viewModel.togglePreview()
                }
                NavigationBarItem(imageName: "gobackward",
                                  enabled: self.viewModel.puzzleMap != nil) {
                                    self.viewModel.shuffleMap()
                }
                NavigationBarItem(imageName: "square.and.pencil",
                                  enabled: self.viewModel.puzzleMap != nil) {
                                    
                }
                NavigationLink(destination: PuzzleMapForm(puzzleMapFormViewModel:
                    PuzzleMapFormViewModel(puzzleSettings: self.puzzleSettings,
                                           operationType: .create(puzzleMap: PuzzleMap.fromSettings(self.puzzleSettings))))) {
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .padding(5)
                }
            })
    }
}

struct PuzzleMapGameView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapGameView(puzzleSettings: PuzzleSettings(minNumberOfRows: 4,
                                                         maxNumberOfRows: 10,
                                                         minNumberOfColumns: 4,
                                                         maxNumberOfColumns: 10),
                          viewModel: PuzzleMapGameViewModel())
    }
}
