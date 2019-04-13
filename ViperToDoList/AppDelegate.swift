//
//  AppDelegate.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 11/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initMainScreen()
        return true
    }
    
    func initMainScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window  {
            let viewControllerMain = ToDoListRouter().build()
            let navigationController = UINavigationController()
            navigationController.viewControllers = [viewControllerMain]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }


    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStore().save()
    }
}

