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
    let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
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

extension ProfileFeedTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = 3
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
