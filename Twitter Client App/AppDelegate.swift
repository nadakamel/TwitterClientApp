//
//  AppDelegate.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/10/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit
import CoreData
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var twitterService: TwitterServiceWrapper = {
        let twitterService = TwitterServiceWrapper()
        return twitterService
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Twitter intialization
        TWTRTwitter.sharedInstance().start(withConsumerKey: Constants.consumerKey, consumerSecret: Constants.consumerSecret)
        
        // Navigation bar
        UINavigationBar.appearance().backgroundColor = UIColor.navigationBar
        UINavigationBar.appearance().barTintColor = UIColor.navigationBar
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        // Remove back button title from navigation bar
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clear], for: .normal)
        
        // Window intialization
        self.start()
        
        return true
    }
    
    func start() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController
        let defaults = UserDefaults.standard
        if defaults.string(forKey: "user_handle") != nil {
            viewController = mainStoryboard.instantiateViewController(withIdentifier: "FollowersViewController")
        } else {
            viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        }
        self.window?.rootViewController = viewController
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url.absoluteString)
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
}

