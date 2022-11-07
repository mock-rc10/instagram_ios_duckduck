//
//  StoryUserCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit

class StoryUserCollectionViewCell: UICollectionViewCell {
    
    static let storyUserIdentifier = "StoryUserCollectionViewCell"
    
    @IBOutlet weak var storyUserProfile: UIImageView!
    @IBOutlet weak var storyBackground: UIImageView!
    @IBOutlet weak var storyUserUniqueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setStory(story: StoryListResult){
        //storyUserProfile.text = story.profileImgURL
        storyUserUniqueName.text = story.profile?.uniqueName
    }
}
