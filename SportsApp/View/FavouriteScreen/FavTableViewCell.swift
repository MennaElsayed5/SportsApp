//
//  FavTableViewCell.swift
//  SportsApp
//
//  Created by Menna on 29/04/2022.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtFavLeague: UILabel!
    @IBOutlet weak var YiutubeBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCell(str:String, img:String){
        txtFavLeague.text = str
        imgView.image = UIImage(named: img)
    }
}
