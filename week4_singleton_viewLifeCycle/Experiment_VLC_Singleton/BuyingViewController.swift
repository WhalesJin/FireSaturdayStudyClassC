//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
    weak var delegate: calculateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BuyingViewController: viewDidLoad 메모리에 올라옴")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("BuyingViewController: 뷰 나타날 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BuyingViewController: 뷰 나타난 직후")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("BuyingViewController: 뷰 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("BuyingViewController: 뷰 사라진 직후")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpBuyButton(_ sender: Any) {
        //let pointManager = PointManager.shared
        
//        if pointManager.point >= 50 {
//            pointManager.point -= 50
//        } else {
//            print("포인트가 부족합니다.")
//        }
        delegate?.calculate(point: 50)
        
        dismiss(animated: true, completion: nil)
    }
    
}
