//
//  CustomCell.swift
//  CollectionView
//
//  Created by Whales on 2023/07/30.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        self.addSubview(emojiLabel)
        self.backgroundColor = .yellow
        
        NSLayoutConstraint.activate ([
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
