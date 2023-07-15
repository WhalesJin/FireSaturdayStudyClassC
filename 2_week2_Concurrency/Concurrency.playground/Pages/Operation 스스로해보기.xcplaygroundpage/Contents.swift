//: [Previous](@previous)

import Foundation

var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let yagom = BlockOperation {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("야곰: \(card) 카드를 뽑았습니다!")
    }
}

let noru = BlockOperation {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("노루: \(card) 카드를 뽑았습니다!")
    }
}

let odong = BlockOperation {
    for _ in 1...3 {
    
            let card = cards.removeFirst()
            print("오동나무: \(card) 카드를 뽑았습니다!")
        }
        test.start()
    }
}

let queue = OperationQueue()

//yagom.addDependency(odong)
//odong.addDependency(noru)

//queue.maxConcurrentOperationCount = 1

//queue.addOperations([yagom, noru, odong], waitUntilFinished: true)
queue.addOperation(yagom)
queue.addOperation(noru)
queue.addOperation(odong)


//: [Next](@next)
