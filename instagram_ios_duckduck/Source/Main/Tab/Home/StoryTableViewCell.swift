//
//  StoryTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell{
   

    static let storyIdentifier = "StoryTableViewCell"
    @IBOutlet weak var storyCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerXib()
        registerDelegate()
    }
    
    private func registerXib(){
        let storyNib = UINib(nibName: StoryUserCollectionViewCell.storyUserIdentifier, bundle: nil)
        storyCollection.register(storyNib, forCellWithReuseIdentifier: StoryUserCollectionViewCell.storyUserIdentifier)
    }
    
    private func registerDelegate(){
        storyCollection.delegate = self
        storyCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storyCollection.dequeueReusableCell(withReuseIdentifier: StoryUserCollectionViewCell.storyUserIdentifier, for: indexPath) as! StoryUserCollectionViewCell else { return UICollectionViewCell()}
        cell.setData(userData: )
        return cell
    }
    
}
