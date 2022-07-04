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
    
    var codigo = ""
    
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        restaurantsTableView.dataSource = self
    }
}

extension RestaurantsViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = restaurants[indexPath.row].titulo
        return celda
    }

}
