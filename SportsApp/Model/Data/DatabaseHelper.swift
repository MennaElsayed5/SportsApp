//
//  DatabaseHelper.swift
//  SportsApp
//
//  Created by Peter Samir on 05/05/2022.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static let instance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    func saveFavoriteLeagueIntoDB(newLeague:String, img:Data, leagueUrl:String){
        
        let league = NSEntityDescription.insertNewObject(forEntityName: "MyEntity", into: context) as! MyEntity
        league.leagueName = newLeague
        league.leagueUrl = leagueUrl
        league.leagueImg = img
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    func getAllFavoroiteFromDB() -> [MyEntity]{
        
        var favLeagues = [MyEntity]()
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyEntity")
        
        do {
            favLeagues = try context.fetch(request) as! [MyEntity]
        } catch let error {
            print(error.localizedDescription)
        }
        return favLeagues
    }
    
    func deleteSpecificLeague(league:MyEntity){
        context.delete(league)
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
