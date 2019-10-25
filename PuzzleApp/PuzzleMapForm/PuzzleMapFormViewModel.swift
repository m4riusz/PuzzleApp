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
    @Published var numberOfRows: Int
    @Published var numberOfColumns: Int
    @Published var image: UIImage?
    @Published var isFormValid: Bool = false
    @Published var operationType: PuzzleFormOperationType
    let puzzleSettings: PuzzleSettings
    private let cancelBag = CancelBag()
    
    init(puzzleSettings: PuzzleSettings,
         operationType: PuzzleFormOperationType) {
        self.puzzleSettings = puzzleSettings
        self.operationType = operationType
        switch operationType {
        case .create(let puzzleMap):
            self.name = puzzleMap.name
            self.numberOfRows = puzzleMap.numberOfRows
            self.numberOfColumns = puzzleMap.numberOfColumns
            self.image = puzzleMap.image
        case .edit(let puzzleMap):
            self.name = puzzleMap.name
            self.numberOfRows = puzzleMap.numberOfRows
            self.numberOfColumns = puzzleMap.numberOfColumns
            self.image = puzzleMap.image
        }
        self.initBindings()
    }
    
    private func initBindings() {
        Publishers.CombineLatest4(self.$name,
                                  self.$numberOfRows,
                                  self.$numberOfColumns,
                                  self.$image)
            .map { [unowned self] name, rows, columns, image in
                return !name.isEmpty &&
                    self.puzzleSettings.minNumberOfRows...self.puzzleSettings.maxNumberOfRows ~= rows &&
                    self.puzzleSettings.minNumberOfColumns...self.puzzleSettings.maxNumberOfColumns ~= columns &&
                    image != nil
        }
        .assign(to: \.isFormValid, on: self)
        .cancel(with: self.cancelBag)
    }
}
