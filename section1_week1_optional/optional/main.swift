//
//  main.swift
//  optional
//
//  Created by DasanKim, EtialMoon, Kobe, Whales on 2023/04/29.
//  with Gundy

import Foundation

// MARK: - STEP 1
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// Binding - if let
func usingIf() {
for index in 0..<productsList.count {
    if let goods: String = productsList[index] {
        print("\(index)번 상품은 \(goods)입니다.")
    }
}
}

// Binding - guard let
func usingGuard() {
    for index in 0..<productsList.count {
        guard let goods: String = productsList[index] else {
            print("\(index)번 상품은 상품이 없습니다.")
            continue
        }
        print("\(index)번 상품은 \(goods)입니다.")
    }
}

// Binding - switch
func usingSwitch() {
    for index in 0..<productsList.count {
        let goodsName: String? = productsList[index]
        
        switch goodsName {
        case .none:
            print("상품이 없습니다.")
        case .some(let goods):
            print("\(index)번 상품은 \(goods)입니다.")
        }
    }
}

// Binding - while let
func usingWhile() {
    var index = 0

    while index < productsList.count,
          let goods = productsList[index] {
        print("\(index)번 상품은 \(goods)입니다.")
        index += 1
    }
}

// Binding 외 - compactMap, enumerated()
let unwrappedProductsList = productsList.compactMap { $0 }
func usingCompactMap() {
    for (index, product) in unwrappedProductsList.enumerated() {
        print("\(index)번 상품은 \(product)입니다.")
    }
}

// Binding 외 - nil Coalescing Operator(nil 병합 연산자)
func usingNilCoalescingOperator() {
    for indexNumber in 0...productsList.count - 1 {
        let goods: String = productsList[indexNumber] ?? "no 상품"
        print("\(indexNumber)번 상품은 \(goods)입니다.")
    }
}

//usingNilCoalescingOperator()

// MARK: - STEP 2

let price: Int = 1000
var budget: Int = 2000

func buy(productNumber: Int) -> () {
    guard let product = productsList[productNumber] else {
        print("\(productNumber)번 상품은 품절입니다.\n")
        return
    }

    productsList[productNumber] = nil
    budget -= price
    print("""
    \(productNumber)번 상품 \(product)를 구매하였습니다.
    잔액이 \(budget)원입니다.\n
    """)

    return
}

func showProductsList() {
    for (index, product) in productsList.enumerated() {
        if let product {
            print("\(index)번 상품은 \(product)입니다.")
        } else {
            print("\(index)번 상품은 품절입니다.")
        }
    }
    print()
}

func inputOrderNumber() {
    while budget >= price {
        showProductsList()
        
        print("구매할 상품 번호를 입력해 주세요 : ", terminator: "")
        
        guard let inputProductNumber = readLine(),
              let inputProductNumber = Int(inputProductNumber),
              0...5 ~= inputProductNumber else {
            print("잘못된 입력입니다.")
            continue
        }
        
        buy(productNumber: inputProductNumber)
    }
}

inputOrderNumber()
