//
//  Person.swift
//  230527_Study
//
//  Created by Minseong Kang on 2023/05/27.
//

class Person {
	let name: String
	var money: Int
	var coffee: Coffee?
	
	init(name: String, money: Int) {
		self.name = name
		self.money = money
	}
	
	func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) -> Coffee? {
		if menu.price <= self.money {
			let orderMenu = shop.order(menu)
			print("☕️\(orderMenu.kind) 나왔습니다.☕️")
			money -= menu.price
			print("💰남은 잔액은 \(self.money)원 입니다.💰")
			return orderMenu
		} else {
			print("🤑잔액이 부족합니다🤑")
			return nil
		}
	}
}
