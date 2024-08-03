//
//  UserDefaultManager.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    func markAsOnboarded(){
        UserDefaults.standard.set(true, forKey: "hasOnboarded")
    }
    
    func isOnboarded() -> Bool {
        return UserDefaults.standard.bool(forKey: "hasOnboarded")
    }
    
    func markAsUserLogedin(_ value: Bool){
        UserDefaults.standard.set(value, forKey: "isUserLogedin")
    }
    
    func isUserLogedin() -> Bool{
        return UserDefaults.standard.bool(forKey: "isUserLogedin")
    }
}
