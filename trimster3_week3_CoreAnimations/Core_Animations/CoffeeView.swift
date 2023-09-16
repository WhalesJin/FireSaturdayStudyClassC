//
//  CoffeeView.swift
//  Core_Animations
//
//  Created by 조호준 on 2023/09/16.
//

import UIKit

final class CoffeeView: UIView {
    let cupLayer = CAShapeLayer()
    let strawLayer = CAShapeLayer()
    let coffeeLayer = CAShapeLayer()
    let coffeeMaskLayer = CAShapeLayer()
    let cupMaskLayer = CAShapeLayer()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        drawCoffee()
    }

    func drawCoffee() {
        let width = bounds.width
        let height = bounds.height
        let padding = width / 10
        
        let cup = UIBezierPath()
        cup.move(to: CGPoint(x: padding * 2, y: padding * 2))
        cup.addLine(to: CGPoint(x: padding * 3, y: height - padding))
        cup.addQuadCurve(to: CGPoint(x: width - (padding * 3), y: height - padding), controlPoint: CGPoint(x: width / 2, y: height))
        cup.addLine(to: CGPoint(x: width - (padding * 2), y: padding * 2))
        
        cupLayer.frame = bounds
        cupLayer.path = cup.cgPath
        cupLayer.strokeColor = UIColor.lightGray.cgColor
        cupLayer.fillColor = UIColor.clear.cgColor
        cupLayer.lineWidth = 5
        layer.addSublayer(cupLayer)
        
        let straw = UIBezierPath()
        straw.move(to: CGPoint(x: width - padding * 0.5, y: padding))
        straw.addLine(to: CGPoint(x: width - (padding * 2.5), y: padding * 2))
        straw.addLine(to: CGPoint(x: width * 0.4, y: height - padding))
        
        strawLayer.frame = bounds
        strawLayer.path = straw.cgPath
        strawLayer.lineCap = .round
        strawLayer.strokeColor = UIColor.black.cgColor
        strawLayer.fillColor = UIColor.clear.cgColor
        strawLayer.lineWidth = 5
        strawLayer.position = .init(x: width - (padding * 2.5) + 8, y: padding * 2 + 10)
        strawLayer.anchorPoint = .init(x: 0.8, y: 0.2)
        cupLayer.addSublayer(strawLayer)
        
        let coffee = UIBezierPath(rect: CGRect(x: 0, y: padding * 3, width: width, height: height))
        
        coffeeLayer.frame = bounds
        coffeeLayer.path = coffee.cgPath
        coffeeLayer.fillColor = UIColor.brown.cgColor
        cupLayer.addSublayer(coffeeLayer)
        
        let coffeeMask = UIBezierPath()
        coffeeMask.move(to: CGPoint(x: padding * 2 + 2, y: padding * 2))
        coffeeMask.addLine(to: CGPoint(x: padding * 3 + 2, y: height - padding - 2))
        coffeeMask.addQuadCurve(to: CGPoint(x: width - (padding * 3) - 2, y: height - padding - 2), controlPoint: CGPoint(x: width / 2, y: height - 2))
        coffeeMask.addLine(to: CGPoint(x: width - (padding * 2) - 2, y: padding * 2))

        coffeeMaskLayer.path = coffeeMask.cgPath
        coffeeMaskLayer.fillColor = UIColor.white.cgColor
        coffeeLayer.mask = coffeeMaskLayer
        
        
    }
}
