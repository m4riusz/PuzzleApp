//
//  NavigationBarItem.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct NavigationBarItem: View {
    let imageName: String
    let enabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action,
               label: {
                Image(systemName: self.imageName)
                    .font(.title)
        })
            .padding(5)
            .disabled(!self.enabled)
    }
}

struct NavigationBarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarItem(imageName: "plus",
                          enabled: true,
                          action: {})
    }
}
