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
    private var storyListResult: StoryListResult = []
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

extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //내가 팔로우한 사람 수
        print(storyListResult.storyList?.count)
        return storyListResult.storyList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryUserCollectionViewCell.storyUserIdentifier, for: indexPath) as? StoryUserCollectionViewCell else { return UICollectionViewCell()}
        cell.setStory(story: storyListResult)
        print(storyListResult)
        return cell
    }
    
}
