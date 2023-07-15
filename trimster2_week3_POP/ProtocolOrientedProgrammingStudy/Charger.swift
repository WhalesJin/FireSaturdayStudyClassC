//
//  Charger.swift
//  ProtocolOrientedProgrammingStudy
//
//  Created by 조호준 on 2023/07/15.
//

struct Charger: Chargeable, Portable {
    var maximumWattPerHour: WattPerHour
    
    static let appleWatch = Charger(maximumWattPerHour: 5)
    static let iPhone = Charger(maximumWattPerHour: 18)
    static let iPad = Charger(maximumWattPerHour: 30)
    static let macBookAir = Charger(maximumWattPerHour: 96)
    static let macBookPro = Charger(maximumWattPerHour: 106)
}
