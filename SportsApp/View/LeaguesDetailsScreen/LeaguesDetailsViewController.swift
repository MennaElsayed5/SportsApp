//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Aziza on 01/05/2022.
//

import UIKit
import SDWebImage
import Alamofire

class LeaguesDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var teams:[Teams]?
    var events:[Events]?
    
    @IBOutlet weak var addToFavButt: UIButton!
    
    @IBOutlet weak var eventsCollection: UICollectionView!
    
    @IBOutlet weak var teamsCollection: UICollectionView!
    @IBOutlet weak var resultsCollection: UICollectionView!
    //==============================================
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.eventsCollection{
            return events?.count ?? 0
        }else if collectionView == self.resultsCollection{
            return events?.count ?? 0
        }else{
            return teams?.count ?? 0
        }
    }
    //==================================================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.eventsCollection{
            
            let cell = eventsCollection.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! EventsCollectionViewCell
            
            //            cell.eventNameLabl.text=events?[indexPath.row].eventNameLabl ?? ""
            //
            return cell
            
        }else if collectionView == self.resultsCollection{
            let   cell = resultsCollection.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultsCollectionViewCell
            
            //             cell.eventName.text = eventsArray?[indexPath.row].eventName  ?? ""
            //
            return cell
            
        }else if collectionView == self.teamsCollection{
            let  cell = teamsCollection.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
            
            cell.teamName.text=teams?[indexPath.row].strTeam
            
            cell.teamImg.sd_setImage(with: URL(string: teams![indexPath.row].strTeamBanner!), placeholderImage: UIImage(named: "profile"))
            
            //
            //            image.layer.borderWidth = 1
            //                image.layer.masksToBounds = false
            //                image.layer.borderColor = UIColor.black.cgColor
            //                image.layer.cornerRadius = image.frame.height/2
            //                image.clipsToBounds = true
            
            return cell
            
            
        }
        return UICollectionViewCell()
    }
    //================================================
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.eventsCollection{
            return 1
        }else if collectionView ==  self.resultsCollection{
            return 3
        }else{
            return 1
        }
    }
    //==================================================
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.teamsCollection{
            //navigate
        }
    }
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getDataByAlamofire()
        // 1
        let request = AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League")
        // 2
        request.responseJSON { (data) in
            
            print(data)
            // data as? [[String:Any]]
//            let Json = data.result as? [[String:Any]]
//            for i in Json {
//
//                let name = i["strTeam"] as! String
//
//                let image = i["strTeamBanner"] as! String
//                let sTeams=Teams()
//                sTeams.strTeam = name
//                sTeams.strTeamBanner = image
//                print(name)
//                print(image)
//                // self.teams.append(sTeams)
//
//            }
            
        }
        
        //================================================
            func getDataByAlamofire(){
                // get Data by Almofire library
                Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League")
                    .responseJSON {[self](response)-> Void in
                        if let Json = response.result.value as? [[String:Any]]{
                            print(Json)
                            for i in Json {
        
                                let name = i["strTeam"] as! String
        
                                let image = i["strTeamBanner"] as! String
                                let sTeams=Teams()
                                sTeams.strTeam = name
                                sTeams.strTeamBanner = image
        
                                self.teams.append(sTeams)
        
                            }
                            DispatchQueue.main.async {
                              //  self.tableView.reloadData()
                            }
        
                        }
        
                    }
        
    }
}
}
