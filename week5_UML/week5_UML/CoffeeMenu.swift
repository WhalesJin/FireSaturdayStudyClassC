//
//  CoffeeMenu.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 1500
        case .latte:
            return 2000
        }
    }
}
