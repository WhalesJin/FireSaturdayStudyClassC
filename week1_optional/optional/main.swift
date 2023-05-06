/*
 
// STEP1
let price: Int = 900
var budget: Int = 3000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//compactMap
let products = productsList.compactMap{ $0 }
for index in 0..<products.count {
    print("\(index)번 상품은 \(products[index]) 입니다.")
}

//compactMap & enumerated()
let products = productsList.compactMap{ $0 }

for (index, product) in products.enumerated() {
    print("\(index)번 상품은 \(product) 입니다.")
}

//if let
for (index, product) in productsList.enumerated() {
    if let product = product {
        print("\(index)번 상품은 \(product) 입니다.")
    } else {
        print("\(index)번은 상품이 없습니다.")
        continue
    }
}

//guard let
for (index, product) in productsList.enumerated() {
    guard let product = product else {
        print("\(index)번은 상품이 없습니다.")
        continue
    }
    print("\(index)번 상품은 \(product) 입니다.")
}

//nil coalescing
for (index, product) in productsList.enumerated() {
    //let test = product ?? ""
    print("\(index)번 상품은 \(product ?? "") 입니다.")
}

//while let - 연결리스트 구현할 때 주로 쓰임.
var index = 0
while index < productsList.count, let product = productsList[index] {
    print("\(index)번 상품은 \(product) 입니다.")
    index += 1
}

//while let2
var index = 0
while let goods = productsList[index] {
    print(goods)
    index += 1
    if index == productsList.count { break }
}
*/

// STEP2
let price: Int = 900
var budget: Int = 3000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func printProduct() {
    for (index, product) in productsList.enumerated() {
        guard let product = product else {
            print("\(index)번 상품은 품절되었습니다.")
            continue
        }
        print("\(index)번 상품은 \(product) 입니다.")
    }
}

func buy(productNumber: Int) {
    if budget >= price {
        if let product = productsList[productNumber] {
            print("\(productNumber)번 \(product)가 구매되었습니다.")
            productsList[productNumber] = nil
            budget -= price
        }
        else {
            print("\(productNumber)번 상품은 품절되었습니다.")
        }
    } else {
        print("잔액이 부족합니다.")
        print("현재잔액: \(budget)")
    }
}

buy(productNumber: 1)
buy(productNumber: 1)
buy(productNumber: 2)
buy(productNumber: 3)
buy(productNumber: 0)
buy(productNumber: 5)
//printProduct()
