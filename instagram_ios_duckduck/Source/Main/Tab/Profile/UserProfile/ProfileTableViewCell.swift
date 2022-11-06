//
//  ProfileTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let profileIdentifier = "ProfileTableViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var feedCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
    func getProfile(profile: ProfileLookupResult){
        feedCount.text = String(profile.postCount)
        followerCount.text = String(profile.followerCount)
        followingCount.text = String(profile.followingCount)
        if profile.imgURL == "" {
            profileImage.image = UIImage(named: "ProfileEmpty.PNG")
        }else{
            let url = URL(string: profile.imgURL)
            profileImage.load(url: url!)
        }
        
    }
    
}

//url로 이미지 불러오기
extension UIImageView{
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}
