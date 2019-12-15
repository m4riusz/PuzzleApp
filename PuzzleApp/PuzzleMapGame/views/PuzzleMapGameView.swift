//
//  PuzzleMapGameView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapGameView: View {
    @State var isPresentingList: Bool = false
    @ObservedObject var viewModel: PuzzleMapGameViewModel
    
    var body: some View {
        NavigationView {
            PuzzleMapView(puzzleMap: self.viewModel.puzzleMap,
                          onPuzzleLongPressed: { self.viewModel.togglePreview() },
                          onPuzzleTap: { self.viewModel.onPuzzleTap(row: $0, column: $1) })
                .padding()
                .navigationBarTitle("Play title",
                                    displayMode: .inline)
                .navigationBarItems(trailing: HStack {
                    if self.viewModel.puzzleMap != nil {
                        NavigationBarItem(imageName: "shuffle",
                                          enabled: true) {
                                            self.viewModel.shuffleMap()
                        }
                        NavigationLink(destination: PuzzleMapForm(viewModel:
                            .init(puzzleMapRepository: PuzzleMapRepository(),
                                  operationType: .edit(puzzleMap: self.viewModel.puzzleMap!)))) {
                                    Image(systemName: "square.and.pencil")
                        }
                    }
                    NavigationBarItem(imageName: "list.bullet",
                                      enabled: true) {
                                        self.isPresentingList.toggle()
                    }.sheet(isPresented: self.$isPresentingList) {
                        PuzzleMapListView(isPresentingList: self.$isPresentingList,
                                          viewModel: .init(puzzleMapRepository: PuzzleMapRepository()))
                    }
                })
        }
    }
}

struct PuzzleMapGameView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapGameView(viewModel: .init(puzzleMapRepository: PuzzleMapRepository()))
    }
}
