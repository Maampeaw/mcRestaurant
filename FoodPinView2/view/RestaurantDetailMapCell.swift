//
//  RestaurantDetailMapCell.swift
//  FoodPinView2
//
//  Created by user on 5/15/22.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    @IBOutlet var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location:String){
        print(location)
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks{
                //get the first placemark
                let placemark = placemarks[0]
                print(placemark, "")
                
                //add anotation
                let annotation = MKPointAnnotation()
                if let location = placemark.location{
                    print("this is the coordinate")
                    print(location.coordinate)
                    print("done")
                    annotation.coordinate = location.coordinate
                    print(location.coordinate)
                    self.mapView.addAnnotation(annotation)
                    
                    //Set zoom level
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }

}
