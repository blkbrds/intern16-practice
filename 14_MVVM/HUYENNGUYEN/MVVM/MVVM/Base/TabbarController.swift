//
//  TabbarController.swift
//  MVVM
//
//  Created by bu on 8/25/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController {
    // MARK: - Enum
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
                return #imageLiteral(resourceName: "ic-home ")
            case .map:
                return #imageLiteral(resourceName: "ic-map ")
            case .favorites:
                return #imageLiteral(resourceName: "ic-favorite")
            case .profile:
                return #imageLiteral(resourceName: "ic-profile ")
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .home:
                return #imageLiteral(resourceName: "ic-home-selected")
            case .map:
                return #imageLiteral(resourceName: "ic-map-selected ")
            case .favorites:
                return #imageLiteral(resourceName: "ic-favorite-selected ")
            case .profile:
                return #imageLiteral(resourceName: "ic-profile-selected ")
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
    
    // MARK: - Properties
    private lazy var homeNC: UINavigationController = { return createTab(for: .home) }()
    private lazy var mapNC: UINavigationController = { return createTab(for: .map) }()
    private lazy var favoritesNC: UINavigationController = { return createTab(for: .favorites) }()
    private lazy var profileNC: UINavigationController = { return createTab(for: .profile) }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([homeNC, mapNC, favoritesNC, profileNC], animated: true)
    }

    // MARK: - Function
    private func createTab(for type: TabType) -> UINavigationController {
        let nc: UINavigationController = type.navigationController
        let tabBarItem: UITabBarItem = UITabBarItem(title: type.title, image: type.image, selectedImage: type.selectedImage)
        tabBarItem.tag = type.rawValue
        nc.tabBarItem = tabBarItem
        return nc
    }
}
