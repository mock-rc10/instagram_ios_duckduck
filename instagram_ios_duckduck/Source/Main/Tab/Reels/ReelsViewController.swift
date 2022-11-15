//
//  ReelsViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

import UIKit

class ReelsViewController: BaseViewController {
    lazy var reelsDataManager: ReelsDataManager = ReelsDataManager()
    private var reelsDataModel: SettingReels = SettingReels.shared
    var accessToken: String? = ""
    
    @IBOutlet weak var reelsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        initNavigationBar()
        requestGet {
            self.setup()
        }
        // Do any additional setup after loading the view.
    }
    func initNavigationBar(){
        //self.navigationController?.setBackgroundColor()
        let uniqueName = self.navigationItem.makeWhiteLabel( title: "릴스")
        self.navigationItem.leftBarButtonItem = uniqueName
        self.navigationController?.setBackgroundEmptyImage()
        
        let selector = #selector(test)
        let CameraButton = self.navigationItem.makeSFSymbolWhiteButton(self, action: selector, symbolName: "WhiteCamera.png")
        self.navigationItem.rightBarButtonItem = CameraButton
    }
    @objc func test(){
        
    }
    func requestGet(complition: @escaping() -> ()){
        requestGetReels(token: accessToken!)
        complition()
    }
    func setup(){
        registerXib()
        registerDelegate()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ReelsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reelsDataModel.reelsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reelsCollectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else{
            return UICollectionViewCell()
        }
        let cellData = reelsDataModel.getReelsData()
        cell.setReelsCollectionViewCell(reelsData: cellData[indexPath.row])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    
}
extension ReelsViewController{
    func requestGetReels(token: String){
        reelsDataManager.GetReels(delegate: self, token: token)
    }
    func didSuccessReelsLoad(result: [ReelsResult]){
        reelsDataModel.setReelsData(result: result)
        reelsCollectionView.reloadData()
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let searchCell = UINib(nibName: ReelsCollectionViewCell.identifier, bundle: nil)
        reelsCollectionView.register(searchCell, forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
        }
    private func registerDelegate(){
        reelsCollectionView.delegate = self
        reelsCollectionView.dataSource = self
    }

}
