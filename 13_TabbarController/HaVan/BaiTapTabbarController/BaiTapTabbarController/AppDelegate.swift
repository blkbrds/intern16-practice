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
        configLogin()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
    
    func configTabbar() {
        // Home Navigation Controller
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "homeFilled"))
        // Map Navigation Controller
        let mapNavigationController = UINavigationController(rootViewController: MapViewController())
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "map"), selectedImage: #imageLiteral(resourceName: "mapFilled"))
        // Favorite Navigation Controller
        let favoriteNavigationController = UINavigationController(rootViewController: FavoriteViewController())
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "favorite"), selectedImage: #imageLiteral(resourceName: "favoriteFilled"))
        // Profile Navigation Controller
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profileFilled"))
        // Config Tabbar controller
        let tabbarController = UITabBarController()
        let viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController, profileNavigationController]
        tabbarController.viewControllers = viewControllers
        window?.rootViewController = tabbarController
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
