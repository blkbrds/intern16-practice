//
//  BaiTap1-2TabbarControllerViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/8/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1_2TabbarControllerViewController: UITabBarController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
    }
    
    // MARK: - Private functions
    private func configTabbar() {
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
        setViewControllers([homeNavigationController, mapNavigationController, favoriteNavigationController, profileNavigationController], animated: true)
    }
}
