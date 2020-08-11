//
//  SceneDelegate.swift
//  baitap12
//
//  Created by NXH on 8/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: sceneWindow)
        window.backgroundColor = .white
        let homeView = Baitap1203ViewController()
        let navi = UINavigationController(rootViewController: homeView)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }
}
