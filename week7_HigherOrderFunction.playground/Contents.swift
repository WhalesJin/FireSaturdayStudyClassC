class Charactor {
//    func attack() {
//        print("attack")
//    }
//
//    func recovery() {
//        print("recovery")
//    }
//
//    func move() {
//        print("move")
//    }

//    let attack: () -> Void
    
//    init(attack: @escaping () -> Void) {
//        self.attack = attack
//    }
    
    let attack: () -> Void = {
        print("attack")
    }
    
    let recovery: () -> Void = {
        print("recovery")
    }
    
    let move: () -> Void = {
        print("move")
    }
    
    func tabShiftKey(skill: () -> Void) {
        print("tabShiftKey")
        skill()
    }
}

let charactor = Charactor()
charactor.tabShiftKey(skill: charactor.attack)
charactor.tabShiftKey(skill: charactor.recovery)
charactor.tabShiftKey(skill: charactor.move)


/*
 각 고차함수가 담당하는 기능
 - map : 각각의 요소에 원하는 작업을 해준다
 - reduce : 지정한 초기값부터 각각의 요소를 합친다
 - filter : 조건에 맞는 요소만 모아준다
 */


extension Array {
    func myMap(_ transform: (Element) -> Element) -> Self {
        var result: [Element] = []
        
        for item in self {
            result.append(transform(item))
        }
        
        return result
    }
    
    func myFilter(_ transform: (Element) -> Bool) -> Self {
        var result: [Element] = []
        
        for item in self {
            if transform(item) {
                result.append(item)
            }
        }
        
        return result
    }
    
    func myReduce(_ firstItem: Element, _ transform: (Element, Element) -> Element) -> Element {
        var result: Element = firstItem
        
        for item in self {
            result = transform(result, item)
        }
        
        return result
    }
}

let myArray = [1, 2, 3]

let myArrayMap = myArray.myMap { item in
    item * 2
}
print("myArrayMap = \(myArrayMap)") // myArrayMap = [2, 4, 6]

let myArrayFilter = myArray.myFilter { item in
    item > 1
}
print("myArrayFilter = \(myArrayFilter)") // myArrayFilter = [2, 3]

let myArrayReduce = myArray.myReduce(0) { lhs, rhs in
    lhs + rhs
}
print("myArrayReduce = \(myArrayReduce)") // myArrayReduce = 6

