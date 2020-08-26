//
//  AppDelegate.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let youtubeViewController = AudioBookViewController()
        window?.rootViewController = UINavigationController(rootViewController: youtubeViewController)
        window?.makeKeyAndVisible()
        GIDSignIn.sharedInstance()?.clientID = "345606309180-4cpfi4p6u0b1fr4jaa5deo4b18up832l.apps.googleusercontent.com"
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
        sourceApplication: sourceApplication,
        annotation: annotation)
    }
    
    @available(iOS 9.0, *)
      func application(_ app: UIApplication, open url: URL,
                       options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplication.OpenURLOptionsKey.annotation]
          return GIDSignIn.sharedInstance().handle(url,
                                                   sourceApplication: sourceApplication,
                                                   annotation: annotation)
      }
}

