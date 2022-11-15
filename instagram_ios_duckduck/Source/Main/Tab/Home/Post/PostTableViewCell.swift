//
//  PostTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import UIKit

class PostTableViewCell: UITableViewCell{
   

    static let identifier = "PostTableViewCell"
    @IBOutlet weak var postCollectionView: UICollectionView!
    var contentImages: UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerXib()
        registerDelegate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func registerXib(){
        let Nib = UINib(nibName:PostContentCollectionViewCell.identifier, bundle: nil)
        postCollectionView.register(Nib, forCellWithReuseIdentifier: PostContentCollectionViewCell.identifier)
    }
    
    private func registerDelegate(){
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
    }
    
    func setContentCell(data: UIImage){
        contentImages = data
        
    }
}
extension PostTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: PostContentCollectionViewCell.identifier, for: indexPath) as? PostContentCollectionViewCell
        cell?.setCell(image: contentImages!)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: postCollectionView.frame.width, height: 100)
    }
}
