//
//  Coffee.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

class Coffee {
    let kind: CoffeeMenu
    let amount: Int = 1
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}
