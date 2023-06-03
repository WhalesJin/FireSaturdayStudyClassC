//
//  Menu.swift
//  week6_SOLID
//
//  Created by 조호준 on 2023/06/03.
//

enum Menu: String {
    case addInformation = "1"
    case readList = "2"
    case searchInfomation = "3"
    case quit = "x"
    
    var select: String {
        self.rawValue
    }
}
