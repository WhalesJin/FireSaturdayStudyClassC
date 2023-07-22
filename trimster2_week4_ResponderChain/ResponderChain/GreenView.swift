//
//  GreenView.swift
//  ResponderChain
//
//  Created by 조호준 on 2023/07/22.
//

import UIKit

class GreenView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            print("== GreenView ==")
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("hitTestView = GreenView")
                    return hitTestView
                }
            }
            print("return self = GreenView")
            return self
        }
        return nil
    }
}
