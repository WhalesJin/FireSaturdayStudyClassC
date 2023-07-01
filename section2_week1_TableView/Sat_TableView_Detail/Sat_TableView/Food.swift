//
//  Food.swift
//  Sat_TableView
//
//  Created by Whales on 2023/07/01.
//

enum FoodType: String {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var name: String {
        switch self {
        case .American:
            return "양식"
        case .Chinese:
            return "중식"
        case .Korean:
            return "한식"
        case .Japanese:
            return "일식"
        }
    }
}

struct Food {
    let name: String
    var price: Int
}
