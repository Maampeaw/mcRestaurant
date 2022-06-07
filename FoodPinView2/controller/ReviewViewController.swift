//
//  ReviewViewController.swift
//  FoodPinView2
//
//  Created by user on 5/16/22.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var rateIt: [UIButton]!
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: restaurant.name)
        //applying blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)

       
        rateIt.forEach { button in
            button.transform = moveScaleTransform
            button.alpha = 0
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateIt[0].alpha = 1.0
            self.rateIt[0].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateIt[1].alpha = 1.0
            self.rateIt[1].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateIt[2].alpha = 1.0
            self.rateIt[2].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
            self.rateIt[3].alpha = 1.0
            self.rateIt[3].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateIt[4].alpha = 1.0
            self.rateIt[4].transform = .identity
        }, completion: nil)
        
           
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissView(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
