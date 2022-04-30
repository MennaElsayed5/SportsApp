//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Menna on 27/04/2022.
//

import UIKit

class LeaguesViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource   {
    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
//        cell.txtLeagues.text = "ay haga"
       // cell.imageVeiw.image = UIImage(named: "1")
       // cell.YoutubeBtn.tag = indexPath.row
       self.tbView.rowHeight = 140

        
        return cell
    }
    
    

    

 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
