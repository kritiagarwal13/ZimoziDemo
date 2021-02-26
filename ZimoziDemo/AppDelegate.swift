//
//  AppDelegate.swift
//  ZimoziDemo
//
//  Created by Kriti Agarwal on 27/02/21.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var token : String?
    var navigationController = UINavigationController()
    static let shared = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        GMSPlacesClient.provideAPIKey(googleAPIKey)
        GMSServices.provideAPIKey(googleAPIKey)
        IQKeyboardManager.shared.enable = true
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

    // MARK: - Appdelegate Object
    
    class func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

}

