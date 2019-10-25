//
//  TabViewItem.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct TabViewItem: View {
    let title: LocalizedStringKey
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: self.imageName)
                .font(.headline)
            Text(self.title)
                .fontWeight(.medium)
                .font(.headline)
        }
        .padding(10)
    }
}

struct TabViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TabViewItem(title: "Play",
                    imageName: "play.circle")
    }
}
