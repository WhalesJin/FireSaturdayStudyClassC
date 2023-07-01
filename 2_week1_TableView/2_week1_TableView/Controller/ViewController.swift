//
//  ViewController.swift
//  2_week1_TableView
//
//  Created by Dasan on 2023/07/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 4100)
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
        var numberOfRowsInSection: Int = 0
        
        for key in menu.keys {
            if key.name == FoodType(rawValue: section)?.name {
                numberOfRowsInSection = menu[key]?.count ?? 0
            }
        }
        
        return numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        for key in menu.keys {
            if key.name == FoodType(rawValue: indexPath.section)?.name {
                cell.menuLabel.text = menu[key]?[indexPath.row].name ?? ""
                cell.priceLabel.text = "\(menu[key]?[indexPath.row].price.description ?? "0") 원"
            }
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FoodType(rawValue: section)?.name
    }

}

extension ViewController: UITableViewDelegate {
    
}
