//
//  HomeViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/04.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var homeTableView: UITableView!
    var accessToken: String? = ""
    lazy var storyDataManager: StoryDataManager = StoryDataManager()
    private var storyUserDataModel: Stories = Stories.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        requestStoriesLoad(token: accessToken!)
        // Do any additional setup after loading the view.
        registerXib()
        registerDelegate()
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 110 : 500
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            //피드 게시물 개수
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.storyIdentifier, for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            let cellData = storyUserDataModel.StoryList
            cell.setStories(stories: cellData)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
}

extension HomeViewController {
    func requestStoriesLoad(token: String){
        storyDataManager.GetStories(delegate: self, token: token)
        
    }
    func didSuccessStoriesDisplay(result: StoryListResult){
        //스토리 화면 보여주기
        print(result)
        storyUserDataModel.setStoriesData(result: result)
        homeTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    private func registerXib(){
        let storyCell = UINib(nibName: StoryTableViewCell.storyIdentifier, bundle: nil)
        homeTableView.register(storyCell, forCellReuseIdentifier: StoryTableViewCell.storyIdentifier)
        }
    
    private func registerDelegate(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
}
