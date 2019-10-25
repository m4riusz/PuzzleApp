//
//  IntExtension.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 25/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

extension Int {
    var double: Double {
        get { Double(self) }
        set { self = Int(newValue) }
    }
}
