//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Aziza on 01/05/2022.
//

import UIKit
import SDWebImage
import Alamofire

class LeaguesDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var teams:[Teams]=[Teams]()
    var results:[Results]=[Results]()
    var events :[Events] = [Events]()
    
    let teamsViewModel = TeamsViewModel()
    let resultsViewModel = ResultsViewModel ()
    let eventsViewModel = EventsViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var resultsCollection: UICollectionView!
    @IBOutlet weak var eventsCollection: UICollectionView!
    
    @IBOutlet weak var addToFavButt: UIButton!
    
    @IBOutlet weak var teamsCollection: UICollectionView!
    
    //==========================
    func onSuccessUpdateView(){
        
        teams = teamsViewModel.teamData.teams
        self.teamsCollection.reloadData()
        
    }
    //========================
    func onFailUpdateView(){
        print("error teams")
//
//        let alert = UIAlertController(title: "Teams Error", message: teamsViewModel.showError, preferredStyle: .alert)
//
//        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
//
//        }
//
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
        
    }
    //==========================
    func onSuccessResultsUpdateView(){
        
        results = resultsViewModel.resultData.events
        self.resultsCollection.reloadData()
        
    }
    //========================
    func onFailResultsUpdateView(){
        print("error result")
        
        let alert = UIAlertController(title: "Results Error", message: resultsViewModel.showError, preferredStyle: .alert)

        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in

        }

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    //==========================
    func onEventSuccessUpdateView(){
        
        events = eventsViewModel.eventData.events
        self.eventsCollection.reloadData()
        
    }
    //========================
    func onEventsFailUpdateView(){
        
        let alert = UIAlertController(title: "Events Error", message: eventsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }

    //=============================================
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
            switch collectionView {
            case eventsCollection:
                return CGSize(width: 375, height: 190)
            case resultsCollection:
                return CGSize(width: 380, height: 107)
            case teamsCollection:
                return CGSize(width: 145, height: 150)
            default:
                return CGSize(width: 150, height: 190)

            }
    }
    //==============================================
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)

       }
    
    //==============================================
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.eventsCollection{
            return events.count
        }else if collectionView == self.resultsCollection{
            return results.count
        }else{
            return teams.count
            
        }
        
    }
    //==================================================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.eventsCollection{
            
            let cell = eventsCollection.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! EventsCollectionViewCell
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            
            cell.homeTeam.text = events[indexPath.row].strHomeTeam
            cell.awayTeam.text = events[indexPath.row].strAwayTeam
            cell.eventDate.text = events[indexPath.row].dateEvent
            cell.eventTime.text = events[indexPath.row].strTime
            cell.strThumb.sd_setImage(with: URL(string: events[indexPath.row].strThumb!), placeholderImage: UIImage(named: "7"))
            print("hello from events")
            return cell
            
          //Results
        }else if collectionView == self.resultsCollection{
            let   cell = resultsCollection.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultsCollectionViewCell
            cell.resultDate.text = results[indexPath.row].dateEvent
            cell.resultTime.text = results[indexPath.row].strTime
            cell.homeScore.text = results[indexPath.row].intHomeScore
            cell.secScore.text = results[indexPath.row].intAwayScore
            cell.homeTeam.text = results[indexPath.row].strHomeTeam
            cell.secTeam.text = results[indexPath.row].strAwayTeam
            print("hello from result")
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 1
            
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            //for actual cell
            cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 0.50
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            cell.clipsToBounds = false
            cell.contentView.layer.masksToBounds = true
            return cell
            //Teams
        }else if collectionView == self.teamsCollection{
            let  cell = teamsCollection.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
            print("hello from team")
            cell.teamName.text=teams[indexPath.row].strTeam
            
            cell.teamImg.sd_setImage(with: URL(string: teams[indexPath.row].strTeamBanner!), placeholderImage: UIImage(named: "profile"))
            
            cell.teamImg.layer.borderWidth = 1
            cell.teamImg.layer.masksToBounds = false
            cell.teamImg.layer.borderColor = UIColor.black.cgColor
            cell.teamImg.layer.cornerRadius =  cell.teamImg.frame.height/2
            cell.teamImg.clipsToBounds = true
            
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 1
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            //for actual cell
            cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 0.50
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            cell.clipsToBounds = false
            cell.contentView.layer.masksToBounds = true
            return cell
            
        }
       
        
        return UICollectionViewCell()
    }
    //================================================
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.eventsCollection{
            return 1
        }else if collectionView ==  self.resultsCollection{
            return 1
        }else{
            return 1
        }
    
    }
    //==================================================
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if collectionView == self.teamsCollection{
            print("team Clicked")
            
            let teamsDetails:TeamDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            
            teamsDetails.teamsDetails = teams[indexPath.row]
        
        
                   
                   self.navigationController?.pushViewController(teamsDetails, animated: true)
        }
    }
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
               scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1700)
        view.addSubview(scrollView)
        
        self.teamsCollection.delegate=self
        self.teamsCollection.dataSource=self
        
        self.resultsCollection.delegate=self
        self.resultsCollection.dataSource=self
        
        self.eventsCollection.delegate=self
        self.eventsCollection.dataSource=self
        
        teamsViewModel.bindTeamsViewModelToView = {

            self.onSuccessUpdateView()

        }

        teamsViewModel.bindTeamsViewModelErrorToView = {

            self.onFailUpdateView()

        }
        //Results
        resultsViewModel.bindResultsViewModelToView = {
            
            self.onSuccessResultsUpdateView()
            
        }
        
        resultsViewModel.bindResultsViewModelErrorToView = {
            
            self.onFailResultsUpdateView()
            
        }
        //Events
        eventsViewModel.bindEventsViewModelToView = {
            
            self.onEventSuccessUpdateView()
            
        }
        
        eventsViewModel.bindEventsViewModelErrorToView = {
            
            self.onEventsFailUpdateView()
            
        }
    }
    //=======================================
   
   
}

