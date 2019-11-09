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
    case create
    case edit(puzzleMap: PuzzleMap)
    
    static func == (lhs: PuzzleFormOperationType,
                    rhs: PuzzleFormOperationType) -> Bool {
        switch (lhs, rhs) {
        case (.create, .create):
            return true
        case let (.edit(left), .edit(right)):
            return left.id == right.id
        default:
            return false
        }
    }
    
    func isCreateOption() -> Bool {
        switch self {
        case .create:
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
    @Published private (set) var isFormValid: Bool = false
    @Published private (set) var operationType: PuzzleFormOperationType
    @Published private (set) var maxNumberOfColumns: Int = 0
    @Published private (set) var maxNumberOfRows: Int = 0
    @Published private (set) var minNumberOfColumns: Int = 0
    @Published private (set) var minNumberOfRows: Int = 0
    private let puzzleMapRepository: PuzzleMapRepositoryProtocol
    private let cancelBag = CancelBag()
    
    init(puzzleMapRepository: PuzzleMapRepositoryProtocol,
         operationType: PuzzleFormOperationType) {
        self.puzzleMapRepository = puzzleMapRepository
        self.operationType = operationType
        switch operationType {
        case .create:
            self.name = ""
            self.numberOfRows = 0
            self.numberOfColumns = 0
            self.image = nil
        case .edit(let puzzleMap):
            self.name = puzzleMap.name
            self.numberOfRows = puzzleMap.numberOfRows
            self.numberOfColumns = puzzleMap.numberOfColumns
            self.image = puzzleMap.image
        }
        self.initBindings()
    }
    
    func updateOrCreate() {
        guard self.isFormValid else {
            return
        }
        guard case let .edit(map) = self.operationType else {
            self.puzzleMapRepository.createMap(name: self.name,
                                               rows: self.numberOfRows,
                                               columns: self.numberOfColumns,
                                               image: self.image!)
            return
        }
        self.puzzleMapRepository.updateMapById(map.id,
                                               name: self.name,
                                               rows: self.numberOfRows,
                                               columns: self.numberOfColumns,
                                               image: self.image!)
    }
    
    func delete() {
        guard case let .edit(map) = self.operationType else {
            return
        }
        self.puzzleMapRepository.deleteMapById(map.id)
    }
    
    private func initBindings() {
        self.initFormValidBindings()
        self.initRowsBindings()
        self.initColumnsBindings()
    }
    
    private func initFormValidBindings() {
        let rowsAndColumnsValid = Publishers.CombineLatest3(self.puzzleMapRepository.getPuzzleMapSettings(),
                                                            self.$numberOfRows,
                                                            self.$numberOfColumns)
            .map { settings, rows, columns in
                return settings.minNumberOfRows...settings.maxNumberOfRows ~= rows &&
                    settings.minNumberOfColumns...settings.maxNumberOfColumns ~= columns
        }
        Publishers.CombineLatest3(self.$name,
                                  rowsAndColumnsValid,
                                  self.$image)
            .map { name, rowsAndColumnsValid, image in
                return !name.isEmpty && rowsAndColumnsValid && image != nil
        }
        .assign(to: \.isFormValid, on: self)
        .cancel(with: self.cancelBag)
    }
    
    private func initRowsBindings() {
        self.puzzleMapRepository.getPuzzleMapSettings()
            .map { $0.minNumberOfRows }
            .assign(to: \.minNumberOfRows, on: self)
            .cancel(with: self.cancelBag)
        
        self.puzzleMapRepository.getPuzzleMapSettings()
            .map { $0.maxNumberOfRows }
            .assign(to: \.maxNumberOfRows, on: self)
            .cancel(with: self.cancelBag)
        
        Publishers.CombineLatest3(self.$minNumberOfRows,
                                  self.$numberOfRows,
                                  self.$maxNumberOfRows)
            .map { min, current, max in
                guard min <= current else {
                    return min
                }
                guard max >= current else {
                    return max
                }
                return current
        }
        .assign(to: \.numberOfRows, on: self)
        .cancel(with: self.cancelBag)
    }
    
    private func initColumnsBindings() {
        self.puzzleMapRepository.getPuzzleMapSettings()
            .map { $0.minNumberOfColumns }
            .assign(to: \.minNumberOfColumns, on: self)
            .cancel(with: self.cancelBag)
        
        self.puzzleMapRepository.getPuzzleMapSettings()
            .map { $0.maxNumberOfColumns }
            .assign(to: \.maxNumberOfColumns, on: self)
            .cancel(with: self.cancelBag)
        
        Publishers.CombineLatest3(self.$minNumberOfColumns,
                                  self.$numberOfColumns,
                                  self.$maxNumberOfColumns)
            .map { min, current, max in
                guard min <= current else {
                    return min
                }
                guard max >= current else {
                    return max
                }
                return current
        }
        .assign(to: \.numberOfColumns, on: self)
        .cancel(with: self.cancelBag)
    }
}
