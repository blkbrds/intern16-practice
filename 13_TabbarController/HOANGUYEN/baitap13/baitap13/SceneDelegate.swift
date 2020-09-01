//
//  SceneDelegate.swift
//  baitap13
//
//  Created by NXH on 8/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum rootType {
        case navi
        case tabbar
    }

    static let shared: SceneDelegate = {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError()
        }
        return shared
    }()
    
    var window: UIWindow?
    var navi: BaseNavigationController = BaseNavigationController(rootViewController: LoginViewController())
    let tabbar: BaseTabbarController = BaseTabbarController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        // config root view when open App
        if UserDefaults.standard.value(forKey: "user") == nil {
            window.rootViewController = navi
        } else {
            window.rootViewController = tabbar
        }
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func changeRoot(rootType: rootType) {
        switch rootType {
        case .navi:
            window?.rootViewController = navi
        default:
            tabbar.selectedIndex = 0
            window?.rootViewController = tabbar
        }
    }
}
