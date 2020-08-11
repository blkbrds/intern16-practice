//
//  SceneDelegate.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        let homeViewController = Baitap1005ViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
