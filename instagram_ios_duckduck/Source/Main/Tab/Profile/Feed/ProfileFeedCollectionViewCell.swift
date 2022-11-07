//
//  ProfileFeedCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/07.
//

import UIKit

class ProfileFeedCollectionViewCell: UICollectionViewCell {
    
    static let profileFeedIdentifier = "ProfileFeedCollectionViewCell"
    @IBOutlet weak var profileFeedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setProfileFeedCollectionViewCell(profileImgURL: String){
        let url = URL(string: profileImgURL)
        profileFeedImageView.load(url: url!)
    }
}
