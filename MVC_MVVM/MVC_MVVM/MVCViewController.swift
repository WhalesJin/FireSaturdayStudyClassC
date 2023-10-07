//
//  MVCViewController.swift
//  MVC_MVVM
//
//  Created by 조호준 on 2023/10/07.
//

import UIKit

final class MVCViewController: UIViewController {
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var meatButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    @IBAction func didTappedBookButton(_ sender: Any) {
        model.saveUserDefaults(.book)
        updateResultLabel(category: .book)
    }
    
    @IBAction func didTappedMeatButton(_ sender: Any) {
        model.saveUserDefaults(.meat)
        updateResultLabel(category: .meat)
    }
    
    private func updateResultLabel(category: Model.Category) {
        resultLabel.text = "\(category.rawValue)을(를) 좋아하는 성격입니다.^^"
    }
}

extension MVCViewController {
    private func configureUI() {
        bookButton.setTitle("📚\n\n책", for: .normal)
        meatButton.setTitle("🍗\n\n고기", for: .normal)
    }
}
