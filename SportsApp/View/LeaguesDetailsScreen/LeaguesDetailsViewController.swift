//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Aziza on 29/04/2022.
//

import UIKit

class LeaguesDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
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
            
            return cell
            
        }else if collectionView == self.resultsCollection{
            let   cell = resultsCollection.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultsCollectionViewCell

//             cell.eventName.text = eventsArray?[indexPath.row].eventName  ?? ""
//
            return cell
            
        }else if collectionView == self.teamsCollection{
            let  cell = teamsCollection.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
            
//          cell.teamImage.kf.indicatorType = .activity
//
//       cell.teamImage.kf.setImage(with: URL(string: teamsArray![indexPath.row].teamImage!),placeholder: UIImage(named: "PlaceholderImg"))
            
            
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
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
