//
//  Model.swift
//  MVC_MVVM
//
//  Created by 조호준 on 2023/10/07.
//

import Foundation

struct Model {
    enum Category: String {
        static let saveKey = "selected value"
        
        case book = "책"
        case meat = "고기"
    }
    
    func saveUserDefaults(_ category: Category) {
        UserDefaults.standard.set(category.rawValue, forKey: Category.saveKey)
    }
}
