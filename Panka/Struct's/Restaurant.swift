//
//  Restaurante.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 1/07/22.
//

import Foundation
struct Restaurant:Decodable {
    
    let idCity: Int
    let idRegion: Int
    let titulo: String
    let desc: String
    let phone: Int
    let direc: String
    let long: Double
    let lat: Double
    let url: String
}


