//
//  PuzzleMapGameViewModelTests.swift
//  PuzzleAppTests
//
//  Created by Mariusz Sut on 13/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
@testable import PuzzleApp
import XCTest

final class PuzzleMapGameViewModelTests: XCTestCase {
    
    func testInit() {
        let mockedPuzzleMapRepository = MockPuzzleMapRepository.build { repo in
            
        }
        
        let viewModel = PuzzleMapFormViewModel(puzzleMapRepository: mockedPuzzleMapRepository,
                                               operationType: .create)
        
        
        let isValidSubscriber = PassthroughSubject<Bool, Never>()
        
    }
}
