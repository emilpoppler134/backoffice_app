//
//  Auth.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-24.
//

import Foundation

class LocalStorage {
    private static var myKey: String = "myKey"
    
    public static var loggedIn: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get {
            return UserDefaults.standard.bool(forKey: myKey)
        }
    }
}
