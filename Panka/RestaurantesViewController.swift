//
//  RestaurantesViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 1/07/22.
//

import Foundation
import UIKit

class RestaurantesViewController: UIViewController {
    
    @IBOutlet weak var restaurantesTableView: UITableView!
    
    var codigo = ""
    
    var restaurantes: [String] = ["restaurante","restaurante"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        restaurantesTableView.dataSource = self
    }
}

extension RestaurantesViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = restaurantes[indexPath.row]
        return celda
    }

}
