//
//  ViewController.swift
//  KeyChain_Practice
//
//  Created by coda on 2022/01/10.
//

import UIKit

protocol Identifier { }

extension Identifier where Self: UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}

final class LogInViewController: UIViewController, Identifier {
    
    @IBOutlet private weak var pwTextField: UITextField!
    
    private var diaryViewController: DiaryViewController?
    private var passwordViewController: PasswordViewController?
    private let alert: UIAlertController = {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
        passwordViewController = self.storyboard?.instantiateViewController(identifier: "password") as? PasswordViewController
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        guard let password = pwTextField.text,
              password != ""
        else {
            showAlert(title: "비밀번호를 입력해주세요.")
            
            return
        }
        // UserDefault
//        loginUserDefaults()
        
        // Keychain
        do {
            if try KeychainManager.loginKeychain(password: password) {
                presentDiaryViewController()
            } else {
                showAlert(title: "비밀번호가 틀렸습니다.")
            }
        } catch {
            showAlert(title: "비밀번호가 틀렸습니다.")
        }
    }
    
    @IBAction func addNewPassword(_ sender: Any) {
        guard let password = pwTextField.text,
              password != ""
        else {
            showAlert(title: "비밀번호를 입력해주세요.")
            
            return
        }
        // UserDefault
//        addPasswordUserDefaults(password: password)
        
        // Keychain
        do {
            try KeychainManager.addPasswordKeychain(password: password)
            
            showAlert(title: "비밀번호가 등록되었습니다.")
        } catch {
            showAlert(title: "비밀번호 등록에 실패했습니다.")
        }
    }
    
    @IBAction func updatePassword(_ sender: Any) {
        guard let passwordViewController = passwordViewController else { return }
        present(passwordViewController, animated: true)
    }
    
    private func presentDiaryViewController() {
        guard let diaryViewController = diaryViewController else { return }
        diaryViewController.modalPresentationStyle = .fullScreen
        present(diaryViewController, animated: true)
    }
    
    private func showAlert(title: String) {
        alert.title = title
        
        present(alert, animated: true)
    }
}

// MARK: - UserDefault
extension LogInViewController {
    private func loginUserDefaults() {
        if UserDefaults.standard.string(forKey: LogInViewController.identifier) == pwTextField.text {
            presentDiaryViewController()
            
            print("로그인 되었습니다.")
        } else {
            print("비밀번호가 틀렸습니다.")
        }
    }
    
    private func addPasswordUserDefaults(password: String) {
        UserDefaults.standard.set(password, forKey: LogInViewController.identifier)
        
        print("비밀번호가 저장되었습니다.")
    }
}
