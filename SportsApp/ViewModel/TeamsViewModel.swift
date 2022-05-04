//
//  TeamsViewModel.swift
//  SportsApp
//
//  Created by Aziza on 04/05/2022.
//

import UIKit

class TeamsViewModel: NSObject {
    
    var networkService :NetworkService!
    
    var teamData :AllTeams! {
        didSet{
            
            self.bindTeamsViewModelToView()
        }
        
    }
    
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    //============================================
    var bindTeamsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
  //==================================================
    override init() {
        
        super .init()
        self.networkService = NetworkService()
        self.fetchTeamDataFromAPI()
    }
//==================================================
    func fetchTeamDataFromAPI (){
        
        networkService.fetchTeamsData(completion: { (teamData, error) in
            
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
