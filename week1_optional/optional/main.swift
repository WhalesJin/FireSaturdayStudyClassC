//
//  main.swift
//  playground
//
//  Created by 조호준 on 2023/04/29.
//


// MARK: - STEP 1
let price: Int = 1000
var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// if let
for (index, product) in productsList.enumerated() {
    if let product {
        print("\(index)번 상품은 \(product)입니다.")
    }
}
// guard let
for (index, product) in productsList.enumerated() {
    guard let product else {
        continue
    }
    print("\(index)번 상품은 \(product)입니다.")
}
// compactMap
let unwrappedProductsList = productsList.compactMap { $0 }
for (index, product) in unwrappedProductsList.enumerated() {
    print("\(index)번 상품은 \(product)입니다.")
}

// ??? while let을 시도했으나 for문 안에 사용하게 되어 의미가 없지 않나
for (index, product) in productsList.enumerated() {
    while let unwrappedProduct = product {
        print("\(index)번 상품은 \(unwrappedProduct)입니다.")
        break
    }
}

// !!! while let Gundy가 알려주신 방법
var index = 0
while index < productsList.count,
      let goods = productsList[index] {
    print("\(index)번 상품은 \(goods)입니다.")
    index += 1
}
index = 0
while let goods = productsList[index] {
    print("\(index)번 상품은 \(goods)입니다.")
    index += 1
    if index == productsList.count { break }
}


// MARK: - STEP 2
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

