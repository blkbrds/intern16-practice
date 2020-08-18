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
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BaiTapMVVM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
