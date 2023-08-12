//
//  PasswordViewController.swift
//  KeyChain_Practice
//
//  Created by 조호준 on 2023/08/12.
//

import UIKit

final class PasswordViewController: UIViewController {
    @IBOutlet private weak var oldPasswordTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    
    private let alert: UIAlertController = {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changePassword(_ sender: Any) {
        guard let oldPassword = oldPasswordTextField.text,
              let newPassword = newPasswordTextField.text,
              oldPassword != "",
              newPassword != ""
        else {
            showAlert(title: "비밀번호를 입력해주세요.")
            
            return
        }
        
        do {
            try KeychainManager.updatePasswordKeychain(oldPassword: oldPassword, newPassword: newPassword)
            
            present(alertForClose(), animated: true)
        } catch {
            showAlert(title: "존재하지 않는 비밀번호 입니다.")
        }
    }
    
    private func showAlert(title: String) {
        alert.title = title
        
        present(alert, animated: true)
    }
    
    private func alertForClose() -> UIAlertController {
        let alert = UIAlertController(title: "비밀번호가 변경되었습니다.", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        alert.addAction(alertAction)
        
        return alert
    }
}
