//
//  ResultsViewModel.swift
//  SportsApp
//
//  Created by Aziza on 06/05/2022.
//

import UIKit

class ResultsViewModel: NSObject {
    var networkService :NetworkService!
    
    var resultData :AllResult! {
        didSet{
            
            self.bindResultsViewModelToView()
        }
        
    }
    
    var showError : String! {
        
        didSet{
            
            self.bindResultsViewModelErrorToView()
        }
        
    }
    
    //============================================
    var bindResultsViewModelToView : (()->()) = {}
    var bindResultsViewModelErrorToView : (()->()) = {}
  //==================================================
    override init() {
        
        super .init()
        self.networkService = NetworkService()
        self.fetchResultsDataFromAPI()
    }
//==================================================
    func fetchResultsDataFromAPI (){
        
        networkService.fetchResultsData(completion: { (resultsData, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                print(message)
            }else{
                
                self.resultData = resultsData
                
            }
           
        })
    }
 //===================================
}
