//
//  DomainConvertibleType.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 15/12/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomain() -> DomainType
}
