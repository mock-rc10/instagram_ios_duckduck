//
//  FollowerViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class FollowerViewController: BaseViewController{
    
    
    var accessToken: String? = ""
    var name: String? = ""
    lazy var followerDataManager: FollowerDataManager = FollowerDataManager()
    private var followerDataModel: SettingFollower = SettingFollower.shared
    
    @IBOutlet weak var followerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        name = UserDefaults.standard.string(forKey: "name")
        requestFollow {
            self.setup()
            //self.initNavigationBar()
        }
        
        // Do any additional setup after loading the view.
    }
    func requestFollow(complition: @escaping() -> ()){
        requestGetFollow(token: accessToken!)
        complition()
    }
    func setup(){
        registerXib()
        registerDelegate()
    }

  

}
extension FollowerViewController{
    func requestGetFollow(token: String){
        followerDataManager.GetFollower(delegate: self, token: token)
        
    }
    func didSuccessGetFollower(result: [FollowerResult]){
        followerDataModel.setFollower(result: result)
        //let uniqueName = self.navigationItem.makeLabel( title: name!)
        self.navigationItem.title = name!
        followerTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let followerCell = UINib(nibName: FollowerTableViewCell.identifier, bundle: nil)
        followerTableView.register(followerCell, forCellReuseIdentifier: FollowerTableViewCell.identifier)
        }
    private func registerDelegate(){
        followerTableView.delegate = self
        followerTableView.dataSource = self
    }
}
extension FollowerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followerDataModel.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = followerTableView.dequeueReusableCell(withIdentifier: FollowerTableViewCell.identifier, for: indexPath) as? FollowerTableViewCell
        else {
            return UITableViewCell()
        }
        let cellData = followerDataModel.getFollower()
        cell.setFollower(follower: cellData[indexPath.row])
        
        return cell
    }
    
    
}
