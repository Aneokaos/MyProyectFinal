//
//  RestaurantesViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 1/07/22.
//

import Foundation
import UIKit

class RestaurantsViewController: UIViewController {
    
    @IBOutlet weak var restaurantsTableView: UITableView!
    
    //var codigo = ""
    
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        restaurantsTableView.dataSource = self
        restaurantsTableView.delegate = self
    }
}

extension RestaurantsViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as? RestaurantTableViewCell else {
            return UITableViewCell ()
        }
        
        let restaurant = restaurants[indexPath.row]
        celda.configure(restaurant: restaurant)
        
        return celda
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailRestaurantViewController") as? DetailRestaurantViewController else {fatalError("no se encontró viewcontroller")
               }
        viewController.restaurant = restaurants[indexPath.row]
        show(viewController, sender: nil)
    }
    

}

