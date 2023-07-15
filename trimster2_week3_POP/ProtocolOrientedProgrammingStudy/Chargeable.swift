//
//  Chargeable.swift
//  ProtocolOrientedProgrammingStudy
//
//  Created by 조호준 on 2023/07/15.
//

typealias WattPerHour = Int
typealias Watt = Int

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}

extension Chargeable {
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        if maximumWattPerHour > chargeableWattPerHour {
            return chargeableWattPerHour
        }
        
        return maximumWattPerHour
    }
}
