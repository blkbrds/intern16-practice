//
//  SceneDelegate.swift
//  TabbarController
//
//  Created by Abcd on 8/10/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    enum AppStatus {
        case login
        case logOut
    }
    
    func configRootView(with status: AppStatus) {
        switch status {
        case .login:
            login()
        case .logOut:
            logOut()
        }
    }
    
    func login() {
        let tabbarController = MainTabbarController()
        window?.rootViewController = tabbarController
    }
    
    func logOut() {
        let loginVC = LoginViewController()
        let navi = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navi
    }
    static var shared: SceneDelegate = {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else  {
            fatalError("Loi SceneDelegate")
        }
          print("Dang o sceneDelegate: \(sceneDelegate)")
        return sceneDelegate
    }()
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if UserDefaults.standard.value(forKey: "userName") != nil {
            configRootView(with: .login)
        } else {
            configRootView(with: .logOut)
        }
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

