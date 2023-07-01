//
//  CustomTableViewCell.swift
//  230701study
//
//  Created by Minseong Kang on 2023/07/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
	@IBOutlet weak var circleImageView: UIImageView!
	@IBOutlet weak var foodNameLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	
	static let cellIdentifier: String = "cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
