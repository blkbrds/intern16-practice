//
//  AppDelegate.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/14/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit
import CoreData

enum RootType {
    case login
    case tabbar
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var container: NSPersistentContainer!
    var window: UIWindow?
    static var shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can't cast UIApplication.shared.delegate to AppDelegate")
        }
        return shared
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let isLogined: Bool = UserDefaults.standard.bool(forKey: "state")
        if isLogined {
            configTabbar()
        } else {
            configLogin()
        }
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
    
    func configLogin() {
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
    }
    
    func configTabbar() {
        window?.rootViewController = BaseTabbarController()
    }
    
    func changeRoot(rootType: RootType) {
        switch rootType {
        case .login:
            configLogin()
        case .tabbar:
            configTabbar()
        }
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BaiTapMVVM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
