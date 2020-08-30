//
//  TabbarController.swift
//  MVVM
//
//  Created by bu on 8/25/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController {
    
    enum TabType: Int {
        case home = 0, map, favorites, profile
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .map:
                return "Map"
            case .favorites:
                return "Favorite"
            case .profile:
                return "Profile"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .home:
                return UIImage(named: "ic-home")?.withRenderingMode(.alwaysOriginal)
            case .map:
                return UIImage(named: "ic-map")?.withRenderingMode(.alwaysOriginal)
            case .favorites:
                return UIImage(named: "ic-favorite")?.withRenderingMode(.alwaysOriginal)
            case .profile:
                return UIImage(named: "ic-profile")?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .home:
                return UIImage(named: "ic-home-selected")?.withRenderingMode(.alwaysOriginal)
            case .map:
                return UIImage(named: "ic-map-selected")?.withRenderingMode(.alwaysOriginal)
            case .favorites:
                return UIImage(named: "ic-favorite-selected")?.withRenderingMode(.alwaysOriginal)
            case .profile:
                return UIImage(named: "ic-profile-selected")?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        var navigationController: UINavigationController {
            switch self {
            case .home:
                return UINavigationController(rootViewController: HomeViewController())
            case .map:
                return UINavigationController(rootViewController: MapViewController())
            case .favorites:
                return UINavigationController(rootViewController: FavoritesViewController())
            case .profile:
                return UINavigationController(rootViewController: ProfileViewController())
            }
        }
    }
    private lazy var homeNC: UINavigationController = { return createTab(for: .home) }()
    private lazy var mapNC: UINavigationController = { return createTab(for: .map) }()
    private lazy var favoritesNC: UINavigationController = { return createTab(for: .favorites) }()
    private lazy var profileNC: UINavigationController = { return createTab(for: .profile) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([homeNC, mapNC, favoritesNC, profileNC], animated: true)
    }

    private func createTab(for type: TabType) -> UINavigationController {
        let nc: UINavigationController = type.navigationController
        let tabBarItem: UITabBarItem = UITabBarItem(title: type.title, image: type.image, selectedImage: type.selectedImage)
        tabBarItem.tag = type.rawValue
        nc.tabBarItem = tabBarItem
        return nc
    }
    
    private func openTab(type: TabType) {
        selectedIndex = type.rawValue
    }
}
