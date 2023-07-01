//
//  FoodType.swift
//  2_week1_TableView
//
//  Created by Dasan on 2023/07/01.
//

enum FoodType: Int {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var name: String {
        switch self {
        case .American:
            return "American"
        case .Chinese:
            return "Chinese"
        case .Korean:
            return "Korean"
        case .Japanese:
            return "Japanese"
        }
    }
}

