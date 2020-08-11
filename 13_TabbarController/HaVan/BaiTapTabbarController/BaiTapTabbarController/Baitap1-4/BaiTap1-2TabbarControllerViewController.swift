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
        customTabbar()
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
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
    
    private func customTabbar() {
        guard let items = tabBar.items else { return }
        for item in items {
            let unselectedItem = [NSAttributedString.Key.foregroundColor: UIColor.black]
            let selectedItem = [NSAttributedString.Key.foregroundColor: UIColor.white]
            item.setTitleTextAttributes(unselectedItem, for: .normal)
            item.setTitleTextAttributes(selectedItem, for: .selected)
        }
        // set selected background color
        let numberOfItems = CGFloat(items.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(UIColor.lightGray, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets(top: 0.3, left: 0.3, bottom: 0.3, right: 0.3))
    }
}

// MARK: - UIImage Extension
extension UIImage {
    
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        guard let uigraphic = UIGraphicsGetImageFromCurrentImageContext() else {
            return #imageLiteral(resourceName: "home")
        }
        let image: UIImage = uigraphic
        UIGraphicsEndImageContext()
        return image
    }
}
