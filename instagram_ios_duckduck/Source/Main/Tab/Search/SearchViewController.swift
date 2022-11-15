//
//  SearchViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

import UIKit

class SearchViewController: BaseViewController {
    lazy var searchFeedDataManager: SearchDataManager = SearchDataManager()
    private var searchFeedDataModel: SearchFeed = SearchFeed.shared
    let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    @IBOutlet weak var searchFeedCollectionView: UICollectionView!
    
    var accessToken: String? = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        //print(accessToken)
        requestSearchFeed {
            self.setup()
        }
       
        
    }
    func requestSearchFeed(complition: @escaping() -> ()){
        searchFeedDataManager.GetSearchFeed(delegate: self, token: accessToken!)
        complition()
    }
    func setup(){
        registerXib()
        registerDelegate()
    }

}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchFeedDataModel.searchFeedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchFeedCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setSearchFeedCollectionViewCell(imgURL: searchFeedDataModel.searchFeedData[indexPath.row].imgUrls[0])
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = 3
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let heightPadding = sectionInsets.bottom * (itemsPerRow + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        let cellheight = (width - heightPadding)/itemsPerRow
        return CGSize(width: cellWidth, height: cellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension SearchViewController {
    
    func didSuccessSearchFeedLoad(result: [SearchResult]){
        searchFeedDataModel.setSearchFeed(result: result)
        for j in 0...2{
            for i in 0...result.count-1{
                searchFeedDataModel.setappendSearchFeed(result: result[i])
            }
        }
        
        searchFeedCollectionView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    private func registerXib(){
        let searchCell = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        searchFeedCollectionView.register(searchCell, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        }
    private func registerDelegate(){
        searchFeedCollectionView.delegate = self
        searchFeedCollectionView.dataSource = self
    }
}

