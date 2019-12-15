//
//  ObjectExtension.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 15/12/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift

extension Object {
    static func build<O: Object>(_ builder: (O) -> () ) -> O {
        let object = O()
        builder(object)
        return object
    }
}
