//
//  HomeViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/04.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    //var storyProfileArray: Array = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as?
                    UICollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
    }
    
    
    
}
