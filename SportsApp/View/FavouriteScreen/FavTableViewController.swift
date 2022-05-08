//
//  FavTableViewController.swift
//  SportsApp
//
//  Created by Menna on 29/04/2022.
//

import UIKit
import Network

class FavTableViewController: UITableViewController {

    var favoriteList = Array<Favourite>()
    var helper:Helper?
    var arr = [MyEntity]()
    let monitor = NWPathMonitor()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.barTintColor = .darkClouds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helper = Helper()
        arr = DatabaseHelper.instance.getAllFavoroiteFromDB()
        
        favoriteList.append(Favourite(idLeague: "11", strLeague: "premierLeague", strYoutube: "asfasdf"))
        favoriteList.append(Favourite(idLeague: "11", strLeague: "Egyptian League", strYoutube: "asfasdf"))
        
        
//        let pngImg = helper?.convertImageToPng(img: UIImage(named: "jersey")!)
//                DatabaseHelper.instance.saveFavoriteLeagueIntoDB(newLeague: "ahly league", img: pngImg!, leagueUrl: "https:\\www.youtube.com")
//                helper?.showMessage(message: "Succesfully Added", error: false)
//                print("done")
//                self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavTableViewCell
        let myRow = arr[indexPath.row]
        
        if let name = myRow.leagueName, let img = myRow.leagueImg{
            cell.setUpCell(str: name, img: img)
            
        }
       return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        checkNetwork()
//        let pngImg = helper?.convertImageToPng(img: UIImage(named: "jersey")!)
//        DatabaseHelper.instance.saveFavoriteLeagueIntoDB(newLeague: "ahly league", img: pngImg!, leagueUrl: "https:\\www.youtube.com")
//        helper?.showMessage(message: "Succesfully Added", error: false)
//        print("done")
//        self.tableView.reloadData()
      
        
        /*let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
            } else {
                print("There's no internet connection.")
            }
        }*/
        if Network.shared.isConnected {
            helper?.showMessage(message: "done", error: false)
        }else{
            helper?.showMessage(message: "erorr", error: true)
        }
        
        
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DatabaseHelper.instance.deleteSpecificLeague(league: arr[indexPath.row])
        arr.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    deinit{
//        reachability.stopNotifier()
    }
     
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? LeaguesDetailsViewController{
//            destination.events?[0].label = favoriteList[0].txtFavLeague.text
//        }
//    }
 
    
   /* func checkNetworkState(){
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: reachability, queue: .main) { [self] notification in
            if let myReachability = notification.object as? Reachability {
                switch myReachability.connection {
                case .cellular:
                    print("tamam")
                    helper?.showMessage(message: "Success", error: true)
                case .wifi:
                    print("tamam")
                    helper?.showMessage(message: "Success", error: true)
                case .unavailable:
                    print("tamam")
                    helper?.showMessage(message: "Failed", error: false)
                }
            }
        }
    }*/
    
    
        /* @objc func checkNetwork(){
        reachability.whenReachable = {[self] reachability in
            print("reachable")
            performSegue(withIdentifier: "showDetails", sender: self)
        }
       reachability.whenUnreachable = { [self] _ in
            helper?.showMessage(message: "Network Succeded", error: true)
            self.helper?.showAlert(title: "Something Wrong", description: "Please check your Internet connection and try again", viewController: self)
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }*/
}
