//
//  AppDelegate.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let defaults = UserDefaults.standard
        let wasAppResentlyLaunched = defaults.bool(forKey: "ResentlyLaunched")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        if wasAppResentlyLaunched {
            window?.rootViewController = loadingViewController()
        } else {
            defaults.set(true, forKey: "ResentlyLaunched")
            window?.rootViewController = initialViewController()
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    func loadingViewController() -> UINavigationController {
        let loadingVK = TTLoadingViewController(nibName: "TTLoadingViewController", bundle: nil)
        loadingVK.shouldFetchData = true
        return UINavigationController(rootViewController: loadingVK)
    }
    
    func initialViewController() -> UINavigationController {
        let initialVK = TTInitialViewController(nibName: "TTInitialViewController", bundle: nil)
        return UINavigationController(rootViewController: initialVK)
    }
    
}

