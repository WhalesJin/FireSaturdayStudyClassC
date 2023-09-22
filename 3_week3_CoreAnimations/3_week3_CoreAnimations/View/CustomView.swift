//
//  CustomView.swift
//  3_week3_CoreAnimations
//
//  Created by Dasan on 2023/09/16.
//

import UIKit

final class CustomView: UIView {
    let cupBorderLayer = CAShapeLayer()
    let strawLayer = CAShapeLayer()
    let beverageLayer = CAShapeLayer()
    let maskingLayer = CAShapeLayer()
    
    func drawCup() {
        setupLayer()
        drawStraw()
        drawBeverage(height: 235)
        setupMask()
        drawCupBorder()
    }
    
    private func setupLayer() {
        layer.addSublayer(cupBorderLayer)
        layer.addSublayer(strawLayer)
        layer.addSublayer(beverageLayer)
    }
        
    private func drawCupBorder() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 55, y: 95))
        path.addLine(to: CGPoint(x: 65, y: 305))
        path.addCurve(to: CGPoint(x: 180, y: 305), controlPoint1: CGPoint(x: 65, y: 330), controlPoint2: CGPoint(x: 180, y: 330))
        path.addLine(to: CGPoint(x: 190, y: 95))
        
        // path.close()은 선 이어줌
        // 이 방법은 하위 경로의 첫 번째 점과 마지막 점 사이에 선분을 생성하여 현재 하위 경로를 닫습니다
        
        cupBorderLayer.frame = self.bounds
        cupBorderLayer.path = path.cgPath
        cupBorderLayer.lineWidth = 10
        cupBorderLayer.strokeColor = UIColor.lightGray.cgColor
        cupBorderLayer.fillColor = .none
    }
    
    private func drawStraw() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 220, y: 40))
        path.addLine(to: CGPoint(x: 170, y: 90))
        path.addLine(to: CGPoint(x: 90, y: 300))
        
        strawLayer.position = .init(x: 172, y: 94)
        strawLayer.anchorPoint = .init(x: 0.717, y: 0.269)
        
        strawLayer.frame = self.bounds
        strawLayer.path = path.cgPath
        strawLayer.lineWidth = 10
        strawLayer.lineCap = .round
        strawLayer.strokeColor = UIColor.darkGray.cgColor
        strawLayer.fillColor = .none
    }
    
    private func drawBeverage(height: CGFloat) {
        let path = UIBezierPath(rect: CGRect(x: 55, y: 95, width: 135, height: 235))
        
        beverageLayer.frame = self.bounds
        beverageLayer.path = path.cgPath
        beverageLayer.fillColor = UIColor.brown.cgColor
    }
    
    private func setupMask() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 60, y: 135))
        path.addLine(to: CGPoint(x: 70, y: 305))
        path.addCurve(to: CGPoint(x: 175, y: 305), controlPoint1: CGPoint(x: 70, y: 325), controlPoint2: CGPoint(x: 185, y: 325))
        path.addLine(to: CGPoint(x: 185, y: 135))
        
        maskingLayer.frame = self.bounds
        maskingLayer.path = path.cgPath
        beverageLayer.mask = maskingLayer
    }
}
