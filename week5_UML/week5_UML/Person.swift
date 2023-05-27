//
//  Person.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

class Person {
    let name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= self.money {
            self.money -= menu.price
            self.coffee = shop.order(menu)
            print("\(shop)의 \(menu)를 구매했다.")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
