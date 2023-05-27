//
//  main.swift
//  week5_UML
//
//  Created by 조호준 on 2023/05/26.
//

let customer = Person(name: "customer", money: 2000)
let cafeManager = CafeManager(name: "manager", money: 2000)
let coffeeShop = CoffeeShop(manager: cafeManager)

customer.buy(.americano, at: coffeeShop)
customer.buy(.americano, at: coffeeShop)
