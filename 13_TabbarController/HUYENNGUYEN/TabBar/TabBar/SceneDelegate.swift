//
//  SceneDelegate.swift
//  TabBar
//
//  Created by bu on 8/10/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        //config navigation
        let loginVC = LoginViewController()
        loginVC.delegate = self
        navigationController = UINavigationController(rootViewController: loginVC)
        
        //config window
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func login(view: LoginViewController) {
                //config tab Home
        let homeVC = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-plus "), tag: 0)
        homeNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-plus-selected ")
        
        //config tab Map
        
        let mapVC = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapVC)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map "), tag: 1)
        mapNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-map-selected ")
        
        

        
        //config tab Favorite
        let favoriteVC = FavoritesViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteVC)
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-favorite "), tag: 3)
        favoriteNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-favorite-selected ")
        
        //config tab Profile
        let profileVC = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile "), tag: 4)
        profileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic-profile-selected ")
        
       
        
        //config tab bar controller
        let viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController, profileNavigationController]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.923362151, green: 0.6216164776, blue: 0.5665037944, alpha: 1)
        tabBarController.tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBarController.tabBar.clipsToBounds = true
        
        navigationController = UINavigationController(rootViewController: tabBarController)
        window?.rootViewController = navigationController
        navigationController?.isNavigationBarHidden = true
    }
}
