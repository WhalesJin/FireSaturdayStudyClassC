//
//  KeychainManager.swift
//  KeyChain_Practice
//
//  Created by 조호준 on 2023/08/12.
//

import Foundation

final class KeychainManager {
    enum KeychainError: Error {
        case invalidPassword
        case noPassword
        case unexpectedPasswordData
        case unhandledError(status: OSStatus)
    }
    
    static func addPasswordKeychain(password: String) throws {
        guard let passwordData = password.data(using: String.Encoding.utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        print("비밀번호가 저장되었습니다.")
    }
    
    static func loginKeychain(password: String) throws -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.noPassword
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        guard let passwordData = item as? Data,
            let keychainPassword = String(data: passwordData, encoding: String.Encoding.utf8)
        else {
            throw KeychainError.unexpectedPasswordData
        }
        
        if password == keychainPassword {
            print("로그인 되었습니다.")
            return true
        } else {
            print("비밀번호가 틀렸습니다.")
            return false
        }
    }
    
    static func updatePasswordKeychain(oldPassword: String, newPassword: String) throws {
        guard try loginKeychain(password: oldPassword) else {
            throw KeychainError.invalidPassword
        }
        
        guard let passwordData = newPassword.data(using: String.Encoding.utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        let attributes: [String: Any] = [kSecValueData as String: passwordData]
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.noPassword
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        print("비밀번호가 변경되었습니다.")
    }
}
