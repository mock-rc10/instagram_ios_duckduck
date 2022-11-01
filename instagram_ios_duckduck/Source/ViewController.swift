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

    @IBAction func signInButtonTouchUpInside_main(_ sender: UIButton) {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        //self.navigationController?.pushViewController(signInViewController, animated: true)
        self.navigationController?.pushViewController(signInViewController, animated: false)
    }
    
    @IBAction func signUpButtonTouchUpInside_main(_ sender: UIButton) {
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpEmailVC")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}

