//
//  CountriesViewController.swift
//  SportsApp
//
//  Created by Mohamed Galal on 02/05/2022.
//

import UIKit

class CountriesViewController: UIViewController {

    var sportName : String!
    var sportsCountry : SportAndCountry!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func navToLeagues(sportCountry:String){

        let mLeagues:LeaguesViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesViewController
//        mLeagues.sportCountry = sportCountry
//        mLeagues.sportName = sportName!
        mLeagues.sportsCountry = SportAndCountry(strSport: sportName, strCountry: sportCountry)
    //    print(sportName!)
        //        print(sportCountry)
//
      self.navigationController?.pushViewController(mLeagues, animated: true)
    }
    
    
    @IBAction func egyptBtn(_ sender: Any) {
    
        navToLeagues(sportCountry: "Egypt")
        
    }
    
    @IBAction func spainBtn(_ sender: Any) {
    
        navToLeagues(sportCountry: "Spain")
       
    }
    @IBAction func englandBtn(_ sender: Any) {

        navToLeagues(sportCountry: "England")
        
    }
}
