//
//  SportService.swift
//  SportsApp
//
//  Created by Mohamed Galal on 02/05/2022.
//

import Foundation
import Alamofire

class SportService{
    
    
    func fetchEmployeeData(completion : @escaping (SportJSONData?, Error?)->()){
        
        
        AF.request(URLs.getSportsURL)
            .validate()
            .responseDecodable(of: SportJSONData.self) { (response) in
                switch response.result {
                
                case .success( _):
                    
                    guard let empsData = response.value else { return }
                    
                    completion(empsData,nil)
                    
                    
                case .failure(let error):
                    
                    completion(nil , error)
                    
                    
                }
            }
    }
    
}
