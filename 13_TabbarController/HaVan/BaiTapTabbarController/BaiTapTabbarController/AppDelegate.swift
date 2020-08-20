//
//  AppDelegate.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/6/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

enum RootType {
    case login
    case tabbar
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let stateUser: Bool =  UserDefaults.standard.bool(forKey: "state")
        let root: RootType = stateUser ? .tabbar : .login
        changeRoot(rootType: root)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
    
    func configTabbar() {
        let newTabbarController = BaiTap1_2TabbarControllerViewController()
        window?.rootViewController = newTabbarController
    }
    
    func configLogin() {
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navigationController
    }
    
    func changeRoot(rootType: RootType) {
        switch rootType {
        case .login:
            configLogin()
        case .tabbar:
            configTabbar()
        }
    }
}
