//: [Previous](@previous)

import Foundation

//DispatchQueue.main.sync {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}

/* error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x180145270).
The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.
*/

DispatchQueue.global().async {
    DispatchQueue.main.sync {
        for _ in 1...5 {
            print("😀😀😀😀😀")
            sleep(1)
        }
    }
}

for _ in 1...5 {
    print("🥶🥶🥶🥶🥶")
    sleep(2)
}



//: [Next](@next)
