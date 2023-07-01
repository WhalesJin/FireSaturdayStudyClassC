//
//  ViewController.swift
//  230701study
//
//  Created by Minseong Kang on 2023/07/01.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var totalFoods: [String] = ["American", "Chinese", "Korean", "Japanese"]
	
	var americanFoods: [String] = ["햄버거", "피자", "아메리카노"]
	var chineseFoods: [String] = ["탕수육"]
	var koreanFoods: [String] = ["비빔밥", "돼지갈비"]
	var japaneseFoods: [String] = ["스시", "스윙스(돈까스)"]
	
	enum FoodType: String {
		case americanFoods
		case chineseFoods
		case koreanFoods
		case japaneseFoods
	}
	
	struct Food {
		let name: String
		var price: Int
	}
	
	var menu: [FoodType: [Food]] = [
		.americanFoods: [
			Food(name: "햄버거", price: 5000),
			Food(name: "피자", price: 18000),
			Food(name: "아메리카노", price: 41000)
		],
		.chineseFoods: [
			Food(name: "탕수육", price: 18000)
		],
		.koreanFoods: [
			Food(name: "비빔밥", price: 8000),
			Food(name: "돼지갈비", price: 20000)
		],
		.japaneseFoods: [
			Food(name: "스시", price: 20000),
			Food(name: "스윙스(돈까스)", price: 5000)
		]
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "메뉴판"
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
}

extension ViewController: UITableViewDelegate {
	
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return totalFoods[0]
		case 1:
			return totalFoods[1]
		case 2:
			return totalFoods[2]
		case 3:
			return totalFoods[3]
		default:
			break
		}
		return ""
	}
	func numberOfSections(in tableView: UITableView) -> Int {
		return totalFoods.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			guard let ameriacanFoodCount = menu[.americanFoods]?.count else { return 0 }
			return ameriacanFoodCount
		case 1:
			guard let chineseFoodCount = menu[.chineseFoods]?.count else { return 0 }
			return chineseFoodCount
		case 2:
			guard let koreanFoodCount = menu[.koreanFoods]?.count else { return 0 }
			return koreanFoodCount
		case 3:
			guard let japaneseFoodCount = menu[.japaneseFoods]?.count else { return 0 }
			return japaneseFoodCount
		default:
			break
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier,
															 for: indexPath) as? CustomTableViewCell else {
			return UITableViewCell()
		}
		
		if indexPath.section == 0 {
			customCell.foodNameLabel.text = menu[.americanFoods]?[indexPath.row].name
			customCell.priceLabel.text = "\(menu[.americanFoods]![indexPath.row].price)"
		} else if indexPath.section == 1 {
			customCell.foodNameLabel.text = menu[.chineseFoods]?[indexPath.row].name
			customCell.priceLabel.text = "\(menu[.chineseFoods]![indexPath.row].price)"
		} else if indexPath.section == 2 {
			customCell.foodNameLabel.text = menu[.koreanFoods]?[indexPath.row].name
			customCell.priceLabel.text = "\(menu[.koreanFoods]![indexPath.row].price)"
		} else if indexPath.section == 3 {
			customCell.foodNameLabel.text = menu[.japaneseFoods]?[indexPath.row].name
			customCell.priceLabel.text = "\(menu[.japaneseFoods]![indexPath.row].price)"
		}
		
		return customCell
	}
}

