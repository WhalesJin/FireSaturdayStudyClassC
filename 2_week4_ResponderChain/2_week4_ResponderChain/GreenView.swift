//
//  GreenView.swift
//  2_week4_ResponderChain
//
//  Created by Dasan on 2023/07/22.
//

import UIKit

class GreenView: UIView {
    var isBackgroundChanged: Bool = false
    
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
            
            // hitTest가 2번 실행되어 배경색이 다시 돌아가는 것을 막기위한 로직
            if isBackgroundChanged {
                //isBackgroundChanged = false
                isBackgroundChanged.toggle()
            } else {
                changeBackgroundColor()
            }
            
            return self
        }
        return nil
    }
    
    func changeBackgroundColor() {
        isBackgroundChanged = true
        
        if self.backgroundColor == .green {
            self.backgroundColor = .black
            
        } else if self.backgroundColor == .black {
            self.backgroundColor = .green
        }
    }
}
