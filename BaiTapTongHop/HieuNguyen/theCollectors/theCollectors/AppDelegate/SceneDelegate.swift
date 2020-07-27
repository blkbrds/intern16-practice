//
//  SceneDelegate.swift
//  theCollectors
//
//  Created by hieungq on 7/27/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        goToTabBar()
        window.makeKeyAndVisible()
    }
    
    private func goToTabBar() {
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "photo"), tag: 0)
        
        let categoryViewController = CategoryViewController()
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewController)
        categoryNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "photo"), tag: 1)
        
        let favoriteViewController = CategoryViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "photo"), tag: 2)
        
        let viewControllers = [homeNavigationController, categoryNavigationController, favoriteNavigationController]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        window?.rootViewController = tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

