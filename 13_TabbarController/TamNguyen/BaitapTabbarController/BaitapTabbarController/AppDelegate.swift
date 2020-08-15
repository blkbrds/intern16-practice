//
//  AppDelegate.swift
//  BaitapTabbarController
//
//  Created by PCI0001 on 8/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
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
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        changeRootViewController(changeRoot: .login)
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRootViewController(changeRoot: RootType) {
        switch changeRoot {
        case .login:
            window?.rootViewController = LoginViewController()
        default:
            window?.rootViewController = BaseTabBarController()
        }
    }
}

