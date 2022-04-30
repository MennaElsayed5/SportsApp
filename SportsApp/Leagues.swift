//
//  Leagues.swift
//  SportsApp
//
//  Created by Menna on 27/04/2022.
//

import Foundation

struct apiCallData: Codable {
    let leagues: [Leagues]?
}
struct Leagues: Codable {
    let idLeague, strLeague: String?
    let strSport: String?
}
