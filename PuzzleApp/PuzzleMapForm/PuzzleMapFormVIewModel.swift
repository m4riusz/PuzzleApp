//
//  PuzzleMapFormVIewModel.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import CancelBag

final class PuzzleMapFormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var minNumberOfRows: Float = 4
    @Published var numberOfRows: Float = 4
    @Published var maxNumberOfRows: Float = 10
    @Published var minNumberOfColumns: Float = 4
    @Published var numberOfColumns: Float = 4
    @Published var maxNumberOfColumns: Float = 10
    @Published var image: UIImage?
    @Published var isFormValid: Bool = false
    private let cancelBag = CancelBag()
    
    init() {
        let numberOfRowsPubliser = Publishers.CombineLatest3(self.$minNumberOfRows,
                                                             self.$maxNumberOfRows,
                                                             self.$numberOfRows)
        let numberOfColumnsPubliser = Publishers.CombineLatest3(self.$minNumberOfColumns,
                                                                self.$maxNumberOfColumns,
                                                                self.$numberOfColumns)
        Publishers.CombineLatest4(self.$name,
                                  numberOfRowsPubliser,
                                  numberOfColumnsPubliser,
                                  self.$image)
            .map { name, rowConfig, columnConfig, image in
                return !name.isEmpty &&
                    rowConfig.0...rowConfig.1 ~= rowConfig.2 &&
                    columnConfig.0...columnConfig.1 ~= columnConfig.2 &&
                    image != nil
        }
        .assign(to: \.isFormValid, on: self)
        .cancel(with: self.cancelBag)
    }
}
