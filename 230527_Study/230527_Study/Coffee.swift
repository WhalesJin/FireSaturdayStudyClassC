//
//  Coffee.swift
//  230527_Study
//
//  Created by Minseong Kang on 2023/05/27.
//
enum CoffeeMenu {
	case americano
	case latte
	
	var price: Int {
		switch self {
		case .americano:
			return 1000
		case .latte:
			return 1500
		}
	}
}

class Coffee {
	let kind: CoffeeMenu
	let amount: Int = 0
	
	init(kind: CoffeeMenu) {
		self.kind = kind
	}
}
