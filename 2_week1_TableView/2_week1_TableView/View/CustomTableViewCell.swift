//
//  CustomTableViewCell.swift
//  2_week1_TableView
//
//  Created by Dasan on 2023/07/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
