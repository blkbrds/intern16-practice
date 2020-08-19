//
//  SceneDelegate.swift
//  TabBar
//
//  Created by bu on 8/10/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum Screen {
        case login
        case tabbar
    }
    
    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can not case scene delegate")
        }
        return scene
    }
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        changeRoot(screen: .login)
        window.makeKeyAndVisible()
    }
    
    func changeRoot(screen: Screen) {
        switch screen {
        case .login:
            let loginVC = LoginViewController()
            let loginNC = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = loginNC
        case .tabbar:
            window?.rootViewController = TabbarController()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    
    func sceneDidBecomeActive(_ scene: UIScene) { }
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) { }
    
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
