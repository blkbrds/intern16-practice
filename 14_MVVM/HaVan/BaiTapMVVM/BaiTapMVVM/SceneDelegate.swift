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
    
    func configTabbar() {
        let newTabbarController = BaiTap1_2TabbarControllerViewController()
        window?.rootViewController = newTabbarController
    }
    
    func configLogin() {
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navigationController
    }
    
    func changeRoot(with user: Bool) {
        let rootType = chooseRootType(with: user)
        switch rootType {
        case .login:
            configLogin()
        case .tabbar:
            configTabbar()
        }
    }
    
    func chooseRootType(with user: Bool) -> RootType {
        if user {
            return .tabbar
        } else {
            return .login
        }
    }
}
