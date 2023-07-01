//
//  main.swift
//  week7
//
//  Created by Dasan on 2023/06/10.
//

import Foundation

// 실험 1: Closure를 활용해 게임 캐릭터에 스킬 적용하기
struct Character {
    let name: String
    
    mutating func tabShiftKey(skill: () -> Void) {
        print("\(self.name) 은(는)", terminator: " ")
        skill()
    }
}

var dasan: Character = Character(name: "다산")
var kobe: Character = Character(name: "코비")
var moon: Character = Character(name: "문")
var whales: Character = Character(name: "웨일")
var wonbi: Character = Character(name: "원비")
var zion: Character = Character(name: "시온")

let 포효: () -> Void = { print("주위의 괴물들이 공포에 질려 도망치게 하였다!") }
let 도발: () -> Void = { print("주위의 괴물을 격분시켜 맹렬히 공격하였다!") }
let 찌르기: () -> Void = { print("투창 또는 창 유형의 무기를 빠르게 연속으로 찔러 공격하였다!") }
let 라이트닝볼트: () -> Void = { print("마법으로 투창을 번개의 창으로 전환하였다!") }
let 인페르노: () -> Void = { print("연속으로 불줄기를 방출하여 적을 태웠다!") }
let 메테오: () -> Void = { print("하늘에서 운석을 소환하여 적을 으스러뜨리고 불태웠다!") }

dasan.tabShiftKey(skill: 포효)
kobe.tabShiftKey(skill: 도발)
moon.tabShiftKey(skill: 라이트닝볼트)
wonbi.tabShiftKey(skill: 메테오)

whales.tabShiftKey {
    print("신성한 힘으로 방패를 강화하였다!")
}

zion.tabShiftKey(skill: 인페르노)


// 실험2: 고차함수 활용해보기
var studyClassC: [String] = ["whales", "moon", "kobe"]
studyClassC.append("dasan")

// map: 컨테이너의 요소를 변환하여 새로운 컨테이너를 만듦
let uppercasedName = studyClassC.map { $0.uppercased() }
print(uppercasedName)

// filter: 조건을 만족하는 컨테이너의 요소로 새로운 컨테이너를 만듦
let longName = studyClassC.filter { $0.count > 4 }
print(longName)

// reduce: 컨테이너의 요소들을 합침
let reduceNames = studyClassC.reduce("") {
    $0 + String($1.first!.uppercased())
}

print(reduceNames)

//var test = [1, 2, 3]
//
//let test2 = test.reduce(10) { result, number in
//    result * number
//}
//
//print(test2)
