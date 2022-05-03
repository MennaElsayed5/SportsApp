//
//  Sports.swift
//  SportsApp
//
//  Created by Mohamed Galal on 02/05/2022.
//

import Foundation

struct SportJSONData : Codable {
    
    let sports : [Sports]
}

struct Sports : Codable {
    
    let sportName : String?
    let sportImage : String?
    
        enum CodingKeys: String, CodingKey {
    
            case sportName = "strSport"
            case sportImage = "strSportThumb"
    
        }
}
