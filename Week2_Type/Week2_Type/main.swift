//
//  main.swift
//  Week2_Type
//
//  Created by 조호준 on 2023/05/06.
//

class Shop {
    private let name: String
    let price: Int = 1000
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

    init(name: String) {
        self.name = name
    }
    
    func showProductsList() {
        print("어서오세요, \(name)입니다.\n")
        for (index, product) in productsList.enumerated() {
            if let product {
                print("\(index)번 상품은 \(product)입니다.")
            } else {
                print("\(index)번 상품은 품절입니다.")
            }
        }
    }
}

struct Seller {
    func sell(from shop: Shop) -> Bool {
        shop.showProductsList()
        
        let productNumber: Int = inputOrder()
        guard let product = shop.productsList[productNumber] else {
            print("\(productNumber)번 상품은 품절입니다.\n")
            return false
        }
        
        print("\(productNumber)번 상품 \(product)를 구매하였습니다.")
        shop.productsList[productNumber] = nil
        return true
    }
    
    private func inputOrder() -> Int {
        print("\n구매할 상품 번호를 입력해 주세요 : ", terminator: "")
        guard let inputProductNumber = readLine(),
              let inputProductNumber = Int(inputProductNumber),
              0...5 ~= inputProductNumber else {
            print("잘못된 입력입니다.")
            return inputOrder()
        }
        
        return inputProductNumber
    }
}

struct Camper {
    private var budget: Int = 2000
    
    mutating func buy(from shop: Shop, by seller: Seller) {
        if budget >= shop.price {
            if seller.sell(from: shop) {
                budget -= shop.price
            }
            print("잔액이 \(budget)원입니다.\n")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

let shop1 = Shop(name: "1호점")
let shop2 = Shop(name: "2호점")
var camper = Camper()
let seller = Seller()

camper.buy(from: shop1, by: seller)
camper.buy(from: shop1, by: seller)
camper.buy(from: shop2, by: seller)
