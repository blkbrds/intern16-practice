//
//  AppDelegate.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

enum RootType {
    case tabbar
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
//        let navi = UINavigationController(rootViewController: SearchViewController())
//        window?.rootViewController = navi
        changeRoot(rootType: .tabbar)
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRoot(rootType: RootType) {
        switch rootType {
        case .tabbar:
            let homeNavigationController = UINavigationController(rootViewController: BaiTap1ViewController())
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home1"))
           
            let searchNavi = UINavigationController(rootViewController: SearchViewController())
            searchNavi.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: #imageLiteral(resourceName: "search"))
            let tabbarController = UITabBarController()
            let viewControllers = [homeNavigationController,searchNavi ]
            tabbarController.viewControllers = viewControllers
            window?.rootViewController = tabbarController
        }
    }
}
