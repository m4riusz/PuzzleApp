//
//  SectionTitle.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct SectionTitle: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.regular)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(text: "Some text")
    }
}
