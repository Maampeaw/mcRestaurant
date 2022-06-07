//
//  RestaurantDetailTwoColumnCell.swift
//  FoodPinView2
//
//  Created by user on 5/15/22.
//

import UIKit

class RestaurantDetailTwoColumnCell: UITableViewCell {
    @IBOutlet var phone: UILabel!
    @IBOutlet var address: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
