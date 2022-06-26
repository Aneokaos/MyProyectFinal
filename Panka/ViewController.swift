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
    
    
    let citys = ["Lima","Piura","Chiclayo","Arequipa","Pucallpa"]
    let regiones = ["Costa","Sierra","Selva"]
    
    
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
            return citys[row]
        case 2:
            return regiones[row]
        default:
            return "Data not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     switch pickerView.tag {
        case 1:
         CitySourceTextField.text = citys [row]
         CitySourceTextField.resignFirstResponder()
        case 2:
         CityDestinyTextField.text = regiones [row]
         CityDestinyTextField.resignFirstResponder()
        default:
            return
        }
        
    }
    }
    

