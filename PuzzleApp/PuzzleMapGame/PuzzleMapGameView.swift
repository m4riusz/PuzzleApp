//
//  PuzzleMapGameView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapGameView: View {
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
                NavigationBarItem(imageName: "plus",
                                  enabled: true) {
                                    
                }
            })
    }
}

struct PuzzleMapGameView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapGameView(viewModel: PuzzleMapGameViewModel())
    }
}
