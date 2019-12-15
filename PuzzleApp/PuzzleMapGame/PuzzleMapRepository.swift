//
//  PuzzleMapRepository.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 09/11/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Combine
import UIKit
import RealmSwift

protocol PuzzleMapRepositoryProtocol {
    func selectMapById(_ mapId: Int)
    func shuffleMapWithId(_ mapId: Int)
    func tapOnPuzzle(mapId: Int,
                     row: Int,
                     column: Int)
    func createMap(name: String,
                   numberOfRows: Int,
                   numberOfColumns: Int,
                   image: UIImage)
    func updateMapById(_ mapId: Int,
                       name: String,
                       rows: Int,
                       columns: Int,
                       image: UIImage)
    func deleteMapById(_ mapId: Int)
    func getPuzzleMapSettings() -> AnyPublisher<PuzzleSettings, Never>
    func getSelectedMap() -> AnyPublisher<PuzzleMap?, Never>
    func getAllMaps() -> AnyPublisher<[PuzzleMap], Never>
}

struct PuzzleMapRepository: PuzzleMapRepositoryProtocol {
    
    func selectMapById(_ id: Int) {
        let realm = try! Realm()
        realm.beginWrite()
        realm.objects(RMPuzzleMap.self)
            .forEach { $0.selected = $0.id == id }
        try! realm.commitWrite()
    }
    
    func shuffleMapWithId(_ id: Int) {
        let realm = try! Realm()
        guard let map = realm.object(ofType: RMPuzzleMap.self, forPrimaryKey: id) else {
            return
        }
        realm.beginWrite()
        map.puzzles.shuffle()
        try! realm.commitWrite()
    }
    
    func tapOnPuzzle(mapId: Int, row: Int, column: Int) {
        
    }
    
    func createMap(name: String,
                   numberOfRows: Int,
                   numberOfColumns: Int,
                   image: UIImage) {
        let realm = try! Realm()
        let nextMapId = (realm
            .objects(RMPuzzleMap.self)
            .max(ofProperty: "id") ?? 0) + 1
        let nextPuzzleId = (realm
            .objects(RMPuzzle.self)
            .max(ofProperty: "id") ?? 0) + 1
        
        let size = image.size
        let imageWidth = size.width / CGFloat(numberOfColumns)
        let imageHeight = size.height / CGFloat(numberOfRows)
        let scale = image.scale
        
        var puzzles: [[Puzzle]] = []
        for rowIndex in 0..<numberOfRows {
            puzzles.append([])
            for columnIndex in 0..<numberOfColumns {
                let rect = CGRect(x: imageWidth * CGFloat(columnIndex) * scale,
                                  y: imageHeight * CGFloat(rowIndex) * scale,
                                  width: imageWidth * scale,
                                  height: imageHeight * scale)
                let puzzleNumber = rowIndex * numberOfRows + columnIndex
                puzzles[rowIndex].append(Puzzle(id: nextPuzzleId + puzzleNumber,
                                                numer: puzzleNumber,
                                                preview: false,
                                                image: UIImage(cgImage: image.cgImage!.cropping(to: rect)!)))
            }
            
        }
        
        let puzzleMap = PuzzleMap(id: nextMapId,
                                  selected: false,
                                  name: name,
                                  numberOfRows: numberOfRows,
                                  numberOfColumns: numberOfColumns,
                                  image: image,
                                  puzzles: puzzles)
        realm.beginWrite()
        realm.add(puzzleMap.asRealm(), update: .all)
        try! realm.commitWrite()
        
    }
    
    func updateMapById(_ mapId: Int,
                       name: String,
                       rows: Int,
                       columns: Int,
                       image: UIImage) {
        
    }
    
    func deleteMapById(_ mapId: Int) {
        let realm = try! Realm()
        guard let object = realm.object(ofType: RMPuzzleMap.self, forPrimaryKey: mapId) else {
            return
        }
        realm.beginWrite()
        realm.delete(object)
        try! realm.commitWrite()
    }
    
    func getPuzzleMapSettings() -> AnyPublisher<PuzzleSettings, Never> {
        return Just(.init(minNumberOfRows: 4,
                          maxNumberOfRows: 12,
                          minNumberOfColumns: 4,
                          maxNumberOfColumns: 12))
            .eraseToAnyPublisher()
    }
    
    func getSelectedMap() -> AnyPublisher<PuzzleMap?, Never> {
        let realm = try! Realm()
        
        let objects = realm.objects(RMPuzzleMap.self)
            .filter(NSPredicate(format: "selected = %@", NSNumber(booleanLiteral: true)))
        return objects
            .objectWillChange
            .map { $0.first?.asDomain() }
            .eraseToAnyPublisher()
            
    }
    
    
    func getAllMaps() -> AnyPublisher<[PuzzleMap], Never> {
        let realm = try! Realm()
        let objects = realm.objects(RMPuzzleMap.self)
        
        return objects
        .objectWillChange
        .print("MAP ITEMS")
            .flatMap { result -> Just<[PuzzleMap]> in
                
                return Just(result.map { $0.asDomain() })
        }
    .eraseToAnyPublisher()
    }
}
