//
//  FormButton.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormButton: View {
    let text: LocalizedStringKey
    let color: UIColor
    let enabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action,
               label: {
                Text(self.text)
                    .font(.body)
                    .fontWeight(.semibold)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .center)
        })
            .accentColor(Color(self.color))
            .disabled(!self.enabled)
            .padding()
    }
}

struct FormButton_Previews: PreviewProvider {
    static var previews: some View {
        FormButton(text: "Save",
                   color: .red,
                   enabled: false,
                   action: {})
    }
}
