//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by 조호준 on 2023/07/29.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = .yellow
        contentView.addSubview(label)
        setUpLabelConstraints()
    }
}

extension MyCollectionViewCell {
    private func setUpLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
