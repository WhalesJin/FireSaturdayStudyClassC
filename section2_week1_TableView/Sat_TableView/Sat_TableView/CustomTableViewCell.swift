//
//  CustomTableViewCell.swift
//  Sat_TableView
//
//  Created by Whales on 2023/07/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
