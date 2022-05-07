//
//  LeaguesViewModel.swift
//  SportsApp
//
//  Created by Peter Samir on 02/05/2022.
//

import Foundation
import UIKit
class LeaguesViewModel: NSObject{
    var leaguesService : NetworkService!
    var sportsCountry : SportAndCountry!
    var dataOfLeagues :[Country]!{
        didSet{
            self.bindinLeaguesData()
            
        }
    }
    var showError : String! {
        didSet{
            self.bindViewModelErrorToView()
        }
    }
    var leagueDetails: [Country]!{
        didSet{
            self.bindingLeagueDetails()
        }
    }
    var connectionError:String! {
        didSet{
            self.bindingConnectionError()
        }
    }
    
    var bindViewModelErrorToView : (()->()) = {}
    var bindinLeaguesData: (()->()) = {}
    var bindingLeagueDetails: (()->()) = {}
    var bindingConnectionError : (()->()) = {}


    override init() {
        super.init()
    leaguesService = NetworkService()
  //  self.featchLeaguesBySportsAndCountry()
    }
    func featchLeaguesBySportsAndCountry(){
        guard let var1 = sportsCountry else {return}
        print(var1.strSport!)
        leaguesService.getLeaguesAPIByCountry(country:var1.strCountry!, sport:var1.strSport!, completion: {(sportsData ,error) in
            if let err: Error = error{
                let msg = err.localizedDescription
                self.connectionError = msg
                self.showError = msg
            }else {
                self.dataOfLeagues = sportsData

            }
        })
    }
    func searchForLeagueDetails(withId id: String,onFound: (Country)->Void ){
        for item in leagueDetails {
            if item.idLeague == id{
                onFound(item)
                break
            }
        }
    }
    func isConnectedToNetwork() -> Bool {
        return (Network.shared.isConnected) ? true : false
    }
    func openInYoutube(url:String){
        let app = UIApplication.shared
        if app.canOpenURL(URL(string: url)!){
            app.open(URL(string: url)!)
        }else {
            app.open(URL(string: "https://\(url)")!)
        }
    }
    
}
