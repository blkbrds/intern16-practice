//
//  AppDelegate.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

 enum RootType {
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
        changeRoot(rootType: .tabbar)
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRoot(rootType: RootType) {
         switch rootType {
         case .tabbar:
             window?.rootViewController = BaseViewController()
         }
     }
}
