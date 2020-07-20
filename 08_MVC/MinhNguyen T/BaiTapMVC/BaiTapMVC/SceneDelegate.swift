//
//  SceneDelegate.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = HomeViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
