//
//  MainTabView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedItem = 0
    
    var body: some View {
        TabView(selection: self.$selectedItem) {
            NavigationView {
                PuzzleMapGameView(viewModel: PuzzleMapGameViewModel())
                    .navigationBarTitle("Play title")
            }.tabItem {
                TabViewItem(title: "Play",
                            imageName: self.selectedItem == 0 ? "play.circle.fill" : "play.circle")
            }
            .tag(0)
            NavigationView  {
                AboutView()
                    .navigationBarTitle("About title")
            }.tabItem {
                TabViewItem(title: "About",
                            imageName: self.selectedItem == 1 ? "info.circle.fill" : "info.circle")
            }
            .tag(1)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
