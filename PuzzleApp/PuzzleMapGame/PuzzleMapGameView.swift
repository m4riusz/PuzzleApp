//
//  PuzzleMapGameView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapGameView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            .navigationBarItems(trailing: HStack {
                NavigationBarItem(imageName: "gobackward",
                                  enabled: true) {
                                    
                }
                NavigationBarItem(imageName: "square.and.pencil",
                                  enabled: false) {
                                    
                }
                NavigationBarItem(imageName: "plus",
                                  enabled: true) {
                                    
                }
            })
    }
}

struct PuzzleMapGameView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapGameView()
    }
}
