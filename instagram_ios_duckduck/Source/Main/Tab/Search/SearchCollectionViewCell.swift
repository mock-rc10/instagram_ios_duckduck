//
//  SearchCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    
    @IBOutlet weak var searchFeedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setSearchFeedCollectionViewCell(imgURL: String){
        let url = URL(string: imgURL)
        searchFeedImage.load(url: url!)
    }
}
