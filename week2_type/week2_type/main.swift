//
//  main.swift
//  week2_type
//
//  Created by DasanKim on 2023/05/06.
//

enum orderError: Error {
    case wrongInput
    case outOfStock
}

class Shop {
    private(set) var shopName: String
    private(set) var productPrice: Int
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    init(shopName: String, productPrice: Int) {
        self.shopName = shopName
        self.productPrice = productPrice
    }
    
    func showProductsList() {
        for (index, product) in productsList.enumerated() {
            if let product {
                print("\(index)번 상품은 \(product)입니다.")
            } else {
                print("\(index)번 상품은 품절입니다.")
            }
        }
        print("")
    }
}
class ShopManager: Shop {
    
    func takeOrder() throws {
        var selectedProduct: String = String()
        var selectedProductNumber: Int = Int()
        
        print("어서오세요! \(shopName)입니다!")
        showProductsList()
        
        do {
            selectedProductNumber = try checkOrder()
            selectedProduct = try checkStock(selectedProductNumber)
            notifyOrderResult(product: selectedProduct, selectedProductNumber)
        } catch orderError.wrongInput {
            print("잘못된 입력입니다.")
        } catch orderError.outOfStock {
            print("\(selectedProductNumber)번 상품은 품절입니다.\n")
        }
    }
    
    private func checkOrder() throws -> Int {
        print("구매할 상품 번호를 말씀해주세요 : ", terminator: "")
        
        guard let input = readLine(), let productNumber = Int(input),
              0...5 ~= productNumber
        else {
            throw orderError.wrongInput
        }
        
        return productNumber
    }
    
    private func checkStock(_ productNumber: Int) throws -> String {
        guard let product = productsList[productNumber] else {
            throw orderError.outOfStock
        }
        productsList[productNumber] = nil
        
        return product
    }
    
    func notifyPrice() -> Int {
        return productPrice
    }
    
    private func notifyOrderResult(product: String, _ productNumber: Int) {
        print("\(productNumber)번 상품 \(product)가 완료되었습니다.")
        //print(productsList)
    }
}

struct Camper {
    private var budget: Int = 2000
    
    mutating func buy(to shopManager: ShopManager) throws {
        if budget >= shopManager.notifyPrice() {
            try shopManager.takeOrder()
            budget -= shopManager.notifyPrice()
        } else {
            print("잔액이 부족합니다. 현재 잔액은 \(budget)원 입니다.")
        }
    }
    
    func checkBalance() {
        print("현재 잔액: \(budget)")
    }
}

let manager1 = ShopManager(shopName: "SAMSUNG", productPrice: 1000)
let manager2 = ShopManager(shopName: "APPLE", productPrice: 1100)
var dasan = Camper()

//try dasan.buy(to: manager1)
//try dasan.buy(to: manager1)
//dasan.checkBalance()
try dasan.buy(to: manager2)
try dasan.buy(to: manager2)
dasan.checkBalance()
