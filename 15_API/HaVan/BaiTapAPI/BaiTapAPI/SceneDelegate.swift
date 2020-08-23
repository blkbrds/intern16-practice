//
//  SceneDelegate.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        let audioBookViewController = AudioBookViewController()
        window?.rootViewController = UINavigationController(rootViewController: audioBookViewController)
        window?.makeKeyAndVisible()
    }
}

