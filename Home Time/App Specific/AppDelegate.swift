//
//  AppDelegate.swift
//  Home Time
//
//  Created by Jason van Lint on 7/2/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        fetchToken()

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

extension AppDelegate {


    /// Fetches a device token from the Tram Tracker API and stores it in User Defaults.
    func fetchToken() {
        let tokenAPI = TramTrackerTokenAPI()
        tokenAPI.fetchDeviceToken() { result in
            switch result {
            case .success(let response):
                let responseObject = response.responseObject
                let deviceToken = responseObject[0].deviceToken
                UserDefaults.deviceToken = deviceToken
                print("Device token = \(deviceToken)")

            default:
                print("error \(result)")
            }
        }
    }
}
