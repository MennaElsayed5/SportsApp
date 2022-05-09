//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Peter Samir on 02/05/2022.
//

import UIKit
class TeamDetailsViewController: UIViewController {
    var teamsDetails:Teams?
    @IBOutlet weak var stadiumImgV: UIImageView!
    @IBOutlet weak var logoImgV: UIImageView!
    @IBOutlet weak var txtViewHeight:NSLayoutConstraint!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var myCard: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelStrTeam: UILabel!
    @IBOutlet weak var labelStrStadium: UILabel!
    @IBOutlet weak var labelStrLeague: UILabel!
    @IBOutlet weak var labelStrYear: UILabel!
    @IBOutlet weak var labelStrCountry: UILabel!
    @IBOutlet weak var jerseyImgV: UIImageView!
    @IBOutlet weak var lblStrLeague: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtView.text = teamsDetails?.strDescriptionEN
        txtViewHeight.constant = txtView.contentSize.height
        txtView.isScrollEnabled = true
        
        
        var url = URL(string: (teamsDetails?.strTeamBadge)!)
        logoImgV.kf.setImage(with: url)
        labelStrTeam.text = (teamsDetails?.strTeam) ?? "Team"
        labelStrLeague.text = (teamsDetails?.strLeague) ?? "League"
        labelStrStadium.text = "\(teamsDetails?.strStadium! ?? "") Stadium"
        url = URL(string: (teamsDetails?.strStadiumThumb)!)
        stadiumImgV.kf.setImage(with: url)
        url = URL(string: (teamsDetails?.strTeamJersey)!)
        jerseyImgV.kf.setImage(with: url)
        labelStrLeague.text = "\(teamsDetails?.strLeague! ?? "")"
        lblStrLeague.text = "League: \(teamsDetails?.strLeague! ?? "")"
        labelStrYear.text = ("Since: \(teamsDetails?.intFormedYear! ?? "")")
        labelStrCountry.text = "Country: \(teamsDetails?.strCountry! ?? "")"
        
//        view.addSubview(scrollView)
//        scrollView.isScrollEnabled = true
        myCard.layer.shadowColor = UIColor.gray.cgColor
        myCard.layer.shadowRadius = 10.0
        myCard.layer.shadowOpacity = 0.9
        
        
        
    }
    

}
