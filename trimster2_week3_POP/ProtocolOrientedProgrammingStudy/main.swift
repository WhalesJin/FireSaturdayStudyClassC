//
//  main.swift
//  ProtocolOrientedProgrammingStudy
//
//  Created by 조호준 on 2023/07/15.
//

let macBook = MacBook(maximumWattPerHour: 30, currentBattery: 50)
let iPadCharger = Charger.iPad
macBook.chargeBattery(charger: iPadCharger)

var bag = Bag()
bag.put(item: macBook)
bag.put(item: iPadCharger)
bag.getItems()
