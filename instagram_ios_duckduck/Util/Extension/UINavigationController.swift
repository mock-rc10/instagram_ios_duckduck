//
//  UINavigationController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/08.
//

import UIKit
extension UINavigationController{

    func setBackgroundColor(){
        navigationBar.barTintColor = UIColor.white
        //navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        //navigationBar.isTranslucent = false
    }
    
    func setBackgroundEmptyImage(){
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
}
