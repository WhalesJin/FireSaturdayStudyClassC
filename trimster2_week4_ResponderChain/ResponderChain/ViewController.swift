//
//  ViewController.swift
//  ResponderChain
//
//  Created by 조호준 on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenView: GreenView!
    @IBOutlet weak var orangeView: OrangeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenView.backgroundColor = .green
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
        orangeView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tapGestureRecognized() {
        if greenView.backgroundColor == .green {
            greenView.backgroundColor = .black
        } else {
            greenView.backgroundColor = .green
        }
    }
}
