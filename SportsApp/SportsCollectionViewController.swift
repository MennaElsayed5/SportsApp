//
//  SportsCollectionViewController.swift
//  SportsApp
//
//  Created by Mohamed Galal on 26/04/2022.
//

import UIKit
import SDWebImage
import Reachability

class SportsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var sports : [Sports] = [Sports]()
//    var selecteSports : [Sports]
    var sportsViewModel = SportsViewModel()
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView : UIImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named:"no-internet")
            iv.contentMode = .scaleAspectFit
            self.tabBarController?.tabBar.barTintColor = .darkClouds
            return iv
        }()
       
        
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                //self.collectionView.backgroundView = imageView
                self.sportsViewModel.bindSportsViewModelToView = {
                    self.onSuccessUpdateView()
                }
                self.sportsViewModel.bindViewModelErrorToView = {
                    self.onFailUpdateView()
                }
                
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            self.collectionView.backgroundView = imageView
           
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    
    func onSuccessUpdateView(){
        
        sports = sportsViewModel.sportData.sports
        self.collectionView.reloadData()
        
    }
    
    func onFailUpdateView(){
        
        
        let alert = UIAlertController(title: "Error", message: sportsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        
        // Configure the cell
        
        cell.lableView.text = sports[indexPath.row].sportName
        cell.imageView.sd_setImage(with: URL(string: sports[indexPath.row].sportImage!), completed: nil)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20.0
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.collectionView.frame.size.width - 18)/2
        let height = (self.collectionView.frame.size.height)/3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mCountries:CountriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController
        
        mCountries.sportName = sports[indexPath.row].sportName
        
        self.navigationController?.pushViewController(mCountries, animated: true)
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
