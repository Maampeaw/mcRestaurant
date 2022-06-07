//
//  RestaurantTableViewController.swift
//  FoodPinView2
//
//  Created by user on 5/14/22.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),   Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),   Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]

        
//    enum Section{
//        case all
//    }
    var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    
    
    lazy var dataSource = configureTable()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        var snapShot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapShot.appendSections([.all])
        snapShot.appendItems(restaurants, toSection: .all)
        dataSource.apply(snapShot, animatingDifferences: false)
        tableView.separatorStyle = .none
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        if let appearance = navigationController?.navigationBar.standardAppearance{
            appearance.configureWithTransparentBackground()
            if let customFont = UIFont(name: "Nunito-Bold", size: 45){
                appearance.titleTextAttributes = [.foregroundColor:UIColor(red: 218, green: 96, blue: 51, alpha: 1.0)]
                appearance.largeTitleTextAttributes  = [.foregroundColor:UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }else{
                appearance.largeTitleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!]
                appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!]
            }
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            
        }
        navigationItem.backButtonTitle = ""
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.tintColor = .systemYellow
//    }
    
    func configureTable()-> RestaurantDiffableDataSource{
        let dataSource = RestaurantDiffableDataSource(tableView: tableView) { tableView, indexPath, restaurantName in
            let cell = tableView.dequeueReusableCell(withIdentifier: "datacell") as! FoodTableViewCell
            cell.thumbnail.image = UIImage(named: restaurantName.name)
            cell.location.text = restaurantName.location
            cell.type.text = restaurantName.type
            cell.name.text = restaurantName.name
            
            return cell
        }
        return dataSource
        }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        if let popOverController = optionMenu.popoverPresentationController{
//            if let cell = tableView.cellForRow(at: indexPath){
//                popOverController.sourceView = cell
//                popOverController.sourceRect = cell.bounds
//            }
//        }
//
//        //addActions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//        let markAsFavorite = UIAlertAction(title:"Mark as Favorite", style: .default) { myAction in
//            let actionController = UIAlertController(title: "Favorite", message: "This feature is not available yet", preferredStyle: .alert)
//            actionController.addAction(UIAlertAction(title: "yes", style: .default, handler: { action in
//
//                self.restaurantIsFavorites[indexPath.row].toggle()
//                let cell = tableView.cellForRow(at: indexPath)
//                cell?.accessoryType = self.restaurantIsFavorites[indexPath.row] ? .checkmark : .none
//            }))
//            self.present(actionController, animated: true, completion: nil)
//
//        }
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(okAction)
//        optionMenu.addAction(markAsFavorite)
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else{
            return UISwipeActionsConfiguration()
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, sourceView, completion in
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { action, sourceView, completion in
            let defaultText = "just Checking in at" + restaurant.name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
           if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true)
            completion(true)
        }
        shareAction.backgroundColor = .systemYellow
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeAction
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantViewController
                destinationController.restaurant = self.restaurants[indexPath.row]
                destinationController.headerView?.name.text = self.restaurants[indexPath.row].name
                destinationController.headerView?.headerImage.image = UIImage(named:self.restaurants[indexPath.row].name)
                destinationController.headerView?.type.text = self.restaurants[indexPath.row].type
            }
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
        
    }
    

    

