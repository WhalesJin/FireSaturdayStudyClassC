//
//  main.swift
//  week5_UML
//
//  Created by Yena on 2023/05/26.
//

import Foundation

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 3000
        case .latte:
            return 3500
        }
    }
}

class Person {
    let name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CafeShop) {
        if menu.price <= self.money {
            shop.order(menu)
            self.money -= menu.price
            self.coffee = shop.manager.coffee
        } else {
            print("잔액이 부족합니다.")
        }
    }
    
    func drinkCoffee() {
        if let coffee = self.coffee {
            print("\(coffee.kind) 호로록")
        } else {
            print("커피가 없어요")
        }
    }
}

class CafeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) {
        manager.brew(menu)
    }
}

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) {
        let orderedCoffee = Coffee(kind: menu)
        self.coffee = orderedCoffee
        print("주문하신 \(orderedCoffee.kind) \(orderedCoffee.amount)잔 나왔습니다.")
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int = 1
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}

let bongmin = CafeManager(name: "bongmin", money: 20000)
let dasan = Person(name: "dasan", money: 10000)

let starbucks = CafeShop(manager: bongmin)

dasan.buy(.americano, at: starbucks)
dasan.drinkCoffee()
dasan.buy(.americano, at: starbucks)
dasan.buy(.americano, at: starbucks)
dasan.buy(.americano, at: starbucks)
