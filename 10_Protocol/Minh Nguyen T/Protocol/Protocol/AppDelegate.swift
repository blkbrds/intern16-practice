//
//  AppDelegate.swift
//  Protocol
//
//  Created by MacBook Pro on 7/24/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = LocationViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }
}
