

final class Node<Element> {
    var data: Element
    var next: Node?

    init(data: Element) {
        self.data = data
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private(set) var count: Int = 0

    var first: Element? {
        return head?.data
    }

    var last: Element? {
        return tail?.data
    }

    var isEmpty: Bool {
        return head == nil
    }

    mutating func append(_ data: Element) {
        let node = Node(data: data)

        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }

        count += 1
    }

    mutating func removeFirst() -> Element? {
        let data = head?.data

        if head?.next == nil {
            head = nil
            tail = nil
            count = 0
        } else {
            head = head?.next
            count -= 1
        }

        return data
    }

    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}


struct Queue<Element> {
    private var linkedlist = LinkedList<Element>()

    var peek: Element? {
        return linkedlist.first
    }

    var count: Int {
        return linkedlist.count
    }

    var isEmpty: Bool {
        return linkedlist.isEmpty
    }

    mutating func enqueue(_ data: Element) {
        linkedlist.append(data)
    }

    mutating func dequeue() -> Element? {
        return linkedlist.removeFirst()
    }

    mutating func clear() {
        linkedlist.removeAll()
    }
}

//struct BankManager {
//    var queue = Queue<Int>()
//}
//
//struct Bank {
//    var bankManager = BankManager()
//    var clientQueue = Queue<Any>()
//
//    var count: Int {
//        clientQueue.count
//    }
//
//    mutating func visitClients() {
//        let numbers = Int.random(in: 10...30)
//        for i in 1...numbers {
//            clientQueue.enqueue(i)
//        }
//    }
//}
//
//var whaleBank = Bank()
//whaleBank.visitClients()
//
//import Foundation
//
//DispatchQueue.global().sync {
//    var takenTime: Double = 0
//    var clientCount = whaleBank.count
//
//    for _ in 1...clientCount {
//        guard let number = whaleBank.clientQueue.dequeue() else { break }
//        print("\(number)번 고객 업무 시작")
//        usleep(700000) // 0.7초
//        print("\(number)번 고객 업무 완료")
//
//        takenTime += 0.7
//    }
//    let formattedTime = String(format: "%.1f", takenTime)
//    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(formattedTime)초입니다.")
//}

