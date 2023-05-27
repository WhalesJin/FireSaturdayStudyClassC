//
//  main.swift
//  230527_Study
//
//  Created by Minseong Kang on 2023/05/27.
//

import Foundation

let kobe: Person = Person(name: "Kobe", money: 5000)
let manager: CafeManager = CafeManager(name: "Xcode", money: 3000)
let coffeeShop: CoffeeShop = CoffeeShop(manager: manager)

let buyAmericano = kobe.buy(.americano, at: coffeeShop)
let buyLatte = kobe.buy(.latte, at: coffeeShop)
let buyLatte2 = kobe.buy(.latte, at: coffeeShop)
let buyLatte3 = kobe.buy(.latte, at: coffeeShop)




