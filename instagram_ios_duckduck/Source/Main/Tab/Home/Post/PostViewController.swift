//
//  PostViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import UIKit
import YPImagePicker

class PostViewController: UIViewController {
    var data : [UIImage] = []
    private var postContentDataModel: PostContent = PostContent()
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        postContentDataModel.setContentData(result: data)
        registerXib()
        registerDelegate()
        // Do any additional setup after loading the view.
    }
    func initNavigationBar(){
        self.navigationItem.title = "새 게시물"
        let rightBarButtonItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
            case 0:
                return 100
            case 1,2,3,5:
                return 50
            case 4:
                return 130
            default:
                return 10
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
            case 0,1,2,3,4,5:
                return 1
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            let cellData = postContentDataModel.contentImages
            cell.setContentCell(data: cellData)
            return cell
        case 1:
            guard let basicCell = postTableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as? BasicTableViewCell else{
                return UITableViewCell()
            }
            basicCell.setCell(text: "사람 태그하기")
            return basicCell
        case 2:
            guard let basicCell = postTableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as? BasicTableViewCell else{
                return UITableViewCell()
            }
            basicCell.setCell(text: "위치 추가")
            return basicCell
        case 3:
            guard let basicCell = postTableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as? BasicTableViewCell else{
                return UITableViewCell()
            }
            basicCell.setCell(text: "음악 추가")
            return basicCell
        case 4:
            guard let switchCell = postTableView.dequeueReusableCell(withIdentifier: snsSwitchTableViewCell.identifier, for: indexPath) as? snsSwitchTableViewCell else{
                return UITableViewCell()
            }
            return switchCell
        case 5:
            guard let basicCell = postTableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as? BasicTableViewCell else{
                return UITableViewCell()
            }
            basicCell.setCell(text: "고급 설정")
            return basicCell
        default:
            return UITableViewCell()
        }
    }
    
    func registerXib(){
        let ContentCell = UINib(nibName: PostTableViewCell.identifier, bundle: nil)
        postTableView.register(ContentCell, forCellReuseIdentifier: PostTableViewCell.identifier)
        let BasicCell = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        postTableView.register(BasicCell, forCellReuseIdentifier: BasicTableViewCell.identifier)
        let switchCell = UINib(nibName: snsSwitchTableViewCell.identifier, bundle: nil)
        postTableView.register(switchCell, forCellReuseIdentifier: snsSwitchTableViewCell.identifier)
    }
    func registerDelegate(){
        postTableView.delegate = self
        postTableView.dataSource = self
    }
}
