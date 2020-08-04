//
//  AppDelegate.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = BaiTap2ViewController()
        let nani = UINavigationController(rootViewController: vc)
        window?.rootViewController = nani
        window?.makeKeyAndVisible()
        return true
    }
}
