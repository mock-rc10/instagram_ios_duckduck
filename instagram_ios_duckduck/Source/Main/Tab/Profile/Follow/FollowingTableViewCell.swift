//
//  FollowerTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {
    static let identifier = "FollowingTableViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var uniqueNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFollowing(follower: FollowingResult){
        uniqueNameLabel.text = follower.uniqueName
        userNameLabel.text = follower.name
        if follower.imgURL == "" {
            profileImg.image = UIImage(named: "feedProfileEmpty.png")
        }else{
            let url = URL(string: follower.imgURL)
            profileImg.load(url: url!)
        }
        
    }
}
