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
}
