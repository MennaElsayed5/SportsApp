//
//  Upcoming.swift
//  SportsApp
//
//  Created by Aziza on 08/05/2022.
//

import Foundation
class Upcoming: Codable {
    let events: [NewEvent]

    init(events: [NewEvent]) {
        self.events = events
    }
}
class NewEvent: Codable {
    let strEvent, strHomeTeam, strAwayTeam, strTime,dateEvent,strThumb: String?
    let dateEventLocal, strCountry: String?
    let idHomeTeam :String?
}
