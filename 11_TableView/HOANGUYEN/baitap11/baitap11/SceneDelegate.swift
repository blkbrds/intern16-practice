//
//  SceneDelegate.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: sceneWindow)
        window.backgroundColor = .white
        let homeView = Baitap1112ViewController()
        let navigationController = UINavigationController(rootViewController: homeView)
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

