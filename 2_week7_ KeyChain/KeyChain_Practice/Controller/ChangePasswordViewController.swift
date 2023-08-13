//
//  ChangePasswordViewController.swift
//  KeyChain_Practice
//
//  Created by Dasan on 2023/08/12.
//

import UIKit

final class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var newPwTextField: UITextField!
    private let keyChain = KeyChain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapChangePasswordButton(_ sender: UIButton) {
        guard let password = pwTextField.text,
              let newPassword = newPwTextField.text else { return }
        
        let loginStatus = keyChain.updateKeyChain(password, newPassword)
        
        switch loginStatus {
        case .changedPassword:
            present(Login.configureAlert(message: LoginStatus.changedPassword.message), animated: true)
        case .notMatchedPassword:
            present(Login.configureAlert(message: LoginStatus.notMatchedPassword.message), animated: true)
        case .duplicatedPassword:
            present(Login.configureAlert(message: LoginStatus.duplicatedPassword.message), animated: true)
        default:
            print("알 수 없는 에러입니다.")
        }
        
        resetTextField()
    }
    
    private func resetTextField() {
        pwTextField.text = ""
        newPwTextField.text = ""
    }
}
