import Foundation

/* MARK: - GCD 기본
DispatchQueue.main.async {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

DispatchQueue.main.async {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

/*
 😀😀😀😀😀
 😀😀😀😀😀
 😀😀😀😀😀
 😀😀😀😀😀
 😀😀😀😀😀
 🥶🥶🥶🥶🥶
 🥶🥶🥶🥶🥶
 🥶🥶🥶🥶🥶
 🥶🥶🥶🥶🥶
 🥶🥶🥶🥶🥶
*/

DispatchQueue.main.async {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

for _ in 1...5 {
    print("🥶🥶🥶🥶🥶")
    sleep(2)
}
/*
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
*/

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
/* 랜덤
😀😀😀😀😀
🥵🥵🥵🥵🥵
🥶🥶🥶🥶🥶
🥵🥵🥵🥵🥵
😀😀😀😀😀
🥵🥵🥵🥵🥵
🥶🥶🥶🥶🥶
😀😀😀😀😀
🥵🥵🥵🥵🥵
😀😀😀😀😀
🥵🥵🥵🥵🥵
🥶🥶🥶🥶🥶
😀😀😀😀😀
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
*/

DispatchQueue.global().sync {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

DispatchQueue.global().sync {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

for _ in 1...5 {
    print("🥵🥵🥵🥵🥵")
    sleep(1)
}
// main 스레드에서 동작하는 코드

/* - 출력
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
😀😀😀😀😀
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥶🥶🥶🥶🥶
🥵🥵🥵🥵🥵
🥵🥵🥵🥵🥵
🥵🥵🥵🥵🥵
🥵🥵🥵🥵🥵
🥵🥵🥵🥵🥵
*/
// MARK: - DispatchWorkItem
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

// 그럼 main/global, sync/async를 복습해볼 겸 아래의 코드들은 어떻게 동작할지 유추해보고 직접 실행해봅시다!

// 1
DispatchQueue.global().async(execute: yellow)
DispatchQueue.global().sync(execute: blue)
DispatchQueue.main.async(execute: red)
// 2
DispatchQueue.global().sync(execute: yellow)
DispatchQueue.global().async(execute: blue)
DispatchQueue.main.async(execute: red)
// 3
DispatchQueue.main.async(execute: yellow)
DispatchQueue.global().async(execute: blue)
DispatchQueue.global().sync(execute: red)
// 4
DispatchQueue.main.async(execute: yellow)
DispatchQueue.global().sync(execute: blue)
DispatchQueue.global().async(execute: red)

// MARK: - asyncAfter

// 지금(.now())으로부터 5초 후에 yellow라는 DispatchWorkItem을 실행시킨다
DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: yellow)

// wallDeadline은 시스템(기기)의 시간을 기준
// deadline은 스톱워치로 측정하듯이 5초를 카운트해서 작업이 시작되고, wallDeadline은 지금 5시니까 5시 5초에 작업을 시작해야지 와 같이 작업을 수행하는 것
DispatchQueue.global().asyncAfter(wallDeadline: .now() + 5, execute: blue)

// MARK: - asyncAndWait

// 비동기 작업이 끝나는 시점을 기다릴 수 있다. 비동기로 처리되는 어떤 동작이 끝나기를 의도적으로 기다려야할 때 사용

DispatchQueue.global().asyncAndWait(execute: yellow)
print("Finished!")
*/

// MARK: GCD 심화
//
let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

let myDispatch = DispatchQueue(label: "Odong", attributes: .initiallyInactive)

myDispatch.async(execute: yellow) // 코드 블록 호출 안됨.
myDispatch.activate()
