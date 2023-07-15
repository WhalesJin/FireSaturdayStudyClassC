//
//  Bag.swift
//  ProtocolOrientedProgrammingStudy
//
//  Created by 조호준 on 2023/07/15.
//

protocol Portable {}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func getItems() {
        items.forEach { item in
            print(item.self)
        }
    }
}
