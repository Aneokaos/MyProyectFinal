//
//  RestaurantTableViewCell.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 7/07/22.
//

import Foundation
import UIKit
import MapKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        restaurantImageView.image = nil
    }
    func configure(restaurant : Restaurant){
        nameLabel.text = restaurant.titulo
        
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

