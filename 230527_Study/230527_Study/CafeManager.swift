//
//  CafeManager.swift
//  230527_Study
//
//  Created by Minseong Kang on 2023/05/27.
//

class CafeManager: Person {
	func brew(_ menu: CoffeeMenu) -> Coffee {
		return Coffee(kind: menu)
	}
}
