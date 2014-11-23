//
//  AppDelegate.swift
//  ScrollForSushi
//
//  Created by Caroline Wong on 11/22/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

import UIKit
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

//https://api.delivery.com/merchant/search/delivery?client_id=YjYyNTM1NDAxMmU2M2YzNzYyY2UwOWU2NGM2ZDdkNzZk&address=199%20Water%20St%2010038
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let clientId = "ODc2OTBhN2JkYzYzZmYzNzQyZDEwNmU3ZTY5YzdmNDIz"
        let addr = "940%20Market%20St%2094102"
      
        var url2 = "https://api.delivery.com/merchant/search/delivery?client_id=\(clientId)&address=\(addr)&merchants=r"
        
        
        var url: NSURL = NSURL(string: url2)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer <NSURLResponse?
        >=nil
        
        var error: AutoreleasingUnsafeMutablePointer <NSErrorPointer?>=nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println("Synchronous\(jsonResult)")
        println("Data items count: \(jsonResult.count)")
        var info : NSArray =  jsonResult.valueForKey("merchants") as NSArray
        println("Data items count: \(info.count)")
        for var i = 0; i < info.count; i++ {
            if let item: AnyObject! = info[i] as AnyObject! {
                if (item["summary"] != nil) {
                    if let summ: AnyObject! = item["summary"] as AnyObject! {
                        if let cuis: AnyObject! = summ["cuisines"] as AnyObject! {
                            println(cuis[0])
                            if (cuis[0] != nil && cuis[0] as NSString == "Japanese") {
                                println("trueee")
                            }
                        }
                    }
                }
            }
        }
        

        // Override point for customization after application launch.
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


}

