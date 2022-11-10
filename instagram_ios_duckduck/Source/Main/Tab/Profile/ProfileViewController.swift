//
//  ProfileViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit
import Pageboy
import Tabman

class ProfileViewController: BaseViewController {

    
    //@IBOutlet weak var profileUniqueName: UIBarButtonItem!
    @IBOutlet var ProfileTableView: UITableView!
    var accessToken: String? = ""
    lazy var profileDataManager: ProfileDataManager = ProfileDataManager()
    private var profileDataModel: SettingProfile = SettingProfile.shared
    
    lazy var profileFeedDataManager: ProfileFeedDataManager = ProfileFeedDataManager()
    private var profileFeedDataModel: SettingProfileFeed = SettingProfileFeed.shared
    
    private var profileLookupResult: ProfileLookupResult = ProfileLookupResult(uniqueName: "", name: "", imgURL: "", postCount: 0, followingCount: 0, followerCount: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        
        requestProfile {
            self.setup()
            self.initNavigationBar()
        }
        
        // Do any additional setup after loading the view.
    }
    
    func requestProfile(complition: @escaping() -> ()){
        requestProfileLoad(token: accessToken!)
        requestProfileFeedLoad(token: accessToken!)
        complition()
    }
    func setup(){
        registerXib()
        registerDelegate()
    }
    
    private func initNavigationBar(){
        self.navigationController?.setBackgroundColor()
        print(profileLookupResult.uniqueName)
        
        let selector = #selector(test)
        let addPostButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "profileAddBtn.png")
        let ListButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "profileListBtn.png")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action:nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [ListButton,spacer,addPostButton]
    }
    
    @objc func test(){
        
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
            return 1
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
            cell.setProfile(profile: cellData)
            
            return cell
        case 1:
            guard let cell = ProfileTableView.dequeueReusableCell(withIdentifier: ProfileFeedTableViewCell.ProfileFeedTableViewIdentifier, for: indexPath) as? ProfileFeedTableViewCell
            else {
                return UITableViewCell()
            }
            let cellData = profileFeedDataModel.profileFeed
            //print("*******")
            //print(cellData)
            cell.setProfileFeed(profile: cellData)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
}

extension ProfileViewController {
    func requestProfileLoad(token: String){
        profileDataManager.GetProfile(delegate: self, token: token)
        
    }
    func didSuccessProfileLoad(result: ProfileLookupResult){
        profileDataModel.setProfile(result: result)
        let uniqueName = self.navigationItem.makeLabel( title: result.uniqueName)
        self.navigationItem.leftBarButtonItem = uniqueName
        print(profileLookupResult.uniqueName)
        //profileUniqueName.title = result.uniqueName
        ProfileTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let profileCell = UINib(nibName: ProfileTableViewCell.profileIdentifier, bundle: nil)
        ProfileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.profileIdentifier)
        let profileFeedCell = UINib(nibName: ProfileFeedTableViewCell.ProfileFeedTableViewIdentifier, bundle: nil)
        ProfileTableView.register(profileFeedCell, forCellReuseIdentifier: ProfileFeedTableViewCell.ProfileFeedTableViewIdentifier)
        }
    private func registerDelegate(){
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
    }
}

extension ProfileViewController{
    func requestProfileFeedLoad(token: String){
        profileFeedDataManager.GetProfileFeed(delegate: self, token: token)
    }
    func didSuccessProfileFeedLoad(result: [ProfileFeedLookupResult]){
        profileFeedDataModel.setProfileFeed(result: result)
        ProfileTableView.reloadData()
    }
}
