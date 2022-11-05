//
//  ProfileViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet var ProfileTableView: UITableView!
    var accessToken: String? = ""
    lazy var profileDataManager: ProfileDataManager = ProfileDataManager()
    private var profileDataModel: SettingProfile = SettingProfile.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        requestProfileDisplay(token: accessToken!)
        registerXib()
        registerDelegate()
        // Do any additional setup after loading the view.
    }
    
    

}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return indexPath.section == 0 ? 180 : 488
       }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            //피드 게시물 개수
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = ProfileTableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.profileIdentifier, for: indexPath) as? ProfileTableViewCell
            else {
                return UITableViewCell()
            }
            let cellData = profileDataModel.userProfile
            
            cell.getProfile(profile: cellData)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
}

extension ProfileViewController {
    func requestProfileDisplay(token: String){
        profileDataManager.GetProfile(delegate: self, token: token)
        
    }
    func didSuccessLookupProfile(result: ProfileLookupResult){
        //스토리 화면 보여주기
        print("----------------")
        print(result)
        
        profileDataModel.setProfile(result: result)
        
        ProfileTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let profileCell = UINib(nibName: ProfileTableViewCell.profileIdentifier, bundle: nil)
        ProfileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.profileIdentifier)
        }
    private func registerDelegate(){
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
    }
}
