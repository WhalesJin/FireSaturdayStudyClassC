//
//  CafeShop.swift
//  230527_Study
//
//  Created by Minseong Kang on 2023/05/27.
//

class CoffeeShop {
	let manager: CafeManager
	
	init(manager: CafeManager) {
		self.manager = manager
	}
	
	func order(_ menu: CoffeeMenu) -> Coffee {
		let coffee = manager.brew(menu)
		return coffee
	}
}
