//
//  FollowingViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit

class FollowingViewController: BaseViewController {
    var accessToken: String? = ""
    var name: String? = ""
    lazy var followingDataManager: FollowingDataManager = FollowingDataManager()
    private var followingDataModel: SettingFollowing = SettingFollowing.shared
    
    @IBOutlet weak var followingTableView: UITableView!
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
        requestGetFollowing(token: accessToken!)
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

extension FollowingViewController{
    func requestGetFollowing(token: String){
        followingDataManager.GetFollowing(delegate: self, token: token)
        
    }
    func didSuccessGetFollowing(result: [FollowingResult]){
        followingDataModel.setFollowing(result: result)
        //let uniqueName = self.navigationItem.makeLabel( title: name!)
        self.navigationItem.title = name!
        followingTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let followingCell = UINib(nibName: FollowingTableViewCell.identifier, bundle: nil)
        followingTableView.register(followingCell, forCellReuseIdentifier: FollowingTableViewCell.identifier)
        }
    private func registerDelegate(){
        followingTableView.delegate = self
        followingTableView.dataSource = self
    }
}
extension FollowingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followingDataModel.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = followingTableView.dequeueReusableCell(withIdentifier: FollowingTableViewCell.identifier, for: indexPath) as? FollowingTableViewCell
        else {
            return UITableViewCell()
        }
        let cellData = followingDataModel.getFollowing()
        cell.setFollowing(follower: cellData[indexPath.row])
        
        return cell
    }
    
    
}
