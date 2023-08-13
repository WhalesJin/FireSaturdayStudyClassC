//
//  ViewController.swift
//  KeyChain_Practice
//
//  Created by coda on 2022/01/10.
//

import UIKit

final class LogInViewController: UIViewController, Identifier {
    @IBOutlet weak var pwTextField: UITextField!
    var diaryViewController: DiaryViewController?
    var changePasswordViewController: ChangePasswordViewController?
    //private let userDefault = UserDefault()
    private let keyChain = KeyChain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
        changePasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "changePassword") as? ChangePasswordViewController
        
        keyChain.deleteKeyChain() // 새로운 비밀번호 등록을 위한 keychain 모두 삭제
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        guard let password = pwTextField.text else { return }
//        let loginStatus = userDefault.matchDefaultValues(password, LogInViewController.reuseIdentifier)
        let loginStatus = keyChain.matchKeyChain(password)

        switch loginStatus {
        case .matchedPassword:
            presentDiaryView()
        case .notMatchedPassword:
            present(Login.configureAlert(message: LoginStatus.notMatchedPassword.message), animated: true)
        default:
            print("알 수 없는 에러입니다.")
        }
        
        pwTextField.text = ""
    }
    
    @IBAction func addNewPassword(_ sender: Any) {
        guard let password = pwTextField.text else { return }
//        let loginStatus = userDefault.settingDefaultValues(password, LogInViewController.reuseIdentifier)
        let loginStatus = keyChain.addKeyChain(password)
        
        switch loginStatus {
        case .newPassword:
            present(Login.configureAlert(message: LoginStatus.newPassword.message), animated: true)
        case .alreadyRegisteredPassword:
            present(Login.configureAlert(message: LoginStatus.alreadyRegisteredPassword.message), animated: true)
        default:
            print("알 수 없는 에러입니다.")
        }
        
        resetTextField()
    }
    
    @IBAction func changePassword(_ sender: Any) {
        presentChangePasswordView()
    }

}

extension LogInViewController {
    private func resetTextField() {
        pwTextField.text = ""
    }
    
    private func presentDiaryView() {
        guard let diaryViewController = diaryViewController else { return }
        diaryViewController.modalPresentationStyle = .fullScreen
        present(diaryViewController, animated: true)
    }
    
    private func presentChangePasswordView() {
        guard let changePasswordViewController = changePasswordViewController else { return }
        changePasswordViewController.modalPresentationStyle = .automatic
        present(changePasswordViewController, animated: true)
    }
}
