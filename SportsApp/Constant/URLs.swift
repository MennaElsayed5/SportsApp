//
//  URLs.swift
//  SportsApp
//
//  Created by Menna on 02/05/2022.
//

import Foundation
struct URLs{
    
    
    //Teams
    public static var getTeamsListURL : String = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
    //"https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php"
    //Results
    public static var getResultsListURL : String = //"https://www.thesportsdb.com/api/v1/json/2/eventslast.php?id=133602"
    "https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=35&s=2021-2022"
    //Events
    public static var getEventsListURL : String =
    
    "https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=38&s=2021-2022"
}
