//
//  RestaurantDiffableDataSource.swift
//  FoodPinView2
//
//  Created by user on 5/14/22.
//

import UIKit
enum Section{
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    

}
