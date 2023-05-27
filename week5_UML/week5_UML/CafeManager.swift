//
//  CafeManager.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee {
        return Coffee(kind: menu)
    }
}
