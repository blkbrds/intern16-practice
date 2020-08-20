//
//  BaseTabbarController.swift
//  TabBar
//
//  Created by bu on 8/13/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController {
    
    //MARK: - Properties
    private let homeNC = UINavigationController(rootViewController: HomeViewController())
    private let mapNC = UINavigationController(rootViewController: MapViewController())
    private let favoritesNC = UINavigationController(rootViewController: FavoritesViewController())
    private let profileNC = UINavigationController(rootViewController: ProfileViewController())
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
    }
    
    //MARK: - Function
    private func configViewController() {
        //config tab Home
        homeNC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-plus "), tag: 0)
        homeNC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-plus-selected ")
        
        //config tab Map
        mapNC.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map "), tag: 1)
        mapNC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-map-selected ")
        
        //config tab Favorite
        favoritesNC.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-favorite "), tag: 3)
        favoritesNC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-favorite-selected ")
        
        //config tab Profile
        profileNC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile "), tag: 4)
        profileNC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-profile-selected ")
        
        //config tab bar controller
        setViewControllers([homeNC, mapNC, favoritesNC, profileNC], animated: true)
    }
}
