//
//  ViewController.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CitySourceTextField: UITextField!
    @IBOutlet weak var CityDestinyTextField: UITextField!
    
    
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
    
    var CitySourcePickerView = UIPickerView ()
    var CityDestinyPickerView = UIPickerView ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CitySourceTextField.inputView = CitySourcePickerView
        CityDestinyTextField.inputView = CityDestinyPickerView
        
        CitySourceTextField.placeholder = "Selecciona Ciudad"
        CityDestinyTextField.placeholder = "Selecciona Región"
        
        CitySourceTextField.textAlignment = .center
        CityDestinyTextField.textAlignment = .center
        
        
        CitySourcePickerView.delegate = self
        CitySourcePickerView.dataSource = self
        CityDestinyPickerView.delegate = self
        CityDestinyPickerView.dataSource = self
        
        
        CitySourcePickerView.tag = 1
        CityDestinyPickerView.tag = 2
        
        
    }
    @IBAction func ir(_ sender: Any) {
    
        var city = CitySourceTextField.text ?? ""
        var region = CityDestinyTextField.text ?? ""
        
        if !city.isEmpty && !region.isEmpty {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

                   guard let viewController = storyboard.instantiateViewController(withIdentifier: "RestaurantsViewController") as? RestaurantsViewController else {

                       fatalError("no se encontró viewcontroller")

                   }
            viewController.restaurants = RestaurantsLocalRepository().fetchRestaurants().filter { restaurant in
                            
                return
                restaurant.idCity == cityIdSelect && restaurant.idRegion == regionIdSelect
                
                
            }
            
            CitySourceTextField.text = ""
            CityDestinyTextField.text = ""
            
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
         CitySourceTextField.text = citys[row].nombreCity
         cityIdSelect = citys[row].idCity
         CitySourceTextField.resignFirstResponder()
        case 2:
         CityDestinyTextField.text = regiones[row].nombreRegion
         regionIdSelect = regiones[row].idRegion
         CityDestinyTextField.resignFirstResponder()
        default:
            return
        }
        
    }
    }
    





