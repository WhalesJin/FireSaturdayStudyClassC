import Foundation

// MARK: main.async
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//for _ in 1...5 {
//    print("🥶🥶🥶🥶🥶")
//    sleep(2)
//}
//
// MARK: global().async
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥵🥵🥵🥵🥵")
//        sleep(1)
//    }
//}
//
// MARK: global().sync
//DispatchQueue.global().sync {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().sync {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}
//
//for _ in 1...5 {
//    print("🥵🥵🥵🥵🥵")
//    sleep(1)
//}
//
// MARK: DispatchWorkItem
//let red = DispatchWorkItem {
//    for _ in 1...5 {
//        print("🥵🥵🥵🥵🥵")
//        sleep(1)
//    }
//}
//
//let yellow = DispatchWorkItem {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//let blue = DispatchWorkItem {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}
//
//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//// MARK: asyncAfter
//DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: yellow)
//DispatchQueue.global().asyncAfter(wallDeadline: .now() + 5, execute: blue)
//// MARK: asyncAndWait
//DispatchQueue.global().asyncAndWait(execute: yellow)
//print("Finished!")

// MARK: DispatchGroup
//let yellow = DispatchWorkItem {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//let black = DispatchWorkItem {
//    for _ in 1...3 {
//        print("🖥🖥🖥🖥🖥")
//        sleep(1)
//    }
//}
//
//let white = DispatchWorkItem {
//    for _ in 1...3 {
//        print("📃📃📃📃📃")
//        sleep(1)
//    }
//
//    DispatchQueue.global().async(execute: yellow)
//}
//
//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: black)
//DispatchQueue.global().async(group: group, execute: white)
//
//group.wait()
//print("모든 작업이 끝났습니다.")

// MARK: Race Condition
//var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        let card = cards.removeFirst()
//        print("A: \(card) 카드를 뽑았습니다!")
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        let card = cards.removeFirst()
//        print("B: \(card) 카드를 뽑았습니다!")
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        let card = cards.removeFirst()
//        print("C: \(card) 카드를 뽑았습니다!")
//    }
//}

// MARK: DispatchSemaphore를 통해 스레드 접근 제어로 Race Condition 해결
//var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let semaphore = DispatchSemaphore(value: 1)
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("A: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("B: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("C: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}

// MARK: Serial Queue를 통해 Race Condition 해결
//var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let pickCardsSerialQueue = DispatchQueue(label: "PickCardsQueue")
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("A: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("B: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("C: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}

// MARK: OperationQueue로 Race Condition 해결하기
let operationQueue = OperationQueue()
var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let AOperation = BlockOperation {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("A: \(card) 카드를 뽑았습니다!")
    }
}

let BOperation = BlockOperation {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("B: \(card) 카드를 뽑았습니다!")
    }
}

let COperation = BlockOperation {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("C: \(card) 카드를 뽑았습니다!")
    }
}

operationQueue.addOperations([AOperation, BOperation, COperation], waitUntilFinished: true)

