//
//  Camper.swift
//  Study_week2
//
//  Created by Whales on 2023/05/06.
//

struct Camper {
    private var budget: Int = 2000
    
    mutating func buy(from shopManager: ShopManager) throws {
        
        if budget >= shopManager.price {
            if try shopManager.checkOrder() {
                budget -= shopManager.price
                print("잔액이 \(budget)원입니다.\n")
            }
        } else {
            print("잔액이 부족합니다. 현재 잔액은 \(budget)원 입니다.")
        }
    }
}
