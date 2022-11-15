//
//  ShopViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class ShopViewController: BaseViewController {
    lazy var shopDataManager: ShopDataManager = ShopDataManager()
    private var shopDataModel: ShopData = ShopData.shared
    let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestShop{
            self.setup()
            self.initNavigationBar()
        }
        // Do any additional setup after loading the view.
    }
    func requestShop(complition: @escaping() -> ()){
        shopDataManager.GetShopData(delegate: self)
        complition()
    }
    func setup(){
        registerXib()
        registerDelegate()
    }
    private func initNavigationBar(){
        self.navigationController?.setBackgroundColor()
        //print(profileLookupResult.uniqueName)
        let shopLabel = self.navigationItem.makeLabel(title: "Shop")
        self.navigationItem.leftBarButtonItem = shopLabel
        
        let selector = #selector(test)
        let wishButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "wishBtn.png")
        let ListButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "profileListBtn.png")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action:nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [ListButton,spacer,wishButton]
    }
    @objc func test(){
        
    }
}
extension ShopViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataModel.shopData.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath) as? ShopCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setShopCollectionViewCell(imgUrl: shopDataModel.shopData[indexPath.row])
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let itemsPerRow: CGFloat = 2
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension ShopViewController {
    
    func didSuccessShopLoad(result: [String]){
        shopDataModel.setShopData(result: result)
        shopCollectionView.reloadData()
    }

    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    private func registerXib(){
        let shopCell = UINib(nibName: ShopCollectionViewCell.identifier, bundle: nil)
        shopCollectionView.register(shopCell, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
        }
    private func registerDelegate(){
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
    }
}


