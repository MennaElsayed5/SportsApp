//
//  SportsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Galal on 02/05/2022.
//


import Foundation


class SportsViewModel : NSObject{
    
    var spoetService :SportService!
    
    var sportData :SportJSONData! {
        didSet{
            
            self.bindSportsViewModelToView()
        }
        
    }
    
    
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    
    var bindSportsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    override init() {
        
        super .init()
        self.spoetService = SportService()
        self.fetchSportsDataFromAPI()
    }
    
    
    func fetchSportsDataFromAPI (){
        
        spoetService.fetchEmployeeData(completion: { (employeeData, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.sportData = employeeData
                
            }
           
        })
    }

}
