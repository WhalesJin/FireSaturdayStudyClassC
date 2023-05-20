//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

// 싱글톤 실험
class PointManager {
    var point: Int = 50
    static let shared = PointManager()

    private init() {}
}
//// 델리게이션 실험
//protocol PointManager {
//    func updatePoint()
//}

class MainViewController: UIViewController {
    @IBOutlet weak var pointLabel: UILabel!
    
//    var point: Int = 50 // 델리게이션 실험
//    let buyingViewController = BuyingViewController() // 델리게이션 실험
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main viewDidLoad")
        pointLabel.text = String(PointManager.shared.point) // 싱글톤 실험
//        pointLabel.text = String(point) // 델리게이션 실험
//        buyingViewController.delegate = self // 델리게이션 실험
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Main viewWillAppear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Main viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Main viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Main viewDidDisappear")
    }
    
    @IBAction func tapRefreshButton(_ sender: UIButton) {
        pointLabel.text = String(PointManager.shared.point) // 싱글톤 실험
//        pointLabel.text = String(point) // 델리게이션 실험
        print("Refresh")
    }
//    // 델리게이션 실험
//    @IBAction func showBuyingViewController(_ sender: UIButton) {
////        guard let buyingViewController = self.storyboard?.instantiateViewController(identifier: "BuyingViewController") else {return}
//        self.present(buyingViewController, animated: true)
//    }
//
//    // 델리게이션 실험
//    func updatePoint() {
//        point -= 50
//    }
}
