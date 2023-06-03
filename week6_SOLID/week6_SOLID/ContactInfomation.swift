//
//  ContactInfomation.swift
//  week6_SOLID
//
//  Created by 조호준 on 2023/06/03.
//

struct ContactInformation {
    let name: String
    let age: Int
    let phoneNumber: String
    
    func toString() -> String {
        return "- " + self.name + " / " + String(self.age) + " / " + self.phoneNumber
    }
}
