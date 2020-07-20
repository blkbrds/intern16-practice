//
//  SceneDelegate.swift
//  Auto Layout
//
//  Created by bu on 7/13/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = Bai11ViewController()
//        window.rootViewController = Bai12ViewController()
        window.rootViewController = Bai13ViewController()

//        window.rootViewController = Bai10ViewController()
//        window.rootViewController = Bai09ViewController()
//        window.rootViewController = Bai05phay2ViewController()
//        window.rootViewController = Bai06phay4ViewController()

        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

