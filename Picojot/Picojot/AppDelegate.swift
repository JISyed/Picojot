//
//  AppDelegate.swift
//  Picojot
//
//  Created by Jibran Syed on 4/11/18.
//  Copyright © 2018 Jishenaz. All rights reserved.
//

import UIKit
import CoreData

// Temp
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.registerForRemoteNotifications()    // Needed for CloudKit subscriptions (silent notifs)
        
        // Set up subscription for CloudKit
        let jotsSubscribed = UserDefaults.standard.bool(forKey: "bJotSubscribed")
        if !jotsSubscribed
        {
            let jotSubscription = CKQuerySubscription(recordType: JotSchema.RecordName, predicate: NSPredicate(value: true), options: .firesOnRecordUpdate)
            let notifInfo = CKNotificationInfo()
            notifInfo.alertLocalizationKey = "JotNotif"
            notifInfo.alertBody = "JotNotif"
            jotSubscription.notificationInfo = notifInfo
            let privateDB = CKContainer.default().privateCloudDatabase
            privateDB.save(jotSubscription) { (subscription, error) in
                if let err = error
                {
                    debugPrint(err)
                    return
                }
                UserDefaults.standard.set(true, forKey: "bJotSubscribed")
                UserDefaults.standard.synchronize()
            }
        }
        
        
        return true
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
        CoreDataService.saveContext()
    }
    
    // MARK: - For silent notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        debugPrint("Successfully register to APN (Apple Pust Notif services)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let notif = CKNotification(fromRemoteNotificationDictionary: userInfo)
        //let alertBody = notif.alertBody
        if notif.notificationType == .query
        {
            let qNotif = CKQueryNotification(fromRemoteNotificationDictionary: userInfo)
            let recordID = qNotif.recordID!
            CKContainer.default().privateCloudDatabase.fetch(withRecordID: recordID) { (record, error) in
                if let err = error
                {
                    print("Sync error: Couldn't retrieve updated record!")
                    debugPrint(err)
                    return
                }
                guard let newRecord = record else {
                    print("Sync error: Updated record is nil!")
                    return
                }
                // TODO: Add record
            }
        }
    }

}

