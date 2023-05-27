//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

// static vs final class: 둘다 오버라이딩을 금지한다!
// - static 메서드, 타입 메소드이고 자식클래스에서 override할 수 없다.
// - final class 메소드, 타입 메소드이고 자식 클래스에서 override할 수 없다.
//   - final class는 부모 클래스의 class 메소드를 override할 수 있지만 그 이후는 상속할 수 없게 막아버린다.
// 타입 메서드: 형식(Type)에 연관된 메서드로, 인스턴스 생성 없이 **형식 이름만 알면** 호출이 가능하다.
protocol calculateDelegate: AnyObject {
    func calculate(point: Int)
}

class PointManager {
    var point: Int = 50
}

//class PointManager {
//    static let shared = PointManager()
//    var point: Int = 50
//
//    private init() {}
//}

class MainViewController: UIViewController, calculateDelegate {
    
    let pointManager = PointManager()
    @IBOutlet weak var pointLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue.destination 객체를 어떤 ViewController 타입으로 다운캐스팅을 할 수 있을 때
        if let destination = segue.destination as? BuyingViewController {
            destination.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController: viewDidLoad 메모리에 올라옴")
        updatePointLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainViewController: 뷰 나타날 예정")
        //updatePointLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainViewController: 뷰 나타난 직후")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MainViewController: 뷰 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MainViewController: 뷰 사라진 직후")
    }
    
    @IBAction func touchUpUpdateButton(_ sender: Any) {
        updatePointLabel()
    }
    
    func updatePointLabel() {
        //let pointManager = PointManager.shared
        pointLabel.text = String(pointManager.point)
    }
    
    func calculate(point: Int) {
        if pointManager.point >= point {
            pointManager.point -= point
            //updatePointLabel()
        } else {
            print("포인트 잔액이 부족합니다.")
        }
    }
}

