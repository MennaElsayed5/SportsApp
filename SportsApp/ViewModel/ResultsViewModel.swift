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
     //id=4328&r=35&s=2021-2022
        //  //&strLeague=EFL20%Trophy
//        networkService.fetchResultsData(id:"1154268",r:"35",s:"2021-2022", completion: { (resultsData, error) in
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
