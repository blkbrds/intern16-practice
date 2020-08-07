//
//  SceneDelegate.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/6/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windownScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windownScene)
        self.window = window
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
        window.rootViewController = tabbarController
        window.backgroundColor = .white 
        window.makeKeyAndVisible()
    }
}

