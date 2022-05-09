//
//  Country.swift
//  SportsApp
//
//  Created by Menna on 05/05/2022.
//

import Foundation
struct CountriesResponse: Codable {
    let countrys: [Country]
}


struct Country: Codable {
    var idLeague:String?
    var strLeague: String?
    var strCountry: String?
    var strBadge:String?
    var strYoutube :String?
    
}
