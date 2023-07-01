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
    
    var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(hitCheckButton),
                         name: nil, object: nil)
        // hitCheckButton 대신 쓸거니까 selector
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
        NotificationCenter.default.post(name: Notification.Name("CheckRegistrant"), object: nil)
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        nameLabel.text = registrantList.last?.name
        phoneNumberLabel.text = registrantList.last?.phoneNumber
    }
    
    func register() {
        if let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text {
            registrantList.append(Registrant(name: name, phoneNumber: phoneNumber))
        }
    }
}
