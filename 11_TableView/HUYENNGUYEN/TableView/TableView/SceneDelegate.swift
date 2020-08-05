//
//  SceneDelegate.swift
//  TableView
//
//  Created by bu on 8/2/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

//        let vc = DisplayListTableViewController()
//        let vc = ListNameTableViewController()
//        let vc = MasterViewController()
//        let vc = Bai04ViewController()
//        let vc = Bai05ViewController()
//        let vc = Bai07ViewController()
//        let vc = Bai08ViewController()
//        let vc = Bai09ViewController()
//        let vc = Bai11ViewController()
        let vc = Bai12ViewController()

        let navi = UINavigationController(rootViewController: vc)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}


