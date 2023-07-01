//
//  FoodType.swift
//  Sat_TableView
//
//  Created by Whales on 2023/07/02.
//

enum FoodType: Int, CaseIterable {
    case American = 0
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
    
    var styleFood: [Food] {
        switch self {
        case .American:
            return [
                Food(name: "햄버거", price: 5000),
                Food(name: "피자", price: 18000),
                Food(name: "아메리카노", price: 41000)
            ]
        case .Chinese:
            return [
                Food(name: "탕수육", price: 18000)
            ]
        case .Korean:
            return [
                Food(name: "비빔밥", price: 8000),
                Food(name: "돼지갈비", price: 20000)
            ]
        case .Japanese:
            return [
                Food(name: "스시", price: 20000),
                Food(name: "스윙스(돈까스)", price: 5000)
            ]
        }
    }
}
