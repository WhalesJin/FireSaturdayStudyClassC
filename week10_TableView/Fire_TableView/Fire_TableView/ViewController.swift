//
//  ViewController.swift
//  Fire_TableView
//
//  Created by Whales on 2023/07/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let american: [String] = ["햄버거", "피자", "아메리카노"]
    let chinese: [String] = ["탕수육"]
    let korean: [String] = ["비빔밥", "돼지갈비"]
    let japanese: [String] = ["스시", "스윙스(돈까스)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "메뉴판"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // section에 해당하는 row 몇 개?
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
    
    // row마다 해당되는 셀을 나에게 달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomTableViewCell

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
}


















