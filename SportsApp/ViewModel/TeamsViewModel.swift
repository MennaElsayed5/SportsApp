//
//  TeamsViewModel.swift
//  SportsApp
//
//  Created by Aziza on 04/05/2022.
//

import UIKit

class TeamsViewModel: NSObject {
    
    var networkService :NetworkService!
   // var teams :Teams
    
    var teamData :AllTeams! {
        didSet{
            
            self.bindTeamsViewModelToView()
        }
        
    }
    
    var showError : String! {
        
        didSet{
            
            self.bindTeamsViewModelErrorToView()
        }
        
    }
    
    //============================================
    var bindTeamsViewModelToView : (()->()) = {}
    var bindTeamsViewModelErrorToView : (()->()) = {}
  //==================================================
    override init() {
        
        super .init()
        self.networkService = NetworkService()
        self.fetchTeamDataFromAPI()
    }
//==================================================
    func fetchTeamDataFromAPI (){
        //  guard let var1 = sportsCountry else {return}
       //print(var1.strSport!)
    
        networkService.fetchTeamsData(league:"English%20League%201",completion: { (teamData, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.teamData = teamData
                
            }
           
        })
    }
 //===================================
}
