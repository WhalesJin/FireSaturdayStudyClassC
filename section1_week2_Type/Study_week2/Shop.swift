//
//  Shop.swift
//  Study_week2
//
//  Created by Whales on 2023/05/06.
//

class Shop {
    private(set) var name: String
    private(set) var price: Int
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func showProductsList() {
        print("어서오세요! \(name)입니다!")
        for (index, product) in productsList.enumerated() {
            if let product {
                print("\(index)번 상품은 \(product)입니다.")
            } else {
                print("\(index)번 상품은 품절입니다.")
            }
        }
        print()
    }
}
