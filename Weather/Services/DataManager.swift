//
//  UserDefaults.swift
//  Weather
//
//  Created by admin on 6.09.22.
//

import Foundation


class DataManager {
    
    private enum SettingsKeys: String {
        case cityName
    }
    
    static var cityName: [String] {
        get {
            if let array = UserDefaults.standard.array(forKey: SettingsKeys.cityName.rawValue) as? [String] {
                return array
            } else {
                return []
            }
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.cityName.rawValue
            let name = newValue
            defaults.set(name, forKey: key)
        }
    }
}
