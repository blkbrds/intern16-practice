//
//  SceneDelegate.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/14/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windownScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windownScene)
        //window?.rootViewController =
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
