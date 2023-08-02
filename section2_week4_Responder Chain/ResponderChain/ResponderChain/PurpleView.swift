//
//  PurpleView.swift
//  ResponderChain
//
//  Created by Whales on 2023/07/22.
//

import UIKit

class PurpleView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            print("PurpleView")
            
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }

}
