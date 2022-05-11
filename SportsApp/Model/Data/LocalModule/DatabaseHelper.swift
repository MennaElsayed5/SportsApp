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
    
    
    
    func saveFavoriteLeagueIntoDB(country:Country){
        
        let league = NSEntityDescription.insertNewObject(forEntityName: "MyEntity", into: context) as! MyEntity
        league.leagueName = country.strLeague ?? ""
        league.leagueUrl = country.strYoutube ?? ""
        league.leagueImg = country.strBadge ?? ""
        league.idLeague = country.idLeague ?? ""
        league.strCountry = country.strCountry ?? ""
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
    
    func deleteSpecificLeague(leagueID:String)throws{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MyEntity")
        let myPredicate = NSPredicate(format: "idLeague == %@", leagueID)
        fetchRequest.predicate = myPredicate
        do{
            let leagueList = try context.fetch(fetchRequest)
            for league in leagueList{
                context.delete(league)
            }
            try self.context.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    
    
    
}
