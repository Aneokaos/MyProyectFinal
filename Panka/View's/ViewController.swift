//
//  ViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var citySourceTextField: UITextField!
    @IBOutlet weak var cityDestinyTextField: UITextField!
    
    
    let citys = [
        City(idCity: 11, nombreCity: "Lima"),
        City(idCity: 12, nombreCity: "Piura")
    ]
    
    let regiones = [
        Region(idRegion: 1, nombreRegion: "Costa"),
        Region(idRegion: 2, nombreRegion: "Sierra"),
        Region(idRegion: 3, nombreRegion: "Selva")
    ]
    
    var cityIdSelect = 0
    var regionIdSelect = 0
    
    var citySourcePickerView = UIPickerView ()
    var cityDestinyPickerView = UIPickerView ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citySourceTextField.inputView = citySourcePickerView
        cityDestinyTextField.inputView = cityDestinyPickerView
        
        citySourceTextField.placeholder = "Selecciona Ciudad"
        cityDestinyTextField.placeholder = "Selecciona Región"
        
        citySourceTextField.textAlignment = .center
        cityDestinyTextField.textAlignment = .center
        
        
        citySourcePickerView.delegate = self
        citySourcePickerView.dataSource = self
        cityDestinyPickerView.delegate = self
        cityDestinyPickerView.dataSource = self
        
        
        citySourcePickerView.tag = 1
        cityDestinyPickerView.tag = 2
        
        
    }
    @IBAction func ir(_ sender: Any) {
    
        let city = citySourceTextField.text ?? ""
        let region = cityDestinyTextField.text ?? ""
        
        if !city.isEmpty && !region.isEmpty {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: "RestaurantsViewController") as? RestaurantsViewController else {
            fatalError("no se encontró viewcontroller")
            }
            
        let restaurantLocalRepository = RestaurantsLocalRepository()
           viewController.restaurants =  restaurantLocalRepository.fetchRestaurants().filter{
            restaurant
            in
            return
            restaurant.idCity == cityIdSelect && restaurant.idRegion == regionIdSelect
            }
            
        citySourceTextField.text = ""
        cityDestinyTextField.text = ""
            
        show(viewController, sender: nil)
        }
        
    }
    
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1:
            return citys.count
        case 2:
            return regiones.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return citys[row].nombreCity
        case 2:
            return regiones[row].nombreRegion
        default:
            return "Data not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     switch pickerView.tag {
        case 1:
         citySourceTextField.text = citys[row].nombreCity
         cityIdSelect = citys[row].idCity
         citySourceTextField.resignFirstResponder()
        case 2:
         cityDestinyTextField.text = regiones[row].nombreRegion
         regionIdSelect = regiones[row].idRegion
         cityDestinyTextField.resignFirstResponder()
        default:
            return
        }
        
    }
    }
    





