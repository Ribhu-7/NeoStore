//
//  UserClassSettings.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import UIKit

class UserClassSettings {

    static let shared = UserClassSettings()
     
     private init() {}
     
     var userName: String? {
         get {
             return UserDefaults.standard.string(forKey: "userName")
         }
         set {
             UserDefaults.standard.set(newValue, forKey: "userName")
         }
     }
     
    var password: String? {
        get {
            return UserDefaults.standard.string(forKey: "password")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "password")
        }
    

     }
}
