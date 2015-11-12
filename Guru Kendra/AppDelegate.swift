//
//  AppDelegate.swift
//  Guru Kendra
//
//  Created by Siddalingamurthy Gangadharappa on 10/17/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import UIKit

protocol GKMasterDetailDelegate : class {
    func applicationEntryState() -> GKMasterDetailState
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate,GKMasterDetailDelegate  {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        
        if (self.applicationEntryState() == GKMasterDetailState.GKUserEntryState) {
            
                       
        }

        
        let navigationDetailController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        let detailvc = navigationDetailController.topViewController as! GKDetailViewController
        detailvc.delegate = self
       navigationDetailController.topViewController!.navigationItem.leftBarButtonItem = nil//splitViewController.displayModeButtonItem()
        splitViewController.delegate = self
        
        let mastervc = (splitViewController.viewControllers[0] as! UINavigationController).topViewController as! GKMasterViewController
        mastervc.delegate = self
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        
        
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? GKDetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return false
        }
        return false
    }
    
    func splitViewController(splitViewController: UISplitViewController, showViewController vc: UIViewController, sender: AnyObject?) -> Bool {
        
        print("vc identifier \(vc)")
        
        return false
    }
    
    // MARK: - GMMasterDetailDelegate Implementation
    func applicationEntryState() -> GKMasterDetailState {
        
        return GKMasterDetailState.GKUserEntryState
    }
}

