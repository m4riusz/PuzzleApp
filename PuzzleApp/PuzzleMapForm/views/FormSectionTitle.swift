//
//  FormSectionTitle.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormSectionTitle: View {
    let text: String
    
    var body: some View {
        Text(LocalizedStringKey(self.text))
            .font(.body)
            .fontWeight(.regular)
    }
}

struct FormSectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionTitle(text: "Some text")
    }
}
