//
//  ContactInformationList.swift
//  week6_SOLID
//
//  Created by 조호준 on 2023/06/03.
//

import Foundation

struct ContactInformationList {
    private var contactInformationArray: [ContactInformation] = []
    
    mutating func start() {
        while true {
            print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
            print("메뉴를 선택해주세요 : ", terminator: "")
            
            let selectedMenu = readLine()

            switch selectedMenu {
            case Menu.addInformation.select:
                addInformation()
            case Menu.readList.select:
                readInformation()
            case Menu.searchInfomation.select:
                searchInfomation()
            case Menu.quit.select:
                print("\n[프로그램 종료]")
                
                return
            default:
                print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
            }
        }
    }

    private mutating func addInformation() {
        print("연락처 정보를 입력해주세요 : ", terminator: "")

        let inputInformation = readLine()?.components(separatedBy: "/")
        let contactInformationValidator = ContactInformationValidator()

        guard let inputInformation else {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            
            return
        }
        
        if inputInformation.count == 1 {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        } else {
            let name = contactInformationValidator.checkName(name: inputInformation[0])
            let age = contactInformationValidator.checkAge(age: inputInformation[1])
            let phoneNumber = contactInformationValidator.checkPhoneNumber(number: inputInformation[2])
            
            if age == -1 {
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } else if phoneNumber == "" {
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } else {
                print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
                
                contactInformationArray.append(ContactInformation(name: name, age: age, phoneNumber: phoneNumber))
            }
        }
    }
    
    private mutating func readInformation() {
        contactInformationArray.sort{ $0.name < $1.name }
        
        for information in contactInformationArray {
            print(information.toString())
        }
    }

    private func searchInfomation() {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        
        let name = readLine()
        var countPrint = 0
        
        guard let name else {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            
            return
        }
        
        for information in contactInformationArray {
            if information.name == name {
                print(information.toString())
                countPrint += 1
            }
        }
        
        if countPrint == 0 {
            print("연락처에 \(name) 이(가) 없습니다.")
        }
    }
}
