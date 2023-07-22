//
//  CustomButton.swift
//  2_week4_ResponderChain
//
//  Created by Dasan on 2023/07/22.
//

import UIKit

class CustomButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            print(self)
            return self
        }
        return nil
    }
}
