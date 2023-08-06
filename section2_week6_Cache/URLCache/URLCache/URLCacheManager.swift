//
//  URLCacheManager.swift
//  URLCache
//
//  Created by Whales on 2023/08/05.
//

import UIKit

//class URLCacheManager {
//    static let shared = URLCacheManager() // 싱글톤
//    private init() { } // 생성자 사용 못하게
//    
//    private let storage = NSCache<NSString, UIImage>()
//    
//    func cachedImage(urlString: String) -> UIImage? {
//        let cachedKey = NSString(string: urlString)
//        if let cachedImage = storage.object(forKey: cachedKey) {
//            return cachedImage
//        }
//        return nil
//    }
//    
//    func setObject(image: UIImage, urlString: String) {
//        let forKey = NSString(string: urlString)
//        self.storage.setObject(image, forKey: forKey)
//    }
//    
//    func removeCached() {
//        storage.removeAllObjects()
//    }
//}
