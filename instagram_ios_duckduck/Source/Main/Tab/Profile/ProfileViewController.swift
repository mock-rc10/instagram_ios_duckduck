//
//  ProfileViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import UIKit
import Pageboy
import Tabman

class ProfileViewController: TabmanViewController {

    
    @IBOutlet weak var profileUniqueName: UIBarButtonItem!
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
            cell.getProfile(profile: cellData)
            
            return cell
        case 1:
            guard let cell =
                    self.dataSource = self
                    let bar = TMBar.ButtonBar()
                    bar.backgroundView.style = .blur(style: .light)
                    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
                    bar.buttons.customize{(button) in
                        button.tintColor = .systemGray
                        button.selectedTintColor = .black
                        
                    }
                    bar.indicator.weight = .custom(value: 2)
                    bar.indicator.tintColor = .orange
                    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
            ProfileTableView.dequeueReusableCell(withIdentifier: ProfileFeedTableViewCell.profileFeedIdentifier, for: indexPath) as? ProfileFeedTableViewCell
            else {
                return UITableViewCell()
            }
            
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
        profileDataModel.setProfile(result: result)
        profileUniqueName.title = result.uniqueName
        ProfileTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    private func registerXib(){
        let profileCell = UINib(nibName: ProfileTableViewCell.profileIdentifier, bundle: nil)
        ProfileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.profileIdentifier)
        let profileFeedCell = UINib(nibName: "ProfileFeedTableViewCell", bundle: ProfileFeedTableViewCell.bundle)
        ProfileTableView.register(profileFeedCell, forCellReuseIdentifier: ProfileFeedTableViewCell.profileFeedIdentifier)
        }
    private func registerDelegate(){
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
    }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index{
        case 0:
            return TMBarItem(title: "경기도")
        case 1:
            return TMBarItem(title: "부산")
        case 2:
            return TMBarItem(title: "전남")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        print(index)
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: 0)
    }
}
