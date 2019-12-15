//
//  RealmRepresentable.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 15/12/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertibleType
    
    var id: Int { get }
    
    func asRealm() -> RealmType
}
