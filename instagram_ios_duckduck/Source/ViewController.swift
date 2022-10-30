//
//  ViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/10/29.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonTouchUpInside(_ sender: UIButton) {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        self.navigationController?.pushViewController(signInViewController, animated: true)
        //self.changeRootViewController(signInViewController)
    }
    
    @IBAction func signUpButtonTouchUpInside(_ sender: UIButton) {
        let signUpViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}

