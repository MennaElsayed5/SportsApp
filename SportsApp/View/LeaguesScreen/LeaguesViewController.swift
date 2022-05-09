//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Menna on 27/04/2022.
//

import UIKit
import Alamofire
import SDWebImage
import SkeletonView
class LeaguesViewController: UIViewController , UITableViewDelegate,SkeletonTableViewDataSource  {
    @IBOutlet weak var tbView: UITableView!
    let webService = NetworkService()
    var country : [Country] = [Country]()
    var sportsCountry : SportAndCountry!
//    var strSport = "Soccer"
//  var strCountry = "England"
    var viewModel:LeaguesViewModel!{
        didSet{
            guard let var1 = sportsCountry else {return}
            viewModel.sportsCountry = var1
            viewModel.featchLeaguesBySportsAndCountry()
//            print(var1.strSport!)
//            print(var1.strCountry!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = .darkClouds
        
        tbView.delegate = self
        tbView.isSkeletonable = true
        tbView.showAnimatedGradientSkeleton()
        viewModel = LeaguesViewModel()
        prepereData()

    }
 
    func prepereData(){
        if viewModel.isConnectedToNetwork(){
            viewModel.bindinLeaguesData = { [weak self] in
                guard let self = self  else {return}
                self.onSuccessUpdateView()
            }
            viewModel.bindViewModelErrorToView = { [weak self] in
                guard let self = self  else {return}
                self.onFailUpdateView()
            }
            viewModel.bindingConnectionError = { [weak self] in
                guard let self = self  else {return}
                self.handleConnectionError()
            }
        }else{
            tbView.backgroundView = UIImageView(image: UIImage(named: "404")!)
            viewModel.dataOfLeagues = [Country]()
            tbView.reloadData()
            
        }
      
    }
    func onSuccessUpdateView(){
        country = viewModel.dataOfLeagues
        tbView.stopSkeletonAnimation()
         tbView.hideSkeleton()
        self.tbView.reloadData()
    }
    func onFailUpdateView(){
        let alert = UIAlertController(title: "dataError", message: "returned data is null", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func handleConnectionError() {
        if viewModel.isConnectedToNetwork(){
        }else{
            self.present(connectionIssue(), animated: true, completion: nil)
        }
    }
    
    @objc func youtubeTapped(sender:UIButton){
        let url = sender.accessibilityValue!
        viewModel.openInYoutube(url: url)
    }
///////////////////////////////////////FOR TABLE VIEW ///////////////////////////////////////
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    func numSections(in collectionSkeletonView: UITableView) -> Int{
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return country.count
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier{
        return "cell"
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell;
   
        cell.txtLeague?.text = country[indexPath.row].strLeague
        if let validImage = country[indexPath.row].strBadge{
            cell.imgView.sd_setImage(with: URL(string: validImage), completed: {(image,error,cach,url)in
                cell.imgView.sd_imageIndicator?.stopAnimatingIndicator()
            })
        }else{
            cell.imgView.image = #imageLiteral(resourceName: "anonymousLogo")
        }
//        cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
//        cell.imgView.sd_imageIndicator?.startAnimatingIndicator()
        cell.YoutubeBtn.accessibilityValue = country[indexPath.row].strYoutube
        if country[indexPath.row].strYoutube == ""{
                    cell.YoutubeBtn.isEnabled = false
                }else{
                    cell.YoutubeBtn.isEnabled = true
                }
        cell.YoutubeBtn.isHidden = false
        cell.YoutubeBtn.addTarget(self, action: #selector(self.youtubeTapped), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
        
        detailsVc.countries = country[indexPath.row]
        self.navigationController?.pushViewController(detailsVc, animated: true)
//        print("leaguesViewController\(country[indexPath.row].strCountry)")

//        self.performSegue(withIdentifier: "Details", sender:self)
//

    }
  
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let customIndex = self.tbView?.indexPathForSelectedRow
//        print("raddoda 7arbo2a")
//        if let vc = segue.destination as? LeaguesDetailsViewController {
//            print("raddoda msh 7arbo2a")
//
//            vc.countries = country[customIndex!.row]
//            print("leaguesViewController\(vc.countries?.strCountry)")
//            }
//
//    }
    
}
