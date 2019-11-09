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
    @State var text: String = ""
    @ObservedObject var viewModel: PuzzleMapListViewModel
    
    var body: some View {
        List {
            ForEach (self.viewModel.puzzleMaps, id: \.id) { puzzleMap in
                PuzzleMapListItemView(puzzleMap: puzzleMap)
                    .onTapGesture { self.viewModel.selectMap(puzzleMap) }
            }
            .onDelete { self.viewModel.deleteMap(self.viewModel.puzzleMaps[$0.first!]) }
        }
    }
}

struct PuzzleMapListView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapListView(viewModel: .init(puzzleMapRepository: PuzzleMapRepository()))
    }
}
