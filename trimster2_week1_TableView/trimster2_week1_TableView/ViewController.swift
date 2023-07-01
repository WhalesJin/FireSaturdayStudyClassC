//
//  ViewController.swift
//  trimster2_week1_TableView
//
//  Created by 조호준 on 2023/07/01.
//

import UIKit

enum FoodType: Int {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var name: String {
        switch self {
        case .American:
            return "American"
        case .Chinese:
            return "Chinese"
        case .Korean:
            return "Korean"
        case .Japanese:
            return "Japanese"
        }
    }
}

struct Food {
    let name: String
    var price: Int
}

final class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

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
        
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "메뉴판"
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSectionByFoodTypeCount(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAt(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FoodType(rawValue: section)?.name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func numberOfRowsInSectionByFoodTypeCount(section: Int) -> Int {
        switch section {
        case 0:
            return menu[.American]?.count ?? 0
        case 1:
            return menu[.Chinese]?.count ?? 0
        case 2:
            return menu[.Korean]?.count ?? 0
        default:
            return menu[.Japanese]?.count ?? 0
        }
    }
    
    private func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.configureCell(text: menu[.American]?[indexPath.row].name ?? "")
        case 1:
            cell.configureCell(text: menu[.Chinese]?[indexPath.row].name ?? "")
        case 2:
            cell.configureCell(text: menu[.Korean]?[indexPath.row].name ?? "")
        default:
            cell.configureCell(text: menu[.Japanese]?[indexPath.row].name ?? "")
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
