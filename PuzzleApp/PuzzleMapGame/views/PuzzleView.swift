//
//  PuzzleView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleView: View {
    let puzzle: Puzzle
    var body: some View {
        ZStack {
            if self.puzzle.preview {
                Text("\(self.puzzle.numer)")
                    .font(.title)
                    .fontWeight(.bold)
            } else {
                Image(uiImage: self.puzzle.image)
                    .resizable()
                    .clipped()
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemBlue), lineWidth: 1)
        )
        
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(puzzle: .init(id: 0,
                                 numer: 1,
                                 preview: false,
                                 image: UIImage(named: "AppIcon")!))
    }
}
