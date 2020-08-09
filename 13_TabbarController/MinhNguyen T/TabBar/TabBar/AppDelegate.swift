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
    
    private func configTabbar() {
        let home = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: home)
        homeNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home1"))
        
        let map = MapViewController()
        let mapNavi = UINavigationController(rootViewController: map)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "map1"), selectedImage: #imageLiteral(resourceName: "map"))
        
        let favorit = FavoritViewController()
        let favoritNavi = UINavigationController(rootViewController: favorit)
        favoritNavi.tabBarItem = UITabBarItem(title: "Favorit", image: #imageLiteral(resourceName: "favorite"), selectedImage: #imageLiteral(resourceName: "favorite1"))
        
        let profile = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profile)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile1"))
        
        let viewcontrollers = [homeNavi, mapNavi, favoritNavi, profileNavi]
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = viewcontrollers
        window?.rootViewController = tabbarController
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
            configTabbar()
        }
    }
}
