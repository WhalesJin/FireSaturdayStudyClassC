//
//  ViewController.swift
//  3_week1_Animations
//
//  Created by Dasan on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yagomImageView: UIImageView!
    @IBOutlet weak var yagomTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var yagomLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpErrorButton(_ sender: Any) {
        yagomImageView.layer.removeAllAnimations()
        
        yagomLeadingConstraint.constant += 4
        yagomTrailingConstraint.constant = view.frame.width - yagomImageView.frame.width - yagomLeadingConstraint.constant
        
        UIView.animate(withDuration: 0.05,
                       delay: 0,
                       options: [.repeat, .autoreverse]) { [self] in
            view.layoutIfNeeded()
        } completion: { [self] _ in
            yagomLeadingConstraint.constant -= 4
            yagomTrailingConstraint.constant = view.frame.width - yagomImageView.frame.width - yagomLeadingConstraint.constant
        }
    }
    
    @IBAction func touchUpMacButton(_ sender: Any) {
        yagomImageView.layer.removeAllAnimations()
        
        UIView.animateKeyframes(withDuration: 0.24,
                                delay: 0,
                                options: [.repeat, .autoreverse]) { [self] in
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 1) { [self] in
                yagomImageView.transform = CGAffineTransform(scaleX: 0.8, y: 1.5)
            }
        }
    }
    
    @IBAction func touchUpCustomButton(_ sender: Any) {
        
    }
    
    @IBAction func touchUpResetButton(_ sender: Any) {
        yagomImageView.layer.removeAllAnimations()
        yagomImageView.transform = .identity
    }
}
