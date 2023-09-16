//
//  ViewController.swift
//  Core_Animations
//
//  Created by 조호준 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coffeeView: CoffeeView!
    private lazy var tapGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(startAnimation))
    private var isTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeView.addGestureRecognizer(tapGesturerecognizer)
    }

    @objc private func startAnimation() {
        animateCoffee(isTapped)
        animateStraw(isTapped)
        isTapped.toggle()
    }
    
    private func animateCoffee(_ isTapped: Bool) {
        let coffeeAnimation = CABasicAnimation(keyPath: "path")
        let originalPath = coffeeView.coffeeLayer.path
        let coffeeToY = coffeeView.frame.height
        let coffeeWith = coffeeView.frame.width
        let newPath = UIBezierPath(rect: CGRect(x: 0, y: coffeeToY, width: coffeeWith, height: 0)).cgPath
        
        if isTapped {
            coffeeAnimation.fromValue = newPath
            coffeeAnimation.toValue = originalPath
        } else {
            coffeeAnimation.fromValue = originalPath
            coffeeAnimation.toValue = newPath
        }
        
        coffeeAnimation.fillMode = .forwards
        coffeeAnimation.isRemovedOnCompletion = false
        
        coffeeView.coffeeLayer.add(coffeeAnimation, forKey: nil)
    }
    
    private func animateStraw(_ isTapped: Bool) {
        let strawAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        let width = coffeeView.frame.width
        let padding = width / 10
        
        coffeeView.strawLayer.position = .init(x: width - (padding * 2.5) + 8, y: padding * 2 + 10)
        coffeeView.strawLayer.anchorPoint = .init(x: 0.8, y: 0.2)
        
        if isTapped {
            strawAnimation.fromValue = 0
            strawAnimation.byValue = Double.pi / 50
        } else {
            strawAnimation.fromValue = Double.pi / 50
            strawAnimation.toValue = 0
        }
        
        strawAnimation.fillMode = .forwards
        strawAnimation.isRemovedOnCompletion = false
        
        coffeeView.strawLayer.add(strawAnimation, forKey: nil)
    }
}
