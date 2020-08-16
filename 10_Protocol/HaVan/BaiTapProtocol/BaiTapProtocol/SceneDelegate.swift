//
//  SceneDelegate.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
//         let navigationController = UINavigationController(rootViewController: BaiTap4ViewController())
//         window.rootViewController = navigationController
        window.rootViewController = BaiTap5ViewController()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }
}
