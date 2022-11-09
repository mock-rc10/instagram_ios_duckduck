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
    lazy var homeFeedDataManager: HomeFeedDataManager = HomeFeedDataManager()
    private var storyUserDataModel: Stories = Stories.shared
    private var homeFeedDataModel: HomeFeed = HomeFeed.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        print(accessToken)
        requestStoriesLoad(token: accessToken!)
        requestHomeFeedLoad(token: accessToken!)
        // Do any additional setup after loading the view.
        registerXib()
        registerDelegate()
        initNavigationBar()
    }
    
    private func initNavigationBar(){
        self.navigationController?.setBackgroundColor()
        let logoButton = self.navigationItem.makeSFSymbolLogoButton(self, symbolName: "instagram_logo.png")
        let addPostButton = self.navigationItem.makeSFSymbolButton(self, symbolName: "profileAddBtn.png")
        let likeButton = self.navigationItem.makeSFSymbolButton(self, symbolName: "likeBtn.png")
        let dmButton = self.navigationItem.makeSFSymbolButton(self, symbolName: "DMBtn.png")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action:nil)
        spacer.width = 15
        self.navigationItem.leftBarButtonItem = logoButton
        self.navigationItem.rightBarButtonItems = [dmButton,spacer, likeButton,spacer,addPostButton]
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 90 : 1000
        
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
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.storyIdentifier, for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            let cellData = storyUserDataModel.StoryList
            cell.setStories(stories: cellData)
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeFeedTableViewCell.identifier, for: indexPath) as? HomeFeedTableViewCell else {
                return UITableViewCell()
            }
            let cellData = homeFeedDataModel.homeFeedList
            cell.setFeeds(feeds: cellData)
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
        storyUserDataModel.setStoriesData(result: result)
        homeTableView.reloadData()
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    private func registerXib(){
        let storyCell = UINib(nibName: StoryTableViewCell.storyIdentifier, bundle: nil)
        homeTableView.register(storyCell, forCellReuseIdentifier: StoryTableViewCell.storyIdentifier)
        let feedCell = UINib(nibName: HomeFeedTableViewCell.identifier, bundle: nil)
        homeTableView.register(feedCell, forCellReuseIdentifier: HomeFeedTableViewCell.identifier)
        }
    
    private func registerDelegate(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    func requestHomeFeedLoad(token: String){
        homeFeedDataManager.GetHomeFeed(delegate: self, token: token)
        
    }
    func didSuccessHomeFeedLoad(result: [HomeFeedResult]){
        print(result)
        homeFeedDataModel.setHomeFeedData(result: result)
        homeTableView.reloadData()
    }
}
