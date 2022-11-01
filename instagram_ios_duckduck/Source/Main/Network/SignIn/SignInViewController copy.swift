//
//  SignInViewController.swift
//  Pods
//
//  Created by 권유정 on 2022/10/31.
//

import UIKit

class SignInViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

    @IBAction func SignUpButtonTouchUpInside_SignIn(_ sender: UIButton) {
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpEmailVC")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    

}
