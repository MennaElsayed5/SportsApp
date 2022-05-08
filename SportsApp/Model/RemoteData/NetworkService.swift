//
//  NetworkServise.swift
//  SportsApp
//
//  Created by Menna on 02/05/2022.
//

import Foundation
import Alamofire

class NetworkService {
    
    //==========================================
      func fetchEventsData(completion : @escaping (AllEvents?, Error?)->()){

          AF.request(URLs.getEventsListURL)
              .validate()
              .responseDecodable(of: AllEvents.self) { (response) in
                  
                  print("before ....")
                  switch response.result {
                  
                  case .success( _):
                      
                      guard let eventsData = response.value else { return }

                      completion(eventsData,nil)
                      print("event sizzzzzzzzzzze\(eventsData.events.count)")
                      
                  case .failure(let error):
                      print(" Events faillll")
                      completion(nil , error)
                      
                  }
              }
      }
   //==============================================================
    
    func fetchResultsData(completion : @escaping (AllResult?, Error?)->()){
        
        
        AF.request(URLs.getResultsListURL)
            .validate()
            .responseDecodable(of: AllResult.self) { (response) in
                print("befor result......")
                
                switch response.result {
               
                case .success( _):
                    
                    guard let eventsData = response.value else { return }
                    
                    completion(eventsData,nil)
                    print(eventsData.events.count)
                    
                case .failure(let error):
                    print("faillll")
                    completion(nil , error)               
                    
                }
            }
    }
    
  //==========================================
    func fetchTeamsData(completion : @escaping (AllTeams?, Error?)->()){
        
        //          func getLeaguesAPIByCountry(country: String, sport: String, completion : @escaping([Country]? , Error?)-> Void)
        //             {
                  //AF.request(URLs.leaguesUrl.appending("?c=\(country)&s=\(sport)"))
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
