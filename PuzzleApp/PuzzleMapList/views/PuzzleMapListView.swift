//
//  PuzzleMapListView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 09/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI
import Combine

struct PuzzleMapListView: View {
    @Binding var isPresentingList: Bool
    @State var operationType: PuzzleFormOperationType?
    @ObservedObject var viewModel: PuzzleMapListViewModel
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach (self.viewModel.puzzleMaps, id: \.id) { puzzleMap in
                    PuzzleMapListItemView(puzzleMap: puzzleMap)
                        .onTapGesture { self.viewModel.selectMap(puzzleMap) }
                }
                .onDelete { self.viewModel.deleteMap(self.viewModel.puzzleMaps[$0.first!]) }
            }
            .navigationBarTitle("Available maps", displayMode: .inline)
            .navigationBarItems(trailing: HStack {
                NavigationLink(destination: PuzzleMapForm(viewModel:
                    .init(puzzleMapRepository: PuzzleMapRepository(),
                          operationType: .create))) {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding(5)
                }
            })
        }
        
    }
}

struct PuzzleMapListView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapListView(isPresentingList: .constant(true),
                          viewModel: .init(puzzleMapRepository: PuzzleMapRepository()))
    }
}
