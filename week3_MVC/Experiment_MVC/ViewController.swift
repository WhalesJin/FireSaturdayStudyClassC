//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    var phoneNumber: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = [] {
        willSet(newValue) {
            print("----- willSet \(newValue)")
        }
        didSet(oldValue) {
            print("----- didSet \(oldValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(hitCheckButton), name: NSNotification.Name("register"), object: nil)
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
        NotificationCenter.default.post(name: NSNotification.Name("register"), object: nil)
    }
    
    @IBAction @objc func hitCheckButton(_ sender: Any) {
        nameLabel.text = registrantList.last?.name
        phoneNumberLabel.text = registrantList.last?.phoneNumber
    }
    
    func register() {
        guard let name = nameTextField.text,
              let phoneNumber = phoneNumberTextField.text else {
            return
        }
        
        registrantList.append(Registrant(name: name, phoneNumber: phoneNumber))
    }
}
