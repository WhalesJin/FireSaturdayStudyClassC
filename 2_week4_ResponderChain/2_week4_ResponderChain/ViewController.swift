//
//  ViewController.swift
//  2_week4_ResponderChain
//
//  Created by Dasan on 2023/07/22.
//

import UIKit

// 1. UITapGestureRecognizer
// 2. ResponderChain

class ViewController: UIViewController {
    @IBOutlet weak var greenView: GreenView!
    @IBOutlet weak var orangeView: OrangeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.backgroundColor = .green
        //setUpGestureRecognizer()
    }
    
    func setUpGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeBackgroundColor))
        //orangeView.addGestureRecognizer(tapGestureRecognizer) // 요구사항에 안맞음.
        greenView.addGestureRecognizer(tapGestureRecognizer) // 요구사항에 맞는것.
    }
    
    @objc func changeBackgroundColor() {
        if greenView.backgroundColor == .green {
            greenView.backgroundColor = .black
        } else if greenView.backgroundColor == .black {
            greenView.backgroundColor = .green
        }
    }
}
