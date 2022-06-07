//
//  FoodTableViewCell.swift
//  FoodPinView2
//
//  Created by user on 5/14/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var location: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = .systemYellow
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
