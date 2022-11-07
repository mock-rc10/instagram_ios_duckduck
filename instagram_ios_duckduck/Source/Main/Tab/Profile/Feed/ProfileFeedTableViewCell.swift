//
//  ProfileFeedTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/07.
//

import UIKit

class ProfileFeedTableViewCell: UITableViewCell {
    private var profileFeedDataModel: SettingProfileFeed = SettingProfileFeed.shared
    private var profileFeedLookupResult: [ProfileFeedLookupResult] = []
    static let ProfileFeedTableViewIdentifier = "ProfileFeedTableViewCell"
    @IBOutlet weak var profileFeedCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        registerDelegate()
      }
    func setProfileFeed(profile: [ProfileFeedLookupResult]){
        profileFeedLookupResult = profile
        profileFeedCollectionView.reloadData()
        
    }
      private func registerXib(){
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
    
}

extension ProfileFeedTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileFeedLookupResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileFeedCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileFeedCollectionViewCell.profileFeedIdentifier, for: indexPath) as? ProfileFeedCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setProfileFeedCollectionViewCell(profileImgURL: profileFeedLookupResult[indexPath.row].imgUrls[0])
       
        return cell
    }
}
