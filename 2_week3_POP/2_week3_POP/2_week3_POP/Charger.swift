//
//  Charger.swift
//  2_week3_POP
//
//  Created by Dasan on 2023/07/15.
//

struct Charger: Chargeable, Portable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        if chargeableWattPerHour < maximumWattPerHour {
            return chargeableWattPerHour
        }
        return maximumWattPerHour
    }
    
    
}

let appleWatchCharger = Charger(maximumWattPerHour: 5)
let iPhoneFastCharger = Charger(maximumWattPerHour: 18)
let iPadCharger = Charger(maximumWattPerHour: 30)
let macBookCharger1 = Charger(maximumWattPerHour: 96)
let macBookCharger2 = Charger(maximumWattPerHour: 106)
