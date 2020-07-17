//
//  SceneDelegate.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/5/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = BaiTap1ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
