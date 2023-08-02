//
//  ViewController.swift
//  ResponderChain
//
//  Created by Whales on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
//
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var orangeView: OrangeView!
//    @IBOutlet weak var purpleView: UIView!
//    @IBOutlet weak var blueView: UIView!
//    @IBOutlet weak var yellowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setUIColor()
        greenView.backgroundColor = .green
//        setUpTabGesture()
    }
    
    private func setUpTabGesture() {
        let tabOrangeView = UITapGestureRecognizer(target: self, action: #selector(changedColor))
        
        orangeView.addGestureRecognizer(tabOrangeView)
    }
    
    @objc private func changedColor(_ gesture: UITapGestureRecognizer) {
        if greenView.backgroundColor == .green {
            greenView.backgroundColor = .black
        } else if greenView.backgroundColor == .black {
            greenView.backgroundColor = .green
        }
        
        greenView.backgroundColor = .green
    }
    
    
    
    
//    func setUIColor() {
//        greenView.backgroundColor = .systemGreen
//        orangeView.backgroundColor = .systemOrange
//        purpleView.backgroundColor = .systemPurple
//        blueView.backgroundColor = .systemBlue
//
//        yellowButton.backgroundColor = .systemYellow
//    }

/*
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // CGPoint 와 UIEvent를 받아서
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            // isUserInteractionEnabled가 false 거나 isHidden이 true 거나 알파가 0.01 이하면 (투명하면)
            // 알파는 투명도 0.0 완전 투명 1.0 완전 불투명!
            return nil
            // nil 뱉고
        }
     
        if self.point(inside: point, with: event) {
            // event가 point 내부에서 벌어지면?
            for subview in subviews.reversed() {
            // 거슬러올라가면서?
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }
    */
    
    
}

