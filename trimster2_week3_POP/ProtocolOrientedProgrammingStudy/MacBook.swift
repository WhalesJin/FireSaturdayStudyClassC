//
//  MacBook.swift
//  ProtocolOrientedProgrammingStudy
//
//  Created by 조호준 on 2023/07/15.
//

struct MacBook: Portable {
    let maximumWattPerHour: WattPerHour
    let currentBattery: Watt
    let maximumBattery: Watt = 100
    
    func chargeBattery(charger: Chargeable) {
        let chargeWatt = Double(charger.convert(chargeableWattPerHour: maximumWattPerHour))
        let needToChargeBattery = Double(maximumBattery - currentBattery)
        
        print("충전 시간 : \(needToChargeBattery / chargeWatt)")
    }
}
