//
//  FormSubmitButton.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormSubmitButton: View {
    let text: LocalizedStringKey
    let enabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action,
               label: {
                Text(text)
                    .font(.body)
                    .fontWeight(.semibold)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .center)
        })
            .disabled(!enabled)
            .padding()
    }
}

struct FormSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        FormSubmitButton(text: "Save",
                         enabled: false,
                         action: {})
    }
}
