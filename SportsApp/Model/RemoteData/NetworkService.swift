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
}
