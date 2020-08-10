//
//  BaseTabBarController.swift
//  BaitapTabbarController
//
//  Created by PCI0001 on 8/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    
    // MARK: - Properties
    private var homeNavi = UINavigationController(rootViewController: HomeViewController())
    private var mapNavi = UINavigationController(rootViewController: MapViewController())
    private var favoritesNavi = UINavigationController(rootViewController: FavoritesViewController())
    private var profileNavi = UINavigationController(rootViewController: ProfileViewController())
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        configViewController()
    }
    
    // MARK: - Private methods
    private func configTabBar() {
        tabBar.tintColor = .red

        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .brown
        tabBar.standardAppearance = appearance
        
    }

    private func configViewController() {
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-home-32.png"), tag: 0)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icons8-map-marker-50.png"), tag: 1)
        mapNavi.tabBarItem.badgeValue = "9"
        favoritesNavi.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "icons8-heart-50.png"), tag: 2)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "icons8-user-menu-female-50.png"), tag: 3)
        
        setViewControllers([homeNavi, mapNavi, favoritesNavi, profileNavi], animated: true)
    }
}
