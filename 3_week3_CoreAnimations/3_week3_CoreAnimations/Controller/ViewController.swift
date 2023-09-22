//
//  ViewController.swift
//  3_week3_CoreAnimations
//
//  Created by Dasan on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView: CustomView!
    var isTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.drawCup()
        setupTapGestureRecognizer()
    }
    
    func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        customView.gestureRecognizers = [tapGestureRecognizer]
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        print(sender.location(in: customView))
        animateCoffee(isTapped)
        animateStraw(isTapped)
        isTapped.toggle()
    }
    
    func animateCoffee(_ isTapped: Bool) {
        // let path = UIBezierPath(rect: CGRect(x: 55, y: 95, width: 135, height: 235))
        let newPath =  UIBezierPath(rect: CGRect(x: 55, y: 330, width: 135, height: 0))
        
        let animation = CABasicAnimation()
        animation.keyPath = "path"
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        if isTapped {
            animation.fromValue = newPath.cgPath
            animation.toValue = customView.beverageLayer.path
        } else {
            animation.fromValue = customView.beverageLayer.path
            animation.toValue = newPath.cgPath
        }
        
        customView.beverageLayer.add(animation, forKey: nil)
    }
    
    func animateStraw(_ isTapped: Bool) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        
        // x:240, y:350
        customView.strawLayer.position = .init(x: 172, y: 94)
        // customView.strawLayer.anchorPoint = .init(x: 172/240, y: 94/350) 이건 왜 안되지
        customView.strawLayer.anchorPoint = .init(x: 0.717, y: 0.269)
        
        if isTapped {
            animation.fromValue = 0
            animation.toValue = Double.pi / 40
        } else {
            animation.fromValue = Double.pi / 40
            animation.toValue = 0
        }
        
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        customView.strawLayer.add(animation, forKey: nil)
    }
}
