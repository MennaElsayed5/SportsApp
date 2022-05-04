//
//  NetworkServise.swift
//  SportsApp
//
//  Created by Menna on 02/05/2022.
//

import Foundation
import Alamofire

class NetworkService {
    
    
    
    
    func fetchEventsData(completion : @escaping (Events?, Error?)->()){
        
        
        AF.request(URLs.getResultsListURL)
            .validate()
            .responseDecodable(of: Events.self) { (response) in
                switch response.result {
                
                case .success( _):
                    
                    guard let eventsData = response.value else { return }
                    
                    completion(eventsData,nil)
                    print(eventsData.strHomeTeam)
                    
                case .failure(let error):
                    
                    completion(nil , error)               
                    
                }
            }
    }
    
  //==========================================
    func fetchTeamsData(completion : @escaping (AllTeams?, Error?)->()){
        
        
        AF.request(URLs.getTeamsListURL)
            .validate()
            .responseDecodable(of: AllTeams.self) { (response) in
                switch response.result {
                
                case .success( _):
                    
                    guard let teamsData = response.value else { return }
                    
                    completion(teamsData,nil)
                    print(teamsData.teams.count)
                    
                case .failure(let error):
                    
                    completion(nil , error)
                    
                    
                }
            }
    }
}
