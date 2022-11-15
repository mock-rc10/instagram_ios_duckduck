//
//  HomeViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/04.
//

import UIKit
import YPImagePicker
import Alamofire

class HomeViewController: BaseViewController {

    @IBOutlet weak var homeTableView: UITableView!
    var accessToken: String? = ""
    lazy var storyDataManager: StoryDataManager = StoryDataManager()
    lazy var homeFeedDataManager: HomeFeedDataManager = HomeFeedDataManager()
    private var storyUserDataModel: Stories = Stories.shared
    private var homeFeedDataModel: HomeFeed = HomeFeed.shared
    private var postContentDataModel: PostContent = PostContent.shared
    var pickedImages: [String] = []
    var FirstImage: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
        //print(accessToken)
        requestStoriesLoad(token: accessToken!)
        requestHomeFeedLoad(token: accessToken!)
        // Do any additional setup after loading the view.
        registerXib()
        registerDelegate()
        initNavigationBar()
    }
    
    private func initNavigationBar(){
        //self.navigationController?.setBackgroundColor()
        let selector = #selector(newPost)
        let logoButton = self.navigationItem.makeSFSymbolLogoButton(self, action: selector, symbolName: "instagram_logo.png")
        let addPostButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "profileAddBtn.png")
        let likeButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "likeBtn.png")
        let dmButton = self.navigationItem.makeSFSymbolButton(self, action: selector, symbolName: "DMBtn.png")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action:nil)
        spacer.width = 15
        self.navigationItem.leftBarButtonItem = logoButton
        self.navigationItem.rightBarButtonItems = [dmButton,spacer, likeButton,spacer,addPostButton]
    }
    @objc fileprivate func newPost(){
        
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        config.library.maxNumberOfItems = 10
        config.library.mediaType = .photo
        config.wordings.libraryTitle = "최근 항목"
        config.wordings.next = "다음"
        config.wordings.cancel = "X"
        config.wordings.filter = "필터"
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking{ [self, unowned picker] items, _ in
            
            for item in items{
                switch item{
                case .photo(let p):
                    self.FirstImage.append(p.image)
                    postContentDataModel.setContentImage(result: FirstImage)
                default:
                    print("")
                }
            }
            /*
            if let photo = items.singlePhoto{
                print(photo.fromCamera)
                print(photo.image)
                print(photo.originalImage)
                print(photo.modifiedImage)
                print(photo.exifMeta)
            }
             */
            let url = "\(Constant.BASE_URL)/api/uploadFiles"
            let headers: HTTPHeaders = ["Content-type": "multipart/form-data"]
            for item2 in items{
                switch item2{
                case .photo(let p):
                    let imageData = p.image.pngData()!
                    AF.upload(multipartFormData: { multiPart in
                        multiPart.append(imageData, withName: "fileList", fileName: "p.png", mimeType: "image/png")
                    }, to: url, method: .post, headers: headers).validate().responseDecodable(of: PostImageUrlResponse.self) { response in
                        switch response.result {
                           
                        case .success(let response):
                            // 성공했을 때
                            //print(response)
                            if response.isSuccess, let result = response.result {
                                self.pickedImages.append(contentsOf: result)
                                for i in 0...result.count-1{
                                    self.postContentDataModel.setContentUrl(result: result[i])
                                }
                               
                                //self.postContentDataModel.setContentData(result: self.pickedImages)
                               // self.postContentDataModel.contentUrls = self.pickedImages
                            }
                            // 실패했을 때
                            else {
                                print("실패 코드에 따라 나누기")
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                            print("실패")
                        }
                         
                    }
                default:
                    print("")
                }
            }
            
            let backBarButtonItem = UIBarButtonItem(title: "", style: .bordered, target: self,action: nil)
            backBarButtonItem.tintColor =  .black
            self.navigationItem.backBarButtonItem = backBarButtonItem
            
            
            picker.dismiss(animated: true){
                let PostViewController = UIStoryboard(name: "PostStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PostVC") as? PostViewController
                //PostViewController?.data = FirstImage
                //PostViewController?.pickedImageUrls = pickedImages
                self.navigationController?.pushViewController(PostViewController!, animated: true)
            }
            
        }
        present(picker, animated: true, completion: nil)
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
