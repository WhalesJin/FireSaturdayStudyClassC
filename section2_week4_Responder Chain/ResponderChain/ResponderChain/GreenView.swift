//
//  GreenView.swift
//  ResponderChain
//
//  Created by Whales on 2023/07/22.
//

import UIKit

class GreenView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
            
        }
        
        if self.point(inside: point, with: event) {
            print("GreenView")
    //
    //            let tapView = UITapGestureRecognizer(target: subviews, action: #selector(changedColor))
    //            self.addGestureRecognizer(tapView)
    //
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    if self.backgroundColor == .green {
                        self.backgroundColor = .black
                    } else if self.backgroundColor == .black {
                        self.backgroundColor = .green
                    }
                    
                    self.backgroundColor = .green
                    return hitTestView
                }
            }
            
            return self
        }
        return nil
    }
    
//    @objc private func changedColor(_ gesture: UITapGestureRecognizer) {
//        if self.backgroundColor == .systemGreen {
//            self.backgroundColor = .black
//            return
//        } else if self.backgroundColor == .black {
//            self.backgroundColor = .systemGreen
//            return
//        }
//        
//        self.backgroundColor = .systemGreen
//    }

}
