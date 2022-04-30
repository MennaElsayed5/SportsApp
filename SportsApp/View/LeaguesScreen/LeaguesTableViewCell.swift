//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by Menna on 27/04/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {


    @IBOutlet weak var YoutubeBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtLeague: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
