//
//  ViewController.swift
//  UIView_Animations
//
//  Created by 조호준 on 2023/09/01.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var yagomImageView: UIImageView!
    
    private var yagomImageFrameOrigin: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yagomImageFrameOrigin = yagomImageView.frame.origin
    }
    
    @IBAction func touchUpMeetErrorButton(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .repeat) {
            self.yagomImageView.frame.origin.x -= 4
        } completion: { _ in
            self.yagomImageView.frame.origin.x += 8
        }
    }
    
    @IBAction func touchUpPurchaseMacBookButton(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.45) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 0.8, y: 1.5)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.9) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1.2, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 1) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
    
    @IBAction func touchUpCustomAnimationButton(_ sender: Any) {
    }
    
    @IBAction func touchUpResetButton(_ sender: Any) {
        guard let yagomImageFrameOrigin else { return }
        
        yagomImageView.stopAnimating()
        yagomImageView.layer.removeAllAnimations()
        yagomImageView.frame.origin = yagomImageFrameOrigin
    }
}
