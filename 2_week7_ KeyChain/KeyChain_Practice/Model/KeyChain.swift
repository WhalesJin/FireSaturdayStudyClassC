//
//  KeyChain.swift
//  KeyChain_Practice
//
//  Created by Dasan on 2023/08/12.
//

import Foundation

struct KeyChain {
    func addKeyChain(_ password: String) -> LoginStatus? {
        let item = searchQuery()
        
        if item == nil {
            guard let query = createKeyChainQuery(password) else { return nil }
            
            let status = SecItemAdd(query as CFDictionary, nil)
            
            if status == errSecSuccess {
                return .newPassword
            } else {
                print(SecCopyErrorMessageString(status, nil)!)
                return nil
            }
        } else {
            return .alreadyRegisteredPassword
        }
    }
    
    func updateKeyChain(_ password: String, _ newPassword: String) -> LoginStatus? {
        guard let passwordData = password.data(using: .utf8),
              let newPasswordData = newPassword.data(using: .utf8) else { return  nil }
        
        guard matchKeyChain(password) == .matchedPassword else {
            return .notMatchedPassword
        }
        
        guard passwordData != newPasswordData else {
            return .duplicatedPassword
        }
        
        let previousQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: passwordData
        ]
        
        let updateQuery: [String: Any] = [
            kSecValueData as String: newPasswordData
        ]
        
        let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
        
        if status == errSecSuccess {
            return .changedPassword
        } else {
            print(SecCopyErrorMessageString(status, nil)!)
            return nil
        }
    }
    
    func matchKeyChain(_ password: String) -> LoginStatus? {
        let item = searchQuery()
        
        guard let existingItem = item as? [String: Any],
              let passwordData = existingItem[kSecValueData as String] as? Data,
              let storedPassword = String(data: passwordData, encoding: .utf8) else {
            return nil
        }
        
        if password == storedPassword {
            return .matchedPassword
        } else {
            return .notMatchedPassword
        }
    }
    
    func deleteKeyChain() {//_ password: String) {
        //guard let passwordData = password.data(using: .utf8) else { return }
        
        let deleteQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
        ]
        
        let status = SecItemDelete(deleteQuery as CFDictionary)
        
        if status == errSecSuccess {
            print("모두 삭제됨!")
            print(SecCopyErrorMessageString(status, nil)!)
        } else {
            print(SecCopyErrorMessageString(status, nil)!)
        }
    }
}

extension KeyChain {
    private func createKeyChainQuery(_ password: String) -> [String: Any]? {
        guard let passwordData = password.data(using: .utf8) else { return nil }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: passwordData
        ]
        
        return query
    }
    
    private func searchQuery() -> CFTypeRef? {
        let searchQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        
        guard SecItemCopyMatching(searchQuery as CFDictionary, &item) == errSecSuccess else {
            return nil
        }
        
        return item
    }
}
