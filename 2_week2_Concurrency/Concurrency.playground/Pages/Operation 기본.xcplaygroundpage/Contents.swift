//: [Previous](@previous)

import Foundation

let operation = BlockOperation {
    print("오퍼레이션이다")
    //CheckOperationState()
}

operation.addExecutionBlock {
    print("오퍼레이션의 동작이 끝나고 난 후 코드임")
    CheckOperationState()
}

operation.completionBlock = {
    print("오퍼레이션과 그와 관련된 executionBlock들이 모두 실행된 다음에 실행시킬 수 있음")
    CheckOperationState()
}

CheckOperationState()

// 직접 실행하기
//operation.start()

// OperationQueue로 실행하기
let operationQueue = OperationQueue()
operationQueue.addOperation(operation)

func CheckOperationState() {
    print("isReady: \(operation.isReady)")
    print("isExecuting: \(operation.isExecuting)")
    print("isCancelled: \(operation.isCancelled)")
    print("isFinished: \(operation.isFinished)")
}

//: [Next](@next)
