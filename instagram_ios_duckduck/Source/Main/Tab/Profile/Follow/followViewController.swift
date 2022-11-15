//
//  followViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit
import Tabman
import Pageboy

class followViewController: TabmanViewController {
    @IBOutlet weak var tabView: UIView!
    var viewControllers: [UIViewController] = []
    var followerCount: String = ""
    var followingCount: String = ""
    var name: String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        name = UserDefaults.standard.string(forKey: "name")
        initTabView()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .bordered, target: self,action: nil)
        backBarButtonItem.tintColor =  .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationItem.title = name!
        // Do any additional setup after loading the view.
    }
    
    func initTabView(){
        let followerVC = storyboard?.instantiateViewController(withIdentifier: "followerVC") as! FollowerViewController
       
        let followingVC = storyboard?.instantiateViewController(withIdentifier: "followingVC") as! FollowingViewController
        
        viewControllers.append(followerVC)
        viewControllers.append(followingVC)
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .intrinsic
        bar.layout.interButtonSpacing = tabView.bounds.width/2
        //bar.backgroundView.style = .blur(style: .light)
        //bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        bar.buttons.customize{(button) in
            button.tintColor = .systemGray
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 13)
            
        }
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }


}

extension followViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index{
        case 0:
            return TMBarItem(title: "\(followerCount) 팔로워")
        case 1:
            return TMBarItem(title: "\(followingCount) 팔로잉")
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
        return .at(index: 1)
    }
}

