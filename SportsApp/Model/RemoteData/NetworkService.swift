//
//  NetworkServise.swift
//  SportsApp
//
//  Created by Menna on 02/05/2022.
//

import Foundation
import Alamofire

class NetworkService {
    
    func getLeaguesAPIByCountry(country: String, sport: String, completion : @escaping([Country]? , Error?)-> Void)
    {
        AF.request(URLs.leaguesUrl.appending("?c=\(country)&s=\(sport)"))
            .validate()
            .responseDecodable(of: CountriesResponse.self) { (response) in
                switch response.result {
                case .success( _):
                    guard let arrayOfSports = response.value?.countrys else { return }
                    completion(arrayOfSports,nil)
                    print(arrayOfSports.count)

                case .failure(let error):
                print(error.localizedDescription)
                    completion(nil,error)
                }
            }
    }
    
    
    
    //==========================================
//    func fetchEventsData(id:String ,r:String,s:String ,completion : @escaping (AllEvents?, Error?)->()){
//      AF.request(URLs.getEventsListURL.appending("?id=\(id)&r=\(r)&s=\(s)"))
     func fetchEventsData(completion : @escaping (AllEvents?, Error?)->()){
     //  AF.request(URLs.getEventsListURL.appending("?id=\(id)&r=\(r)&s=\(s)"))
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
    //id=4328&r=35&s=2021-2022
  //&strLeague=EFL20%Trophy
//    func fetchResultsData(id:String ,r:String,s:String ,completion : @escaping (AllResult?, Error?)->()){
//
//         AF.request(URLs.getResultsListURL.appending("?id=\(id)&r=\(r)&s=\(s)"))
    func fetchResultsData(completion : @escaping (AllResult?, Error?)->()){
        
        // AF.request(URLs.getResultsListURL.appending("?id=\(id)&r=\(r)&s=\(s)"))
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
                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                               print("Server Error: " + str)
                           }
                    completion(nil , error)
                    
                }
            }
    }
    
  //==========================================
    func fetchTeamsData(league:String ,completion : @escaping (AllTeams?, Error?)->()){
    
        AF.request(URLs.getTeamsListURL.appending("?l=\(league)"))
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
