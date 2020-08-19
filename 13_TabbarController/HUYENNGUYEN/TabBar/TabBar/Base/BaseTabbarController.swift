//
//  BaseTabbarController.swift
//  TabBar
//
//  Created by bu on 8/13/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {
    
    static weak var shared: BaseTabbarController?
    
    private var homeNavigationController = UINavigationController(rootViewController: HomeViewController())
    private var mapNavigationController = UINavigationController(rootViewController: MapViewController())
    private var favoritesNavigationController = UINavigationController(rootViewController: FavoritesViewController())
    private var profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabbarController.shared = self
        configViewController()
    }
    private func configViewController() {
        //config tab Home
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-plus "), tag: 0)
        homeNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-plus-selected ")
        
        //config tab Map
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map "), tag: 1)
        mapNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-map-selected ")
        
        //config tab Favorite
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-favorite "), tag: 3)
        favoritesNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-favorite-selected ")
        
        //config tab Profile
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile "), tag: 4)
        profileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-profile-selected ")
        
        //config tab bar controller
        setViewControllers([homeNavigationController, mapNavigationController, favoritesNavigationController, profileNavigationController], animated: true)
    }
}
