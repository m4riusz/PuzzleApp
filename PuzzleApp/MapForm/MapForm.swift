//
//  MapForm.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct MapForm: View {
    @State private var name: String = "Tim"
    @State private var minSpan: Float = 4
    @State private var maxSpan: Float = 10
    @State private var numberOfRows: Float = 1
    @State private var numberOfColumns: Float = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: SectionTitle(text: "Name")) {
                    TextField("", text: $name)
                }
                Section(header: SectionTitle(text: "Number of rows")) {
                    SliderView(minValue: $minSpan,
                               maxValue: $maxSpan,
                               currentValue: $numberOfRows)
                }
                Section(header: SectionTitle(text: "Number of columns")) {
                    SliderView(minValue: $minSpan,
                               maxValue: $maxSpan,
                               currentValue: $numberOfColumns)
                }
                Section(header: SectionTitle(text: "Image")) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                        Text("Pick")
                        
                    })
                        .scaledToFill()
                        .frame(minWidth: 40,
                               maxWidth: .infinity,
                               minHeight: 60,
                               idealHeight: 80,
                               maxHeight: 120,
                               alignment: .center)
                }
                Section {
                    Button(action: {
                        print("register account")
                    }) {
                        Text("OK")
                    }
                }
            }
            .navigationBarTitle(Text("Add form"))
        }
    }
}

struct MapForm_Previews: PreviewProvider {
    static var previews: some View {
        MapForm()
    }
}
