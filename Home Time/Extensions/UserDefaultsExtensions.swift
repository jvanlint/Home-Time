//
//  UserDefaults.swift
//  DCS CoPilot II
//
//  Created by Michiel Koorn on 08/01/2021.
//  Copyright © 2021 Jason van Lint. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static var deviceToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "DeviceToken")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "DeviceToken")
            UserDefaults.standard.synchronize()
        }
    }
}
