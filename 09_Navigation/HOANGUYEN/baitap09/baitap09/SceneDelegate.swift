//
//  SceneDelegate.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        let homeViewController = AViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
