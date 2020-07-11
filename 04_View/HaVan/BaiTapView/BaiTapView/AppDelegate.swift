//
//  AppDelegate.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        //bài tập 1
        //        let bt1VC = BaiTap1ViewController()
        //        window?.rootViewController = bt1VC
        //bài tập 2
        //        let bt2VC = BaiTap2ViewController()
        //        window?.rootViewController = bt2VC
        
        //bài tập 3
        //        let bt3VC = BaiTap3ViewController()
        //        window?.rootViewController = bt3VC
        
        //bài tập 4
        //        let bt4VC = BaiTap4ViewController()
        //        window?.rootViewController = bt4VC
        
        //bài tập 5
        //        let bt5VC = BaiTap5ViewController()
        //        window?.rootViewController = bt5VC
        
        //bài tập 5
        let bt5VC = BaiTap5ViewController()
        window?.rootViewController = bt5VC
        return true
    }
}
