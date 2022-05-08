//
//  Events.swift
//  SportsApp
//
//  Created by Aziza on 07/05/2022.
//


import UIKit
class AllEvents : Codable{
    let events : [Events]
}
class Events: Codable {
    
//    var idEvent: String?
//    var idSoccerXML: String?
//    var idAPIfootball: String?
//    var strEvent: String?
//    var strEventAlternate: String?
//    var strFilename: String?
//    var strSport: String?
//    var idLeague: String?
//    var strLeague: String?
//    var strSeason: String?
//    var strDescriptionEN: String?
    let strHomeTeam: String?//neeed
    let strAwayTeam: String?//need
   // var intHomeScore: String?//neeed
   // var intRound: String?
   // var intAwayScore: String?//need
//    var intSpectators: String?
//    var strOfficial: String?
//    var strTimestamp: String?
    let dateEvent: String?//neeed
   // var dateEventLocal: String?
    let strTime: String?//neeed
   // var strTimeLocal: String?
//    var strTVStation: String?
//    var idHomeTeam: String?
//    var idAwayTeam: String?
//    var strResult: String?
//    var strVenue: String?
//    var strCountry: String?
//    var strCity: String?
//    var strPoster: String?
//    var strSquare: String?
   // var strFanart: String?
    let strThumb: String? //need
   // var strBanner: String?
//    var strMap: String?
//    var strTweet1: String?
//    var strTweet2: String?
//    var strTweet3: String?
//    var strVideo: String?
//    var strStatus: String?
//    var strPostponed: String?
//    var strLocked: String?
    
}

