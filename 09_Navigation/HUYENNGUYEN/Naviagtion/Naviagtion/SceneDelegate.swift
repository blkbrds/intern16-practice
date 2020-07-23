//
//  SceneDelegate.swift
//  Naviagtion
//
//  Created by bu on 7/21/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
//        let AViewController = Bai01ViewController()
//        let AViewController = LoginViewController()
//        let AViewController = ProfileViewController()
//        let AViewController = Bai4ViewController()
//        let AViewController = Phan2ViewController()
//        let AViewController = Phan3ViewController()
//        let AViewController = Phan4ViewController()
        let AViewController = Phan5ViewController()
        
        let naviagtionController = UINavigationController(rootViewController: AViewController)
        window.rootViewController = naviagtionController
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}
