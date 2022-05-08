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
    @IBOutlet weak var jerseyImgV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamsDetails?.strCountry)
        logoImgV.image = UIImage(named: "alahlyLogo")
        stadiumImgV.image = UIImage(named: "stadium")
        jerseyImgV.image = UIImage(named: "jersey")
        
        
        view.addSubview(scrollView)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        myCard.layer.shadowColor = UIColor.gray.cgColor
        myCard.layer.shadowRadius = 10.0
        myCard.layer.shadowOpacity = 0.9
        
        txtView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        txtViewHeight.constant = txtView.contentSize.height
        
    }
    

}
