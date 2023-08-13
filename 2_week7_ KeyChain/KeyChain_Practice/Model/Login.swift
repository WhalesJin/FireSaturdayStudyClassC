//
//  Login.swift
//  KeyChain_Practice
//
//  Created by Dasan on 2023/08/12.
//

import UIKit

enum LoginStatus: Equatable {
    case matchedPassword
    case newPassword
    case notMatchedPassword
    case changedPassword
    case duplicatedPassword
    case alreadyRegisteredPassword
    case unknown(status: OSStatus)
    
    var message: String {
        switch self {
        case .matchedPassword:
            return "로그인 성공"
        case .newPassword:
            return "새로운 비밀번호가 등록되었습니다."
        case .notMatchedPassword:
            return "비밀번호를 확인해주세요."
        case .changedPassword:
            return "비밀번호가 변경되었습니다."
        case .duplicatedPassword:
            return "기존의 비밀번호와 같습니다."
        case .alreadyRegisteredPassword:
            return "이미 등록된 비밀번호가 있습니다."
        case .unknown(let status):
            return SecCopyErrorMessageString(status, nil)! as String
        }
    }
}

class Login {
    static func configureAlert(message: String) -> UIAlertController {
        let defaultAction = UIAlertAction(title: "확인", style: .default)
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(defaultAction)
        
        return alert
    }
}
