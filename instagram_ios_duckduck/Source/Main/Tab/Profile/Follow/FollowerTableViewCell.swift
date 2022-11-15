//
//  FollowerTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {

    static let identifier = "FollowerTableViewCell"
    
   
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var unioqueName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFollower(follower: FollowerResult){
        unioqueName.text = follower.uniqueName
        if follower.imgURL == "" {
            profileImg.image = UIImage(named: "feedProfileEmpty.png")
        }else{
            let url = URL(string: follower.imgURL)
            profileImg.load(url: url!)
        }
        
    }
}
