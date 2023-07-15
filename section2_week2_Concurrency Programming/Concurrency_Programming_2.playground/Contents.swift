import Foundation
/*
//MARK: - main.async
DispatchQueue.main.async {
    for _ in 1...5 {
        print("😳😳😳😳😳")
        sleep(1)
    }
}

//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(1)
//    }
//}
// async라 기다리지 않지만 단일 스레드 작업이라 동시처리 X
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶

for _ in 1...5 {
    print("🥶🥶🥶🥶🥶")
    sleep(1)
}
//😳 작업을 DispatchQueue에 던져놓고
//main 스레드에서는 다음 코드블럭 실행
//async니까!
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
*/

/*
//MARK: - global().async
DispatchQueue.global().async {
    for _ in 1...5 {
        print("😳😳😳😳😳")
        sleep(1)
    }
}

DispatchQueue.global().async {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

DispatchQueue.global().async {
    for _ in 1...5 {
        print("🥵🥵🥵🥵🥵")
        sleep(1)
    }
}
// 다른 스레드, 비동기
// 어떤 코드가 먼저 실행될지 예측 불가. 논리적으로 정확한 순서를 기대하기는 어렵다.
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥵🥵🥵🥵🥵
//🥵🥵🥵🥵🥵
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥵🥵🥵🥵🥵
//😳😳😳😳😳
//🥵🥵🥵🥵🥵
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥵🥵🥵🥵🥵
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶


//MARK: - global().sync
DispatchQueue.global().sync {
    for _ in 1...5 {
        print("😳😳😳😳😳")
        sleep(1)
    }
}

DispatchQueue.global().sync {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

for _ in 1...5 { // main 스레드에서 동작하는 코드
    print("🥵🥵🥵🥵🥵")
    sleep(1)
}

// 다른 스레드, 동기
// sync니까 기다려야지!!
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//😳😳😳😳😳
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥶🥶🥶🥶🥶
//🥵🥵🥵🥵🥵
//🥵🥵🥵🥵🥵
//🥵🥵🥵🥵🥵
//🥵🥵🥵🥵🥵
//🥵🥵🥵🥵🥵
*/

//MARK: - DispatchWorkItem 코드블록 캡슐화 -> 타입명시, 직관적인 코드 작성 가능

let red = DispatchWorkItem {
    for _ in 1...3 {
        print("🥵🥵🥵🥵🥵")
        sleep(1)
    }
}

let yellow = DispatchWorkItem {
    for _ in 1...3 {
        print("😳😳😳😳😳")
        sleep(1)
    }
}

let blue = DispatchWorkItem {
    for _ in 1...3 {
        print("🥶🥶🥶🥶🥶")
        sleep(1)
    }
}

/*
DispatchQueue.main.async(execute: yellow) // 이렇게 실행 가능
DispatchQueue.global().sync(execute: blue)

// async로 메인 큐에 던지고 그사이에 메인스레드에서는 global.sync 작업이 진행되고!!
// 그래서 b3 y3
*/
/*
// 1 순서가 아니라 동시라 순서를 정하면 안된다. 순서는 알 수 없다.
DispatchQueue.global().async(execute: yellow) // 새 스레드. 안기다림
DispatchQueue.global().sync(execute: blue) // 새 스레드. 기다림
DispatchQueue.main.async(execute: red) // 메인 스레드. 안기다림
//

🥶🥶🥶🥶🥶
😳😳😳😳😳
🥶🥶🥶🥶🥶
😳😳😳😳😳
🥶🥶🥶🥶🥶
😳😳😳😳😳
😳😳😳😳😳
🥵🥵🥵🥵🥵
🥵🥵🥵🥵🥵
😳😳😳😳😳
🥵🥵🥵🥵🥵
😳😳😳😳😳
*/
/*
// 2
DispatchQueue.global().sync(execute: yellow) // 새 스레드. 기다림
DispatchQueue.global().async(execute: blue) // 새 스레드. 안기다림
DispatchQueue.main.async(execute: red) // 메인 스레드. 안기다림
// y3 r&b 드디어 성공!!!!
*/

/*
// 3
DispatchQueue.main.async(execute: yellow) // 메인 스레드. 안기다림
DispatchQueue.global().async(execute: blue) // 새 스레드. 기다림
DispatchQueue.global().sync(execute: red) // 새 스레드. 안기다림

// main.async는 맨밑으로 가고 (다시)!!
*/

/*
// 4
DispatchQueue.main.async(execute: yellow) // 메인 스레드. 안기다림
DispatchQueue.global().sync(execute: blue) // 새 스레드. 기다림
DispatchQueue.global().async(execute: red) // 새 스레드. 안기다림

// b3 ,r&y 성공 ㅠㅠㅠ 울어 🥹 그치만 꼭 다시 보기
*/
//let startTime = Date()
//// .now()(지금) thread 생성 후 5초
//func after() {
//    DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: yellow)
//}
//
//after()
//
//
//let workTime = Date().timeIntervalSince(startTime)
//
//print(workTime) // 시간 궁금했는데😕 이건 나중에 해보자!


// .now()(지금) thread 생성 후 5초
// deadline은 스톱워치 5초
DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: yellow)

// wallDeadline
DispatchQueue.global().asyncAfter(wallDeadline: .now() + 5, execute: blue)
