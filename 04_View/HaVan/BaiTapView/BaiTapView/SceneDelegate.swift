//
//  SceneDelegate.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        //bài tập 1
        //window.rootViewController = BaiTap1ViewController()
        
        //bài tập 2
//        window.rootViewController = BaiTap2ViewController()
        
        //bài tập 3
//        window.rootViewController = BaiTap3ViewController()
        
        //bài tập 4
        window.rootViewController = BaiTap4ViewController()
        
        //bài tập 5
//        window.rootViewController = BaiTap5ViewController()
        self.window = window
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }
}
