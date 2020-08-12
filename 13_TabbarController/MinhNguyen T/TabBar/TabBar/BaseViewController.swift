//
//  BaseViewController.swift
//  TabBar
//
//  Created by MacBook Pro on 8/10/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaseViewController: UITabBarController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbarCTL()
        configTabBar()
        cofigUiTabbar()
    }
    
    // MARK: - Private functions
    private func cofigUiTabbar() {
        for i in 0...tabBar.items!.count {
            guard let tabbar = tabBar.items else { return }
            switch i {
            case 0:
                tabbar[0].title = "Home"
                tabbar[0].image = UIImage(named: "home")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabbar[0].selectedImage = UIImage(named: "home1")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            case 1:
                tabbar[1].title = "Map"
                tabbar[1].image = UIImage(named: "map1")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabbar[1].selectedImage = UIImage(named: "map")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            case 2:
                tabbar[2].title = "Camera"
                tabbar[2].image = UIImage(named: "camera")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabbar[2].selectedImage = UIImage(named: "camera1")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            case 3:
                tabbar[3].title = "Favorit"
                tabbar[3].image = UIImage(named: "favorite")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabbar[3].selectedImage = UIImage(named: "favorite1")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            case 4:
                tabbar[4].title = "Profile"
                tabbar[4].image = UIImage(named: "profile")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabbar[4].selectedImage = UIImage(named: "profile1")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            default:
                break
            }
        }
    }
    
    private func configTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tabBar.standardAppearance = appearance
        
    }
    
    private func configTabbarCTL() {
        let home = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: home)
        homeNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        homeNavi.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "home"), tag: 0)
        let mapNavi = UINavigationController(rootViewController: MapViewController())
        let favoritNavi = UINavigationController(rootViewController: FavoritViewController())
        let profileNavi = UINavigationController(rootViewController: ProfileViewController())
        let cameraNavi = UINavigationController(rootViewController: CameraViewController())
        setViewControllers([homeNavi,mapNavi,cameraNavi,favoritNavi,profileNavi], animated: true)
    }
}

