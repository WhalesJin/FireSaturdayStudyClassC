//
//  main.swift
//  2_week3_POP
//
//  Created by Dasan on 2023/07/15.
//

let macBook = MacBook(allowableChargeWattPerHour: 96, currentBattery: 40)

macBook.chargeBattery(charger: appleWatchCharger)
macBook.chargeBattery(charger: iPadCharger)
macBook.chargeBattery(charger: macBookCharger1)

var gucciBag = Bag()

gucciBag.put(item: macBookCharger1)
gucciBag.put(item: macBook)
gucciBag.showItems()
