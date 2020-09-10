//
//  MainTabbarController.swift
//  TabbarController
//
//  Created by Abcd on 8/11/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor =   UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        setupTabbar()
    }
    func setupTabbar() {
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.tabBarItem.image = UIImage(named: "home_b")
        homeController.tabBarItem.selectedImage  = UIImage(named: "home_w")
        
        let mapController = UINavigationController(rootViewController: MapViewController())
        mapController.tabBarItem.image = UIImage(named: "map_b")
        mapController.tabBarItem.selectedImage = UIImage(named: "map_w")
        
        let profileController = UINavigationController(rootViewController: ProfileViewController())
        profileController.tabBarItem.image = UIImage(named: "profile_b")
        profileController.tabBarItem.selectedImage = UIImage(named: "profile_w")
        
        let favoriteController = UINavigationController(rootViewController: FavoriteViewController())
        favoriteController.tabBarItem.image = UIImage(named: "favorite_b")
        favoriteController.tabBarItem.selectedImage = UIImage(named: "favorite_w")
        
        setViewControllers([homeController, mapController, profileController, favoriteController], animated: true)
    }
    
    func setupUI() {}
    
    func setupData() {}
}
