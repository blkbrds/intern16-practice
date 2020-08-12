//
//  AppDelegate.swift
//  TabBar
//
//  Created by MacBook Pro on 8/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
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
        configLogin()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }

    private func configLogin() {
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navigationController
    }

    func changeRoot(rootType: RootType) {
        switch rootType {
        case .login:
            configLogin()
        case .tabbar:
            window?.rootViewController = BaseViewController()
        }
    }
}
