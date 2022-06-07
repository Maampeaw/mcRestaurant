//
//  RestaurantViewController.swift
//  FoodPinView2
//
//  Created by user on 5/14/22.
//

import UIKit

class RestaurantViewController: UIViewController{
    var restaurant: Restaurant!
    
    @IBOutlet var detailTable: UITableView!
    @IBOutlet var headerView: HeadeView!
   


    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.name.text = restaurant.name
        headerView.type.text = restaurant.type
        headerView.headerImage.image = UIImage(named: restaurant.name)
        detailTable.delegate = self
        detailTable.dataSource = self
        
        
//        navigationController?.hidesBarsOnSwipe = false
        detailTable.separatorStyle = .none
        detailTable.contentInsetAdjustmentBehavior = .never
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "showReview":
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant
        default:
            break
        }
    }
    
 

}

extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self)) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = "lljdfnkjdljknlkfjnwlernf djfnlsdn sdjnalsdjnflasdfa nlfjnglsjndflanjlfjdnajnlfjnalsjdnflkajsndfljknioa djnaosidflahds fkj aoindfla "
            return cell
            
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self)) as! RestaurantDetailTwoColumnCell
            cell.phone.text = "0556235493"
            cell.address.text = "Oxford Street"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self)) as! RestaurantDetailMapCell
            cell.configure(location: "Accra")
            cell.selectionStyle = .none
            return cell
            
        default:
            fatalError("Failed To instantiate View")
        }
        
   
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {

        guard let identifier = segue.identifier else {
            return
        }
        
        print(identifier)
        if let rating = Restaurant.Rating(rawValue: identifier) {
            print(rating)
            self.restaurant.rating = rating
            self.headerView.ratingImageView.image = UIImage(named: rating.image)
        }

        dismiss(animated: true, completion: nil)
    }
    

    
    
}
