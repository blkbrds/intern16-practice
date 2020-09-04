//
//  SceneDelegate.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       guard let windowScene = (scene as? UIWindowScene) else { return }
       let window = UIWindow(windowScene: windowScene)
       
       let vc = HomeViewController()
       let navi = UINavigationController(rootViewController: vc)
       
       window.rootViewController = navi
       
       self.window = window
       window.makeKeyAndVisible()
           
       }
}
