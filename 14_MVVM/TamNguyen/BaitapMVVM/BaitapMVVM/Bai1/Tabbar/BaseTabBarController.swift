//
//  BaseTabBarController.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/12/20.
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
        configViewController()
        customTabbar()
    }
    
    // MARK: - Private methods
    private func configViewController() {
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-home-32.png"), tag: 0)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icons8-map-marker-50.png"), tag: 1)
        favoritesNavi.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "icons8-heart-50.png"), tag: 2)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "icons8-user-menu-female-50.png"), tag: 3)
        
        setViewControllers([homeNavi, mapNavi, favoritesNavi, profileNavi], animated: true)
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .magenta
        tabBar.layer.cornerRadius = 10
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.black.cgColor
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
            return #imageLiteral(resourceName: "icons8-star-50.png")
        }
        let image: UIImage = uigraphic
        UIGraphicsEndImageContext()
        return image
    }
}
