//
//  FormImagePickerView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormImagePickerView: View {
    let text: LocalizedStringKey
    let action: () -> Void
    @Binding var image: UIImage?
    
    var body: some View {
        VStack {
            if self.image != nil {
                Image(uiImage: self.image!)
                    .resizable()
                    .scaledToFit()
                    .clipped()
            }
            Button(action: self.action,
                   label: {
                    VStack {
                        if self.image == nil {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                        }
                        Text(self.text)
                            .font(.body)
                            .fontWeight(.semibold)
                        
                    }.frame(minWidth: 16,
                            maxWidth: .infinity,
                            alignment: .center)
            })
                .padding([.top], 5)
        }
        .padding([.top,.bottom], 10)
    }
}

struct FormImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        FormImagePickerView(text: "Save",
                            action: {},
                            image: .constant(nil))
    }
}
