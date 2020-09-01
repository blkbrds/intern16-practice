//
//  BaseTabbarController.swift
//  baitap13
//
//  Created by NXH on 8/7/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class BaseTabbarController: UITabBarController {

    // MARK: - properties
    private var homeNavi: UINavigationController = UINavigationController(rootViewController: Home01ViewController())
    private var mapNavi: UINavigationController = UINavigationController(rootViewController: MapViewController())
    private var favoritesNavi: UINavigationController = UINavigationController(rootViewController: FavoritesViewController())
    private var profileNavi: UINavigationController = UINavigationController(rootViewController: ProfileViewController())
    private var value = 0
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
        advanceCustomTabbar()
    }
    
    // MARK: - private func
    private func configTabbar() {
        let tabbarItems: [UIViewController] = [homeNavi, mapNavi, favoritesNavi, profileNavi]
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-50"), selectedImage: UIImage(named: "icons8-home-select-50")?.withRenderingMode(.alwaysOriginal))
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "icons8-map-50"), selectedImage: UIImage(named: "icons8-map-select-50")?.withRenderingMode(.alwaysOriginal))
        favoritesNavi.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "icons8-heart-50"), selectedImage: UIImage(named: "icons8-heart-select-50")?.withRenderingMode(.alwaysOriginal))
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "icons8-profile-50"), selectedImage: UIImage(named: "icons8-profile-select-50")?.withRenderingMode(.alwaysOriginal))
        viewControllers = tabbarItems
    }
    
    private func advanceCustomTabbar() {
        tabBar.barTintColor = .yellow
        tabBar.isTranslucent = false
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .blue
    }
}

// MARK: -extension: UITabBarControllerDelegate
extension BaseTabbarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         let bounceAnimation: CAKeyframeAnimation = {
            let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
            bounceAnimation.values = [1.2, 1.4, 1.6, 1.8, 2.0, 1.8, 1.6, 1.4, 1.2]
            bounceAnimation.duration = TimeInterval(0.4)
            return bounceAnimation
           }()
        guard let index = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > index + 1, let imageView = tabBar.subviews[index + 1].subviews.compactMap({ $0 as? UIImageView }).first else {
                   return
               }
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
}
