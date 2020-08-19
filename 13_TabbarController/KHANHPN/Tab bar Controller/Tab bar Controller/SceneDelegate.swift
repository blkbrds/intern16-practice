//
//  SceneDelegate.swift
//  Tab bar Controller
//
//  Created by Ngoc Khanh Phan on 8/17/20.
//  Copyright © 2020 Ngoc Khanh Phan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    static let shared: SceneDelegate = {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Cannot cast `SceneDelegate`")
        }
        return shared
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        changeRootViewController(root: .login)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    enum RootType {
        case tabbar
        case login
    }
    
    func changeRootViewController(root: RootType) {
        switch root {
            case .tabbar:
                goToTabBar()
            case .login:
                goToLogin()
        }
    }
    
    func goToTabBar() {
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home-sel"))
        
        //Messages
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "location"), selectedImage: #imageLiteral(resourceName: "location-sel"))
        
        //Friends
        let favouriteVC = FavouriteViewController()
        let favouriteNavi = UINavigationController(rootViewController: favouriteVC)
        favouriteVC.tabBarItem = UITabBarItem(title: "Favourite", image: #imageLiteral(resourceName: "favourite"), selectedImage: #imageLiteral(resourceName: "favourite-sel"))
        
        //Profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile-sel"))
        
        //TabBar controller
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favouriteNavi, profileNavi]
        tabbarController.tabBar.tintColor = .systemOrange

        window?.rootViewController = tabbarController
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController()
        let loginNavigationController = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = loginNavigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}
