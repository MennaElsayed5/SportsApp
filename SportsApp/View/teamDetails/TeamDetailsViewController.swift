//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Peter Samir on 02/05/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var stadiumImgV: UIImageView!
    @IBOutlet weak var logoImgV: UIImageView!
    
    @IBOutlet weak var myCard: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var jerseyImgV: UIImageView!
    
    var teamsDetails:Teams?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImgV.image = UIImage(named: "alahlyLogo")
        stadiumImgV.image = UIImage(named: "stadium")
        jerseyImgV.image = UIImage(named: "jersey")
        
        view.addSubview(scrollView)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        myCard.layer.shadowColor = UIColor.gray.cgColor
        myCard.layer.shadowRadius = 10.0
        myCard.layer.shadowOpacity = 0.9
    }
    

}
