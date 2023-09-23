//
//  Bundle+.swift
//  OAuthStudy
//
//  Created by 조호준 on 2023/09/23.
//

import Foundation

extension Bundle {
    static var kakaoAPIKey: String {
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let plistDictionary = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file 'APIKey.plist'.")
        }
        
        guard let value = plistDictionary.object(forKey: "KakaoAPIKey") as? String else {
            fatalError("Couldn't find key 'Open Weather' in 'APIKey.plist'.")
        }
        
        return value
    }
}
