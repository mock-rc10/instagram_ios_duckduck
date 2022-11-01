//
//  SignUpViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/10/31.
//

import UIKit

class SignUpEmailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func SignInButtonTouchUpInside_SignUpEmail(_ sender: UIButton) {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        //self.navigationController?.pushViewController(signInViewController, animated: true)
        self.changeRootViewController(signInViewController)
    }
    
}
