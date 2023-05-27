//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var neme: String = String()
    var phoneNumber: String = String()
}

//extension Notification.Name {
//    static let newRegistrant = "newRegistrant"
//}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = []
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print(Notification.Name("newRegistrant"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 지금부터 "name"을 관찰하겠다!(시점)
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: Notification.Name("newRegistrant"), object: nil)
        let test = Notification.Name("newRegistrant")
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
        NotificationCenter.default.post(name: Notification.Name("newRegistrant"), object: nil)
        
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
//        let resentIndex: Int = registrantList.count - 1
//
//        nameLabel.text = registrantList[resentIndex].neme
//        phoneNumberLabel.text = registrantList[resentIndex].phoneNumber
    }
    
    @objc func changeLabel() {
        let resentIndex: Int = registrantList.count - 1
        
        nameLabel.text = registrantList[resentIndex].neme
        phoneNumberLabel.text = registrantList[resentIndex].phoneNumber
    }
    
    func register() {
        var registrant: Registrant = Registrant()
        
        guard let name = nameTextField.text,
              let phoneNumber = phoneNumberTextField.text
        else { return }
        
        registrant.neme = name
        registrant.phoneNumber = phoneNumber
        
        registrantList.append(registrant)
    }
}
