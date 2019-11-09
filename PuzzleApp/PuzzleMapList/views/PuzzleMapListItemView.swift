//
//  PuzzleMapListItemView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 09/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapListItemView: View {
    
    let puzzleMap: PuzzleMap
    
    var body: some View {
        HStack {
            VStack {
                Image(uiImage: self.puzzleMap.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 40)
                Text("\(self.puzzleMap.numberOfRows)x\(self.puzzleMap.numberOfColumns)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding([.bottom], 5)
            }
            .frame(maxHeight: .infinity)
            .padding([.leading,.trailing], 10)
            HStack {
                Text(self.puzzleMap.name)
                    .font(.body)
                    .lineLimit(2)
                Spacer()
            }
            
            if (self.puzzleMap.selected) {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
                    .font(.body)
                    .padding([.leading, .trailing], 10)
            }
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct PuzzleMapListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapListItemView(puzzleMap: .init(id: 1,
                                               selected: true,
                                               name: "Name 1",
                                               numberOfRows: 3,
                                               numberOfColumns: 4,
                                               image: UIImage(named: "AppIcon"),
                                               puzzles: []))
    }
}
