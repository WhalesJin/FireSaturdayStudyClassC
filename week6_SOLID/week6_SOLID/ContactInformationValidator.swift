//
//  ContactInformationValidator.swift
//  week6_SOLID
//
//  Created by 조호준 on 2023/06/03.
//

struct ContactInformationValidator {
    func checkName(name: String) -> String {
        let nameArray = name.components(separatedBy: " ")
        var name = ""
        
        for str in nameArray {
            name += str
        }
        
        return name
    }

    func checkAge(age: String) -> Int {
        let ageString = age.trimmingCharacters(in: .whitespaces)
        
        guard let age = Int(ageString), age < 1000 else {
            return -1
        }
        
        return age
    }

    func checkPhoneNumber(number: String) -> String {
        let phoneNumber = number.trimmingCharacters(in: .whitespaces)
        
        if phoneNumber.count < 11 {
            return ""
        }
        
        let numberArray = phoneNumber.components(separatedBy: "-")
        
        if numberArray.count == 3 {
            return phoneNumber
        } else {
            return ""
        }
    }
}
