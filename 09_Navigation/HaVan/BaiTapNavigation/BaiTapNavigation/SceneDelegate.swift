//
//  SceneDelegate.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        //Bài 1
        //let navigationController = UINavigationController(rootViewController: ViewControllerA())
        //Bài 2
//        let navigationController = UINavigationController(rootViewController: LoginViewController())
        //Bai 3
//        let navigationController = UINavigationController(rootViewController: BaiTap3HomeViewController())
       //Baif tap 4-2
        let navigationController = UINavigationController(rootViewController: BaiTap4_1ViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

