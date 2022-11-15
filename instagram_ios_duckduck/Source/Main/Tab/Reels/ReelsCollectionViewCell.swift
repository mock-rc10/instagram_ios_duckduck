//
//  ReelsCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

import UIKit
import AVFoundation

class ReelsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ReelsCollectionViewCell"
    
    @IBOutlet weak var playerView: VideoView!
    
    @IBOutlet weak var circleProfileImg: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var uniqueName: UILabel!
    @IBOutlet weak var recProfileImg: UIImageView!
    @IBOutlet weak var optionImg: UIImageView!
    @IBOutlet weak var dmImg: UIImageView!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var commentImg: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var followLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        followLabel.layer.cornerRadius = 5
        followLabel.layer.borderColor = UIColor.white.cgColor
        followLabel.layer.borderWidth = 1
        // Initialization code
    }
    func setReelsCollectionViewCell(reelsData: ReelsResult){
        let url = URL(string: reelsData.vodURL)
        //searchFeedImage.load(url: url!)
        let playerItem = AVPlayerItem(url: url!)
        playerItem.preferredForwardBufferDuration = TimeInterval(1.0)
        playerView.player = AVPlayer(playerItem: playerItem)
        playerView.player?.play()
        
        likeCount.text = String(reelsData.reelsLikeCount)
        commentsCount.text = String(reelsData.comments.count)
        uniqueName.text = reelsData.uniqueName
        content.text = reelsData.content
        
        circleProfileImg.layer.cornerRadius = circleProfileImg.frame.height/2
        circleProfileImg.layer.borderWidth = 1
        circleProfileImg.clipsToBounds = true
        circleProfileImg.layer.borderColor = UIColor.clear.cgColor
        let profileUrl = URL(string: reelsData.profileImg)
        //searchFeedImage.load(url: url!)
        circleProfileImg.load(url: profileUrl!)
        recProfileImg.layer.cornerRadius = 5
        recProfileImg.load(url: profileUrl!)
    }
}
