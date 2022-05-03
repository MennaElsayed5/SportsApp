//
//  Country.swift
//  SportsApp
//
//  Created by Mohamed Galal on 02/05/2022.
//

import Foundation

struct CountriesJSONData {
    
    let countries : Country
}

struct Country {
    
    let countryEgypt : String?
    
    enum CodingKeys : String, CodingKey {
        
        case countryEgypt = "name_en"

    }
}
