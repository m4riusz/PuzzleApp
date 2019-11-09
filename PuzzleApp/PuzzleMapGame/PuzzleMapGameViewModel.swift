//
//  PuzzleMapGameViewModel.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Combine
import UIKit
import Foundation
import CancelBag

final class PuzzleMapGameViewModel: ObservableObject {
    
    @Published private (set) var preview: Bool = false
    @Published private (set) var puzzleMap: PuzzleMap?
    private let cancelBag = CancelBag()
    
    private let puzzleMapRepository: PuzzleMapRepositoryProtocol
    
    init(puzzleMapRepository: PuzzleMapRepositoryProtocol) {
        self.puzzleMapRepository = puzzleMapRepository
        self.initBindings()
    }
    
    private func initBindings() {
        self.puzzleMapRepository.getSelectedMap()
            .assign(to: \.puzzleMap, on: self)
            .cancel(with: self.cancelBag)
    }
    
    func onPuzzleTap(row: Int,
                     column: Int) {
        guard let mapId = self.puzzleMap?.id else {
            return
        }
        self.puzzleMapRepository.tapOnPuzzle(mapId: mapId,
                                             row: row,
                                             column: column)
    }
    
    func shuffleMap() {
        guard let mapId = self.puzzleMap?.id else {
            return
        }
        self.puzzleMapRepository.shuffleMapWithId(mapId)
    }
    
    func togglePreview() {
        self.preview.toggle()
    }
}
