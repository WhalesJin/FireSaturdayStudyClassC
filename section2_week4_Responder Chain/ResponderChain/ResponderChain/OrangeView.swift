//
//  OrangeView.swift
//  ResponderChain
//
//  Created by Whales on 2023/07/22.
//

import UIKit

class OrangeView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            print("OrangeView")
            
//            let tapView = UITapGestureRecognizer(target: self, action: #selector(changedColor))
//            self.addGestureRecognizer(tapView)
            
//            for subview in subviews.reversed() {
//                let convertedPoint = subview.convert(point, from: self)
//                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
//                    print(hitTestView)
//                    return hitTestView
//                }
//            }
            return nil
        }
        return nil
    }

    @objc func changedColor(_ gesture: UITapGestureRecognizer) {
        guard let greenView = self.superview else {
            return
        }

        if greenView.backgroundColor == .systemGreen {
            greenView.backgroundColor = .black
            return
        } else if greenView.backgroundColor == .black {
            greenView.backgroundColor = .systemGreen
            return
        }

        greenView.backgroundColor = .systemGreen
    }
}
