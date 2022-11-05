//
//  SignUpViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/10/31.
//

import UIKit

class SignUpEmailViewController: BaseViewController {
    
    private var userDataModel: SignUpUser = SignUpUser.shared
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextButtonTouchUpInside_SignUpEmail(_ sender: UIButton) {
        //텍스트 필드 값 없을경우 에러처리 
        userDataModel.addEmail(email: emailTextField.text ?? "") 
    }
    
    
    @IBAction func signInButtonTouchUpInside_SignUpEmail(_ sender: UIButton) {
        /*
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        //self.navigationController?.pushViewController(signInViewController, animated: true)
        self.changeRootViewController(signInViewController)
         */
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
