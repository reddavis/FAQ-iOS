//
//  AppDelegate.swift
//  Demo
//
//  Created by Red Davis on 01/08/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import UIKit
import FAQ


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    internal var window: UIWindow?
    internal let rootViewController = FAQController(URL: NSURL(string: "https://gist.githubusercontent.com/reddavis/7698b5cbbeba965594b96e1567793d9e/raw/9c8d64c34ead29b0b5e21bc43a1518f4297ad727/blah.json")!)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = self.rootViewController
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
