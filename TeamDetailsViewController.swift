//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Peter Samir on 30/04/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var stadiumImgV: UIImageView!
    @IBOutlet weak var logoImgV: UIImageView!
    
    @IBOutlet weak var myCard: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var jerseyImgV: UIImageView!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
