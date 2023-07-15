//
//  Bag.swift
//  2_week3_POP
//
//  Created by Dasan on 2023/07/15.
//

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func showItems() {
        for item in items {
            print("\(item)")
        }
    }
}
