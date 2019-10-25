//
//  FormSliderView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct FormSliderView: View {
    @Binding var minValue: Int
    @Binding var maxValue: Int
    @Binding var currentValue: Int
    
    var body: some View {
        VStack {
            Slider(value: self.$currentValue.double,
                   in: self.minValue.double...self.maxValue.double,
                   step: 1,
                   minimumValueLabel: Text("\(self.minValue)")
                    .font(.body),
                   maximumValueLabel: Text("\(self.maxValue)")
                    .font(.body)) {
                        Text("")
            }
            .padding([.top], 5)
            Text("\(self.currentValue)")
                .font(.callout)
                .fontWeight(.light)
        }
    }
}

struct FormSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FormSliderView(minValue: .constant(4),
                       maxValue: .constant(10),
                       currentValue: .constant(5))
    }
}
