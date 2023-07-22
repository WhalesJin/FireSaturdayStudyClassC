//
//  PurpleView.swift
//  ResponderChain
//
//  Created by 조호준 on 2023/07/22.
//

import UIKit

class PurpleView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            print("== PurpleView ==")
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("hitTestView = PurpleView")
                    return hitTestView
                }
            }
            print("return self = PurpleView")
            return self
        }
        return nil
    }
}
