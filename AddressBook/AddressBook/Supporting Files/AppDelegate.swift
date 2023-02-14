//
//  AppDelegate.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK: - MOCK DATA
//        let texasBoys = Group(name: "Texas Boys", people: [Person(name: "Scotty", address: "Dallas"), Person(name: "Sea Bass", address: "Lubbock")])
//        let utes = Group(name: "Utes", people: [Person(name: "Karl", address: "Salt Lake City"), Person(name: "Max", address: "Provo"), Person(name: "Matt", address: "St. George")])
//        let mountainMan = Group(name: "Mountain Man", people: [Person(name: "Jake", address: "Colorado Springs")])
//
//        GroupController.sharedInstance.groups.append(contentsOf: [texasBoys, utes, mountainMan])
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

