//: [Previous](@previous)

import Foundation

DispatchQueue.global().async {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

DispatchQueue.global().async {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

DispatchQueue.main.async {
    for _ in 1...5 {
        print("🥵🥵🥵🥵🥵")
        sleep(1)
    }
}
//: [Next](@next)
