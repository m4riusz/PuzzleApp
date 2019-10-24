//
//  MainView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        PuzzleMapForm(puzzleMapFormViewModel: PuzzleMapFormViewModel())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
