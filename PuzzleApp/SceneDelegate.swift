//
//  SceneDelegate.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let puzzleSettings = PuzzleSettings(minNumberOfRows: 4,
                                            maxNumberOfRows: 12,
                                            minNumberOfColumns: 4,
                                            maxNumberOfColumns: 12)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: MainTabView(puzzleSettings: puzzleSettings))
        self.window = window
        window.makeKeyAndVisible()
    }
}

