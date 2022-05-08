//
//  Event.swift
//  SportsApp
//
//  Created by Aziza on 08/05/2022.
//

import Foundation
struct Response: Codable {
    let events: [Event]?
}
struct Event: Codable {
    let idEvent: String?
    let idLeague: String?
    let strHomeTeam, strAwayTeam: String?
    let intHomeScore:String?
    let intAwayScore:String?
    let dateEvent: String?
    let idHomeTeam, idAwayTeam: String?
    let strSeason:String?
    let intRound:String?
    let strTime:String?
    let strThumb:String?
    
}
