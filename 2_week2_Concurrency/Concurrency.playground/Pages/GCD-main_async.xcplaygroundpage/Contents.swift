//: [Previous](@previous)

import Foundation

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

DispatchQueue.main.async(execute: yellow)
DispatchQueue.global().sync(execute: blue)


//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}

//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}

//for _ in 1...5 {
//    print("🥶🥶🥶🥶🥶")
//    sleep(2)
//}


//: [Next](@next)

