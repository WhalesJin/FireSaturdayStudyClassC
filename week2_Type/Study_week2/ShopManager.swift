//
//  ShopManager.swift
//  Study_week2
//
//  Created by Whales on 2023/05/07.
//

class ShopManager: Shop {
    
    private func takeOrder() throws -> Int {
        showProductsList()
        print("구매할 상품 번호를 말씀해주세요 :", terminator: " ")
        
        guard let input = readLine(), let productNumber = Int(input),
              0...5 ~= productNumber
        else {
            throw orderError.wrongInput
        }
        
        return productNumber
    }
    
    func checkOrder() throws -> Bool {
        var selectedProduct: String = String()
        var selectedProductNumber: Int = Int()
        
        do {
            selectedProductNumber = try takeOrder()
            selectedProduct = try checkStock(of: selectedProductNumber)
            notifyOrderResult(product: selectedProduct, selectedProductNumber)
            return true
        } catch orderError.wrongInput {
            print("잘못된 입력입니다.")
            return false
        } catch orderError.outOfStock {
            print("\(selectedProductNumber)번 상품은 품절입니다.\n")
            return false
        }
    }
    
    private func checkStock(of productNumber: Int) throws -> String {
        guard let product = productsList[productNumber] else {
            throw orderError.outOfStock
        }
        productsList[productNumber] = nil
        
        return product
    }
    
    private func notifyOrderResult(product: String, _ productNumber: Int) {
        print("\(productNumber)번 상품 \(product) 구매가 완료되었습니다.")
    }
}
