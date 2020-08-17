//
//  AppDelegate.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/12/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        return shared
    }()

    var window: UIWindow?

    enum RootType {
        case login
        case tabbar
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //changeRoot(rootType: .login)
        window?.rootViewController = DetailViewController()
        return true
    }

    func changeRoot(rootType: RootType) {
        switch rootType {
        case .login:
            let vc = LoginViewController()
            window?.rootViewController = vc
        case .tabbar:
            let vc = BaseTabBarController()
            window?.rootViewController = vc
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