//DispatchQueue.main.async {
//    for _ in 1...whaleBank.count {
//        guard let number = whaleBank.clientQueue.dequeue() else { break }
//        print("\(number)번 고객 업무 시작")
//        usleep(700000) // 0.7초
//        print("\(number)번 고객 업무 완료")
//    }
//}
//import Foundation
//
//var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let pickCardsSerialQueue = DispatchQueue(label: "PickCardsQueue")
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("야곰: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("노루: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        pickCardsSerialQueue.sync {
//            let card = cards.removeFirst()
//            print("오동나무: \(card) 카드를 뽑았습니다!")
//        }
//    }
//}
//
//
//
/*
import Foundation

//struct BankManager {
//    var queue = Queue<Int>()
//}

enum BankError: Error {
    case menuChoiceError
    case bankManagerNumberError
}

struct Bank {
    let menu: [String] = ["1", "2"]
    var bankManagerNumber: Int
    
    var bankManagers: [Int] {
        var array: [Int] = []
        
        for i in 1...bankManagerNumber {
            array.append(i)
        }
        
        return array
    }
    
    var clientQueue = Queue<Int>()
    
    var count: Int {
        clientQueue.count
    }
    
    mutating func visitClients() {
        let numbers = Int.random(in: 10...30)
        for i in 1...numbers {
            clientQueue.enqueue(i)
        }
    }
    
    mutating func chooseMenu() throws {
        do {
            try nextChooseMenu(menuNumber: getChosenMenu())
        } catch BankError.menuChoiceError {
            print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.")
            try chooseMenu()
        } catch BankError.bankManagerNumberError {
            print("은행원의 인원 수가 잘못되었습니다. 앱을 다시 실행해주세요.")
        } catch {
            print("알 수 없는 에러입니다. 앱을 다시 실행해주세요.")
        }
    }
    
    private func getChosenMenu() throws -> String {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        
        guard let chosenMenu: String = readLine(), menu.contains(chosenMenu) else {
            throw BankError.menuChoiceError
        }
        
        return chosenMenu
    }
    
    
    private mutating func nextChooseMenu(menuNumber: String) throws {
        if menuNumber == "1" {
            try work()
            try chooseMenu()
        } else {
            return
        }
    }
    /*
    mutating func work() throws {
        visitClients()
        var takenTime: Double = 0
        let clientCount = clientQueue.count
        
        guard bankManagerNumber >= 1 else {
            throw BankError.bankManagerNumberError
        }
        
//        for manager in bankManagers {
//            DispatchQueue.global().sync {
//                for _ in 1...clientCount {
//                    guard let number = clientQueue.dequeue() else {
//                        break
//                    }
//                    print("\(manager)번 창구에서 \(number)번 고객 업무 시작")
//                    usleep(700000) // 0.7초
//                    print("\(manager)번 창구에서 \(number)번 고객 업무 완료")
//
//                    takenTime += 0.7
//                }
//            }
//        }

        let semaphore = DispatchSemaphore(value: 1)
        
        let quantity: Int = clientCount / bankManagerNumber
        let remainder: Int = clientCount % bankManagerNumber
        
//        for manager in bankManagers {
//            DispatchQueue.global().sync {
//                for _ in 1...quantity {
//                    semaphore.wait()
//                    guard let number = clientQueue.dequeue() else {
//                        break
//                    }
//                    print("\(manager)번 창구에서 \(number)번 고객 업무 시작")
//                    usleep(700000) // 0.7초
//                    print("\(manager)번 창구에서 \(number)번 고객 업무 완료")
//
//                    takenTime += 0.7
//                }
//            }
//        }
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                semaphore.wait()
                guard let number = clientQueue.dequeue() else {
                    break
                }
                print("\(1)번 창구에서 \(number)번 고객 업무 시작")
                usleep(700000) // 0.7초
                print("\(1)번 창구에서 \(number)번 고객 업무 완료")
                semaphore.signal()
                
                takenTime += 0.7
            }
        }
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                semaphore.wait()
                guard let number = clientQueue.dequeue() else {
                    break
                }
                print("\(2)번 창구에서 \(number)번 고객 업무 시작")
                usleep(700000) // 0.7초
                print("\(2)번 창구에서 \(number)번 고객 업무 완료")
                semaphore.signal()
                
                takenTime += 0.7
            }
        }
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                semaphore.wait()
                guard let number = clientQueue.dequeue() else {
                    break
                }
                print("\(3)번 창구에서 \(number)번 고객 업무 시작")
                usleep(700000) // 0.7초
                print("\(3)번 창구에서 \(number)번 고객 업무 완료")
                semaphore.signal()
                
                takenTime += 0.7
            }
        }
        
        if remainder >= 1 {
            let lastManager = bankManagerNumber
            DispatchQueue.global().sync {
                for _ in 1...remainder {
                    semaphore.wait()
                    guard let number = clientQueue.dequeue() else {
                        break
                    }
                    print("\(lastManager)번 창구에서 \(number)번 고객 업무 시작")
                    usleep(700000) // 0.7초
                    print("\(lastManager)번 창구에서 \(number)번 고객 업무 완료")
                    semaphore.signal()
                    
                    takenTime += 0.7
                }
            }
        }
        
        
        let formattedTime = String(format: "%.2f", takenTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
    */
    
    mutating func work() throws {
        visitClients()
        var takenTime: Double = 0
        let clientCount = clientQueue.count
        
        guard bankManagerNumber >= 1 else {
            throw BankError.bankManagerNumberError
        }
        
        let quantity: Int = clientCount / bankManagerNumber
        let remainder: Int = clientCount % bankManagerNumber
        
        let clientSerialQueue = DispatchQueue(label: "ClientSerialQueue")
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                clientSerialQueue.sync {
                    guard let number = clientQueue.dequeue() else {
                        return
                    }
                    
                    print("\(1)번 창구에서 \(number)번 고객 업무 시작")
                    usleep(700000) // 0.7초
                    print("\(1)번 창구에서 \(number)번 고객 업무 완료")
                    
                    takenTime += 0.7
                }
            }
        }
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                clientSerialQueue.sync {
                    guard let number = clientQueue.dequeue() else {
                        return
                    }
                    
                    print("\(2)번 창구에서 \(number)번 고객 업무 시작")
                    usleep(700000) // 0.7초
                    print("\(2)번 창구에서 \(number)번 고객 업무 완료")
                    
                    takenTime += 0.7
                }
            }
        }
        
        DispatchQueue.global().sync {
            for _ in 1...quantity {
                clientSerialQueue.sync {
                    guard let number = clientQueue.dequeue() else {
                        return
                    }
                    
                    print("\(3)번 창구에서 \(number)번 고객 업무 시작")
                    usleep(700000) // 0.7초
                    print("\(3)번 창구에서 \(number)번 고객 업무 완료")
                    
                    takenTime += 0.7
                }
            }
        }
        
        
        if remainder >= 1 {
            let lastManager = bankManagerNumber
            DispatchQueue.global().sync {
                for _ in 1...remainder {
                    clientSerialQueue.sync {
                        guard let number = clientQueue.dequeue() else {
                            return
                        }
                        
                        print("\(lastManager)번 창구에서 \(number)번 고객 업무 시작")
                        usleep(700000) // 0.7초
                        print("\(lastManager)번 창구에서 \(number)번 고객 업무 완료")
                        
                        takenTime += 0.7
                    }
                }
            }
        }
        
        
        let formattedTime = String(format: "%.2f", takenTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
*/


import Foundation

struct BankManager {
    func work(client: Client) {
        let number = client.turn
        
        print("\(number)번 고객 업무 시작")
        usleep(700000)
        print("\(number)번 고객 업무 완료")
    }
}

struct Client {
    var turn: Int
    
    init(_ turn: Int) {
        self.turn = turn
    }
}

class Bank {
    let bankManagerCount: Int
    var clientQueue = Queue<Client>()
    let bankManger = BankManager()
    
    init(bankManagerCount: Int) {
        self.bankManagerCount = bankManagerCount
    }
    
    func open() {
        print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
        let input = readLine()
        
        switch input {
        case "1":
            startTask()
        default:
            return
        }
    }
    
    private func startTask() {
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: bankManagerCount)
        
        setUpClientQueue()
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { break }
            
            semaphore.wait()
            DispatchQueue.global().async(group: group) { [weak self] in
                self?.bankManger.work(client: client)
                semaphore.signal()
            }
        }
        group.wait()
        open()
    }
    
    private func setUpClientQueue() {
        let randomNumber = Int.random(in: 10...30)
        var client: Client
        
        for turn in 1...randomNumber {
            client = Client(turn)
            clientQueue.enqueue(client)
        }
    }
}

let weatherBank = Bank(bankManagerCount: 3)

weatherBank.open()
