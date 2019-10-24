//
//  FormSliderView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormSliderView: View {
    @Binding var minValue: Float
    @Binding var maxValue: Float
    @Binding var currentValue: Float
    
    var body: some View {
        VStack {
            Slider(value: $currentValue,
                   in: minValue...maxValue,
                   step: 1,
                   onEditingChanged: { r in },
                   minimumValueLabel: Text("\(Int(minValue))")
                    .font(.body),
                   maximumValueLabel: Text("\(Int(maxValue))")
                    .font(.body)) {
                        Text("")
            }
            .padding([.top], 5)
            Text("\(Int(currentValue))")
                .font(.callout)
                .fontWeight(.light)
        }
    }
}

struct FormSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FormSliderView(minValue: Binding<Float>.constant(4),
                       maxValue: Binding<Float>.constant(10),
                       currentValue: Binding<Float>.constant(5))
    }
}
