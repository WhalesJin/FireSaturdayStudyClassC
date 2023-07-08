//: [Previous](@previous)

import Foundation

import Foundation

let yagom = BlockOperation {
    print("🐻🐻🐻🐻🐻")
}

let noroo = BlockOperation {
    print("🦌🦌🦌🦌🦌")
}

let odong = BlockOperation {
    print("🌳🌳🌳🌳🌳")
}

odong.addDependency(yagom)

print(yagom.isReady) // true
print(odong.isReady) // false


// odong.start() << 에러!
// odong은 yagom의 실행이 끝날 때까지 실행될 수 없기 때문입니다

yagom.start()
odong.start()

//: [Next](@next)
