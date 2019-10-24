//
//  PuzzleMapFormViewModel.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import CancelBag

enum PuzzleFormOperationType: Equatable {
    case create(puzzleMap: PuzzleMap)
    case edit(puzzleMap: PuzzleMap)
    
    static func == (lhs: PuzzleFormOperationType,
                    rhs: PuzzleFormOperationType) -> Bool {
        switch (lhs, rhs) {
        case let (.create(left), .create(right)):
            return left.id == right.id
        case let (.edit(left), .edit(right)):
            return left.id == right.id
        default:
            return false
        }
    }
    
    func isCreateOption() -> Bool {
        switch self {
        case .create(puzzleMap: _):
            return true
        case .edit(puzzleMap: _):
            return false
        }
    }
}

final class PuzzleMapFormViewModel: ObservableObject {
    @Published var name: String
    @Published var minNumberOfRows: Float
    @Published var numberOfRows: Float
    @Published var maxNumberOfRows: Float
    @Published var minNumberOfColumns: Float
    @Published var numberOfColumns: Float
    @Published var maxNumberOfColumns: Float
    @Published var image: UIImage?
    @Published var isFormValid: Bool = false
    @Published var operationType: PuzzleFormOperationType
    private let cancelBag = CancelBag()
    
    init(operationType: PuzzleFormOperationType) {
        self.operationType = operationType
        switch operationType {
        case .create(let puzzleMap):
            self.name = puzzleMap.name
            self.minNumberOfRows = Float(puzzleMap.minNumerOfRows)
            self.numberOfRows = Float(puzzleMap.numberOfRows)
            self.maxNumberOfRows = Float(puzzleMap.maxNumberOfRows)
            self.minNumberOfColumns = Float(puzzleMap.minNumberOfColumns)
            self.numberOfColumns = Float(puzzleMap.numberOfColumns)
            self.maxNumberOfColumns = Float(puzzleMap.maxNumberOfColumns)
            self.image = puzzleMap.image
        case .edit(let puzzleMap):
            self.name = puzzleMap.name
            self.minNumberOfRows = Float(puzzleMap.minNumerOfRows)
            self.numberOfRows = Float(puzzleMap.numberOfRows)
            self.maxNumberOfRows = Float(puzzleMap.maxNumberOfRows)
            self.minNumberOfColumns = Float(puzzleMap.minNumberOfColumns)
            self.numberOfColumns = Float(puzzleMap.numberOfColumns)
            self.maxNumberOfColumns = Float(puzzleMap.maxNumberOfColumns)
            self.image = puzzleMap.image
        }
        self.initBindings()
    }
    
    private func initBindings() {
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
