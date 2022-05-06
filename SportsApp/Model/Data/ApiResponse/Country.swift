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
    let idLeague:String?
    let strLeague: String?
    let strSport: String?
    let strCountry: String?
    let strLogo:String?
    let strBadge:String?
    let strYoutube :String?
    
}
