//
//  PuzzleMapListViewModel.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 09/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
import CancelBag

final class PuzzleMapListViewModel: ObservableObject {
    
    @Published private (set) var puzzleMaps: [PuzzleMap] = []
    private let puzzleMapRepository: PuzzleMapRepositoryProtocol
    private let cancelBag = CancelBag()
    
    init(puzzleMapRepository: PuzzleMapRepositoryProtocol) {
        self.puzzleMapRepository = puzzleMapRepository
        self.initBindings()
    }
    
    private func initBindings() {
        self.puzzleMapRepository.getAllMaps()
            .assign(to: \.puzzleMaps, on: self)
            .cancel(with: self.cancelBag)
    }
    
    func selectMap(_ map: PuzzleMap) {
        self.puzzleMapRepository.selectMapById(map.id)
    }
    
    func deleteMap(_ map: PuzzleMap) {
        self.puzzleMapRepository.deleteMapById(map.id)
    }
}
