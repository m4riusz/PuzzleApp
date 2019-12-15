//
//  RMPuzzleMap.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 15/12/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

final class RMPuzzleMap: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var selected: Bool = false
    @objc dynamic var name: String = ""
    @objc dynamic var numberOfRows: Int = 0
    @objc dynamic var numberOfColumns: Int = 0
    @objc dynamic var image: Data?
    var puzzles = List<RMPuzzle>()
}

extension RMPuzzleMap: DomainConvertibleType {
    func asDomain() -> PuzzleMap {
        return .init(id: self.id,
                     selected: self.selected,
                     name: self.name,
                     numberOfRows: self.numberOfRows,
                     numberOfColumns: self.numberOfColumns,
                     image: self.image != nil ? UIImage(data: self.image!) : nil,
                     puzzles: self.puzzles.map { $0.asDomain() }.chunks(self.numberOfColumns)
        )
    }
}

extension PuzzleMap: RealmRepresentable {
    func asRealm() -> RMPuzzleMap {
        return .build { object in
            object.id = self.id
            object.selected = self.selected
            object.name = self.name
            object.numberOfRows = self.numberOfRows
            object.numberOfColumns = self.numberOfColumns
            object.image = self.image?.pngData()
            object.puzzles.append(objectsIn: self.puzzles.reduce([Puzzle](), {$0 + $1}).map { $0.asRealm()})
        }
    }
}
