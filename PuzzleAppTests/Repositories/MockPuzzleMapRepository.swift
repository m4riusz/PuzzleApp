//
//  MockPuzzleMapRepository.swift
//  PuzzleAppTests
//
//  Created by Mariusz Sut on 13/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import UIKit
import Combine
@testable import PuzzleApp

struct MockPuzzleMapRepository: PuzzleMapRepositoryProtocol {
    fileprivate var mockedGetPuzzleMapSettings: AnyPublisher<PuzzleSettings, Never>!
    fileprivate var mockedGetSelectedMap: AnyPublisher<PuzzleMap?, Never>!
    fileprivate var mockedGetAllMaps: AnyPublisher<[PuzzleMap], Never>!
    
    func selectMapById(_ mapId: Int) {
    }
    
    func shuffleMapWithId(_ mapId: Int) {
    }
    
    func tapOnPuzzle(mapId: Int, row: Int, column: Int) {
    }
    
    func createMap(name: String, rows: Int, columns: Int, image: UIImage) {
    }
    
    func updateMapById(_ mapId: Int, name: String, rows: Int, columns: Int, image: UIImage) {
    }
    
    func deleteMapById(_ mapId: Int) {
    }
    
    func getPuzzleMapSettings() -> AnyPublisher<PuzzleSettings, Never> {
        return self.mockedGetPuzzleMapSettings
    }
    
    func getSelectedMap() -> AnyPublisher<PuzzleMap?, Never> {
        return self.mockedGetSelectedMap
    }
    
    func getAllMaps() -> AnyPublisher<[PuzzleMap], Never> {
        return self.mockedGetAllMaps
    }
}

extension MockPuzzleMapRepository {
    static func build(build: (_ repo: inout MockPuzzleMapRepository) -> Void) -> PuzzleMapRepositoryProtocol {
        var repository = MockPuzzleMapRepository()
        build(&repository)
        return repository
    }
}

