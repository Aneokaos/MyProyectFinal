//
//  DetalleRestaurantViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 7/07/22.
//

import Foundation
import UIKit

class DetailRestaurantViewController
: UIViewController {
    var restaurant: Restaurant!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descripLabel
    : UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    func setup(){
        tituloLabel.text = restaurant.titulo
        descripLabel.text = restaurant.desc
        phoneLabel.text = String(restaurant.phone)
        addressLabel.text = restaurant.direc
        
        let url = URL(string: restaurant.url)!

        DispatchQueue.global().async {
  
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [self] in
                self.restaurantImageView.image = UIImage(data: data)
                }
            }
        }
        
    }
    
    
}
