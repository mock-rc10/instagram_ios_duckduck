//
//  ShopCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShopCollectionViewCell"
    
    @IBOutlet weak var shopDataImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setShopCollectionViewCell(imgUrl: String){
        let url = URL(string: imgUrl)
        shopDataImage.load(url: url!)
    }

}
