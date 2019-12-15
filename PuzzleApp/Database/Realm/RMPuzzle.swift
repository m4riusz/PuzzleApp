//
//  RMPuzzle.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 15/12/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

final class RMPuzzle: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var numer: Int = 0
    @objc dynamic var preview: Bool = false
    @objc dynamic var image: Data = Data()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension RMPuzzle: DomainConvertibleType {
    func asDomain() -> Puzzle {
        return .init(id: self.id,
                     numer: self.numer,
                     preview: self.preview,
                     image: UIImage(data: self.image)!
        )
    }
}

extension Puzzle: RealmRepresentable {
    func asRealm() -> RMPuzzle {
        return .build { object in
            object.id = self.id
            object.numer = self.numer
            object.preview = self.preview
            object.image = self.image.pngData()!
        }
    }
}
