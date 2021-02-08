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

        fetchToken()                // Fetch our device token from the API so we can make further calls.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

extension AppDelegate {

    /// Fetches a device token from the Tram Tracker API and stores it in User Defaults.
    func fetchToken() {

        let tokenAPI = TramTrackerTokenAPI()                                // Create an API object we can use to make a call.
        tokenAPI.fetchDeviceToken() { result in                             // Make the call and fetch a token
            switch result {
            case .success(let response):
                let deviceToken = response.responseObject[0].deviceToken    // We have gotten something. Extract token from JSON.
                UserDefaults.deviceToken = deviceToken                      // Store the token in UserDefaults for other API calls.
                print("Device token = \(deviceToken)")

            default:
                print("error \(result)")                                    // If we are here there was an error. Print it out.
            }
        }
    }
}
