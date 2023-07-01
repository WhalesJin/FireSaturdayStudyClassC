//
//  ViewController.swift
//  Sat_TableView
//
//  Created by Whales on 2023/07/01.
//

// switch 문을 따로 빼보기
import UIKit

// MARK: - 실험1
/*
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let american: [String] = ["햄버거", "피자", "아메리카노"]
    let chinese: [String] = ["탕수육"]
    let korean: [String] = ["비빔밥", "돼지갈비"]
    let japanese: [String] = ["스시", "스윙스(돈까스)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "메뉴판"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return american.count
        case 1:
            return chinese.count
        case 2:
            return korean.count
        case 3:
            return japanese.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "American"
        case 1:
            return "Chinese"
        case 2:
            return "Korean"
        case 3:
            return "Japanese"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let text: String

        switch indexPath.section {
        case 0:
            text = american[indexPath.row]
        case 1:
            text = chinese[indexPath.row]
        case 2:
            text = korean[indexPath.row]
        case 3:
            text = japanese[indexPath.row]
        default:
            text = ""
        }
        
        cell.menuLabel.text = text
        
        return cell
    }
    

}
*/

// MARK: - 실험2

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    let cellIdentifier: String = "cell"
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "메뉴판"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu[FoodType.American]?.count ?? 0
        case 1:
            return menu[FoodType.Chinese]?.count ?? 0
        case 2:
            return menu[FoodType.Korean]?.count ?? 0
        case 3:
            return menu[FoodType.Japanese]?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return FoodType.American.name
        case 1:
            return FoodType.Chinese.name
        case 2:
            return FoodType.Korean.name
        case 3:
            return FoodType.Japanese.name
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let menuDetail: Food

        switch indexPath.section {
        case 0:
            menuDetail = menu[FoodType.American]?[indexPath.row] ?? Food(name: "", price: 0)
        case 1:
            menuDetail = menu[FoodType.Chinese]?[indexPath.row] ?? Food(name: "", price: 0)
        case 2:
            menuDetail = menu[FoodType.Korean]?[indexPath.row] ?? Food(name: "", price: 0)
        case 3:
            menuDetail = menu[FoodType.Japanese]?[indexPath.row] ?? Food(name: "", price: 0)
        default:
            menuDetail = Food(name: "", price: 0)
        }
        
        cell.textLabel?.text = "\(menuDetail.name)"
        cell.detailTextLabel?.text = "\(menuDetail.price)원"
        
        return cell
    }
    
}

