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
    
    @IBOutlet weak var imagePageControl: UIPageControl!
    
    var images: [String] = [""]
    override func awakeFromNib() {
        super.awakeFromNib()
        //imagePageControl.numberOfPages = images.count
        imagePageControl.currentPage = 0
        imagePageControl.pageIndicatorTintColor = UIColor.lightGray
        imagePageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.addGestureRecognizer(swipeRight)
        // Initialization code
    }
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if (imagePageControl.currentPage<imagePageControl.numberOfPages-1) {
                    imagePageControl.currentPage = imagePageControl.currentPage + 1
                }
                print("Swiped Left")
            case UISwipeGestureRecognizer.Direction.right:
                if (imagePageControl.currentPage>0) {
                    imagePageControl.currentPage = imagePageControl.currentPage - 1
                }
                print("Swiped Right")
            default:
                break
            }
            let feedUrl = URL(string: images[imagePageControl.currentPage])
            feedImg.load(url: feedUrl!)
        }
    }
    func setFeed(feed: HomeFeedResult){
        print("!!!!!!!\(feed)")
        self.images = feed.imgUrls
        imagePageControl.numberOfPages = feed.imgUrls.count
        if(feed.profileImg != ""){
            let profileUrl = URL(string: feed.profileImg)
            userProfileImg.load(url: profileUrl!)
        }else{
            userProfileImg.image = UIImage(named: "feedProfileEmpty.png")
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
    
    @IBAction func imageChange(_ sender: UIPageControl) {
        let feedUrl = URL(string: images[imagePageControl.currentPage])
        feedImg.load(url: feedUrl!)
    }
}
