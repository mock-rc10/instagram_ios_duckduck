//
//  HomeFeedCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/09.
//

import UIKit

class HomeFeedCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeFeedCollectionViewCell"
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var userUniqueName: UILabel!
    @IBOutlet weak var optionBtn: UIImageView!
    @IBOutlet weak var feedImg: UIImageView!
    @IBOutlet weak var likeBtn: UIImageView!
    @IBOutlet weak var commentBtn: UIImageView!
    @IBOutlet weak var dmBtn: UIImageView!
    @IBOutlet weak var bookMarkBtn: UIImageView!
    @IBOutlet weak var likeUserLabel: UILabel!
    @IBOutlet weak var uniqueNameAndPostLabel: UILabel!
    @IBOutlet weak var uniqueNameAndCommentsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setFeed(feed: HomeFeedResult){
        if(feed.profileImg != ""){
            let profileUrl = URL(string: feed.profileImg)
            userProfileImg.load(url: profileUrl!)
        }
        if feed.imgUrls[0] != ""{
            let feedUrl = URL(string: feed.imgUrls[0])
            feedImg.load(url: feedUrl!)
        }
        userUniqueName.text = feed.uniqueName
        if(feed.postLikeCount == 1){
            likeUserLabel.text = "\(feed.postLikeUsernames[0])님이 좋아합니다"
        } else if(feed.postLikeCount > 1){
            likeUserLabel.text = "\(feed.postLikeUsernames[0])님 외 \(feed.postLikeCount - 1)명이 좋아합니다"
        }
        if feed.content != ""{
            uniqueNameAndPostLabel.text = "\(feed.uniqueName) \(feed.content)"
        }
        if feed.comments.isEmpty != true {
            uniqueNameAndCommentsLabel.text = "\(feed.comments[0].comment.name) \(feed.comments[0].comment.content)"
        }
        dateLabel.text = "\(feed.date)"
        
    }
}
