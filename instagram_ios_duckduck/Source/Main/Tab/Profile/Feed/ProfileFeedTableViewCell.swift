//
//  ProfileFeedTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/07.
//

import UIKit

class ProfileFeedTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    private var profileFeedDataModel: SettingProfileFeed = SettingProfileFeed.shared
    
    static let ProfileFeedTableViewIdentifier = "ProfileFeedTableViewCell"
    @IBOutlet weak var profileFeedCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        registerXib()
        registerDelegate()
      }
      
      private func registerXib(){
          print("----------------------")
          let storyNib = UINib(nibName: ProfileFeedCollectionViewCell.profileFeedIdentifier, bundle: nil)
          profileFeedCollectionView.register(storyNib, forCellWithReuseIdentifier: ProfileFeedCollectionViewCell.profileFeedIdentifier)
      }
      
      private func registerDelegate(){
          profileFeedCollectionView.delegate = self
          profileFeedCollectionView.dataSource = self
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileFeedDataModel.profileFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileFeedCollectionViewCell.profileFeedIdentifier, for: indexPath) as? ProfileFeedCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.getProfileFeed(profileImgURL: profileFeedDataModel.profileFeed[indexPath.row].imgUrls[0])
        print( profileFeedDataModel.profileFeed[indexPath.row].imgUrls[0])
        return cell
    }
}
