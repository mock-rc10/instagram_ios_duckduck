//
//  StoryTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell{
   

    static let storyIdentifier = "StoryTableViewCell"
    @IBOutlet weak var storyCollectionView: UICollectionView!
    private var storyUserDataModel: Stories = Stories.shared
    private var storyListResult: StoryListResult = StoryListResult(profile: Profile(userId: 0, uniqueName: "", profileImgURL: ""), storyList: [Profile(userId: 0, uniqueName: "", profileImgURL: "")])
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerXib()
        registerDelegate()
        
    }
    
    func setStories(stories: StoryListResult){
        storyListResult = stories
        storyCollectionView.reloadData()
    }
    private func registerXib(){
        let storyNib = UINib(nibName: StoryUserCollectionViewCell.storyUserIdentifier, bundle: nil)
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: StoryUserCollectionViewCell.storyUserIdentifier)
    }
    
    private func registerDelegate(){
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //내가 팔로우한 사람 수
        return storyListResult.storyList!.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryUserCollectionViewCell.storyUserIdentifier, for: indexPath) as? StoryUserCollectionViewCell
        switch indexPath.row{
        case 0:
            cell?.setStory(story: storyListResult.profile!, user: 0)
            return cell!
        default:
            cell?.setStory(story: storyListResult.storyList![indexPath.row - 1], user: 1)
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
