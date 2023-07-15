//
//  MacBook.swift
//  2_week3_POP
//
//  Created by Dasan on 2023/07/15.
//

import Foundation

struct MacBook: Portable {
    let allowableChargeWattPerHour: WattPerHour
    let currentBattery: WattPerHour
    let maxBattery: WattPerHour = 100
    
    func chargeBattery(charger: Chargeable) {
        let chargeWattPerHour = charger.convert(chargeableWattPerHour: allowableChargeWattPerHour)
        
        let fullChargeTime = Double(maxBattery - currentBattery) / Double(chargeWattPerHour)
        
        print(String(format: "충전에 걸린 시간은 %.1f 시간입니다.", fullChargeTime))
    }
}
