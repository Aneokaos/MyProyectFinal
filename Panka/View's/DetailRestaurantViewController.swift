//
//  DetalleRestaurantViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 7/07/22.
//

import Foundation
import UIKit
import MapKit



class DetailRestaurantViewController
: UIViewController, MKMapViewDelegate{
    var restaurant: Restaurant!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descripLabel
    : UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setup()
        MapOn()
        
    

        
    }
    func setup(){
        tituloLabel.text = restaurant.titulo
        descripLabel.text = restaurant.desc
        phoneLabel.text = "☎︎ \(String(restaurant.phone))"
        addressLabel.text = "📍\(restaurant.direc)"
        
        let url = URL(string: restaurant.url)!

        DispatchQueue.global().async {
  
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [self] in
                self.restaurantImageView.image = UIImage(data: data)
                }
            }
        }
    }
     func MapOn(){
         let coordinate = CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.long)
         let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
                
         let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
}
   
    
}
