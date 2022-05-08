//
//  EventsViewModel.swift
//  SportsApp
//
//  Created by Aziza on 04/05/2022.
//

import UIKit

class EventsViewModel: NSObject {
    var networkService :NetworkService!
    
    var eventData :AllEvents!{
        didSet{
            
            self.bindEventsViewModelToView()
        }
        
    }
    
    var showError : String! {
        
        didSet{
            
            self.bindEventsViewModelErrorToView()
        }
        
    }
    
    //============================================
    var bindEventsViewModelToView : (()->()) = {}
    var bindEventsViewModelErrorToView : (()->()) = {}
  //==================================================
    override init() {
        
        super.init()
        self.networkService = NetworkService()
        self.fetchEventDataFromAPI()
    }
//==================================================
    func fetchEventDataFromAPI (){
        //id=4328&r=35&s=2021-2022
        //  guard let var1 = sportsCountry else {return}
       //print(var1.strSport!)
//        networkService.fetchEventsData(id:"1154268",r:"38",s:"2021-2022", completion:  { (eventData, error) in
        networkService.fetchEventsData(completion:  { (eventData, error) in
        
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                print(message)
            }else{
                
                self.eventData = eventData
                
            }
           
        })
    }
 //===================================
}
