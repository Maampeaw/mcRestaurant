//
//  HeadeView.swift
//  FoodPinView2
//
//  Created by user on 5/14/22.
//

import UIKit

class HeadeView: UIView {
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var ratingImageView: UIImageView!
    @IBOutlet var name: UILabel!{
        didSet {
            if let customFont = UIFont(name:"Nunito-Bold", size:40){
                name.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
            }
        }
    }
    @IBOutlet var type: UILabel!{
        didSet{
            if let customFont = UIFont(name:"Nunito-Regular", size: 20){
                type.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
            }
         
        }
    }
    @IBOutlet var heartButton: UIButton!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
