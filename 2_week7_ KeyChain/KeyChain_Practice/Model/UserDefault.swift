//
//  UserDefault.swift
//  KeyChain_Practice
//
//  Created by Dasan on 2023/08/12.
//

import Foundation

struct UserDefault {
    func settingDefaultValues(_ password: String, _ forKey: String) -> LoginStatus {
        UserDefaults.standard.set(password, forKey: forKey)
        return .newPassword
    }
    
    func matchDefaultValues(_ password: String, _ forKey: String) -> LoginStatus {
        // UserDefaults.standard.object(forKey: ): custom type을 위함
        guard let storedPassword = UserDefaults.standard.string(forKey: forKey),
              password == storedPassword else {
            return .notMatchedPassword
        }
        
        return .matchedPassword
    }
}
