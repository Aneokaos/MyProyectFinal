//
//  RestorantRepository.swift
//  Panka
//
//  Created by Renzo Benites Alvarado on 2/07/22.
//

import Foundation

protocol RestaurantsRepository {
    func fetchRestaurants () -> [Restaurant]
}
class RestaurantsLocalRepository: RestaurantsRepository {

    func fetchRestaurants() -> [Restaurant] {

        guard let data = loadJSONfile("Restaurants") else { fatalError("")}

        let decoder = JSONDecoder()

        guard let response = try? decoder.decode([Restaurant].self, from: data) else {
            fatalError("")
        }

       return response

    }

    func loadJSONfile(_ name: String) -> Data? {

        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else { return nil }

        

        return try? Data(contentsOf: url)

        

    }

}

