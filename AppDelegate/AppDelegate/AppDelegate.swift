//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by Tyron Allen on 9/18/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        
        let screenRect = UIScreen.mainScreen().bounds
        window = UIWindow(frame: screenRect)
        let navigationController =
            UINavigationController(nibName: nil, bundle: nil)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    
}

