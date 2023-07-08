//: [Previous](@previous)

import Foundation

/*
let red = DispatchWorkItem {
    for _ in 1...5 {
        print("🥵🥵🥵🥵🥵")
        sleep(1)
    }
}

let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

let blue = DispatchWorkItem {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}
//let myDispatch = DispatchQueue(label: "dasan", attributes: .initiallyInactive)
//
//myDispatch.async(execute: yellow)
//myDispatch.activate()


let group = DispatchGroup()

DispatchQueue.global().async(group: group, execute: blue)
DispatchQueue.global().async(group: group, execute: red)

// group.enter()
// DispatchQueue.global().async(execute: blue)
// DispatchQueue.global().async(execute: red)
// group.leave()

//group.notify(queue: .main) {
//    print("모든 작업이 끝났습니다.")
//}

//group.wait()
//print("메롱")

//group.wait(timeout: .now() + 5)
//print("5초 지남")

*/

let group = DispatchGroup()
let test = DispatchGroup()

let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

let black = DispatchWorkItem {
    for _ in 1...3 {
        print("🖥🖥🖥🖥🖥")
        sleep(1)
    }
}

let white = DispatchWorkItem {
    for _ in 1...3 {
        print("📃📃📃📃📃")
        sleep(2)
    }

    DispatchQueue.global().async(group: group, execute: yellow)
}

DispatchQueue.global().async(group: group, execute: black)
DispatchQueue.global().async(group: test, execute: white)

//test.wait()
//print("우오오오")
//
//group.wait()
//print("모든 작업이 끝났습니다.")

group.wait()
print("모든 작업이 끝났습니다.")

test.wait()
print("우오오오")

group.wait()
print("껄껄")

//: [Next](@next)
