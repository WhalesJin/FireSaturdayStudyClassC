//
//  CoffeeShop.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        return self.manager.brew(menu)
    }
}
