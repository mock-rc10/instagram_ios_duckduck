//
//  HomeFeedTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/09.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {

    
    static let identifier = "HomeFeedTableViewCell"
    @IBOutlet weak var HomeFeedCollectionView: UICollectionView!
    private var homeFeedDataModel: HomeFeed = HomeFeed.shared
    var homeFeedResult: [HomeFeedResult] = [HomeFeedResult(postID: 0, profileImg: "", uniqueName: "", imgUrls: [""], isLike: false, postLikeUsernames: [""], postLikeCount: 0, content: "", hashtags: [""], comments:  [CommentElement(comment: RecommentClass(commentID: 0, profileImg: "", name: "", content: "", likeCount: 0, timeDiff: "", isLike: false, recommentID: 0), recomment: [RecommentClass(commentID: 0, profileImg: "", name: "", content: "", likeCount: 0, timeDiff: "", isLike: false, recommentID: 0)])], date: "")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        registerDelegate()
    }
    
    func setFeeds(feeds: [HomeFeedResult]){
        homeFeedResult = feeds
        HomeFeedCollectionView.reloadData()
    }
    private func registerXib(){
        let Nib = UINib(nibName: HomeFeedCollectionViewCell.identifier, bundle: nil)
        HomeFeedCollectionView.register(Nib, forCellWithReuseIdentifier: HomeFeedCollectionViewCell.identifier)
    }
    
    private func registerDelegate(){
        HomeFeedCollectionView.delegate = self
        HomeFeedCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
extension HomeFeedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //내가 팔로우한 사람 수
        return homeFeedDataModel.homeFeedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeFeedCollectionView.dequeueReusableCell(withReuseIdentifier: HomeFeedCollectionViewCell.identifier, for: indexPath) as? HomeFeedCollectionViewCell
        cell?.setFeed(feed: homeFeedResult[indexPath.row])
            return cell!
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 500)
    }
    }
    
    

