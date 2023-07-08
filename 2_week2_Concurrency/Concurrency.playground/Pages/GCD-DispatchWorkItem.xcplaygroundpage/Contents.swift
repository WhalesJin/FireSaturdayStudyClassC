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

//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().sync(excute: blue)

// 1
//DispatchQueue.global().async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//DispatchQueue.main.async(execute: red)

// 2
//DispatchQueue.global().sync(execute: yellow) //엘로우 먼저, 블루랑 레드가 섞여서?
//DispatchQueue.global().async(execute: blue)
//DispatchQueue.main.async(execute: red)

// 3
//DispatchQueue.main.async(execute: yellow) // 일단 큐에 넣고 지나감 -> 마지막으로 들어감?
//DispatchQueue.global().async(execute: blue) // 일단 큐에 넣고 지나감 -> 새로운 스레드에서 작업
//DispatchQueue.global().sync(execute: red) // 일단 큐에 넣고 기다림 -> 새로운 스레드에서 작업이 끝날 때까지 기다림.

// 4
DispatchQueue.main.async(execute: yellow) // 일단 큐에 넣고 지나감 -> 마지막으로 들어감
DispatchQueue.global().sync(execute: blue) // 큐에 넣고 기다림 -> 새로운 스레드에서 작업이 끝날 때까지
DispatchQueue.global().async(execute: red) // 큐에 넣고 지나감 -> 새로운 스레드에서 작엄
// 따라서 블루 - 노랑, 빨강

//: [Next](@next)
