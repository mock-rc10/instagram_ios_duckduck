//
//  SignInViewController.swift
//  Pods
//
//  Created by 권유정 on 2022/10/31.
//

import UIKit

class SignInViewController: BaseViewController {
    lazy var signInDataManager: SignInDataManager = SignInDataManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func SignInButtonTouchUpInside_SignIn(_ sender: UIButton) {
        
        self.showIndicator()
        let input = SignInRequest(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        signInDataManager.postSignIn(input, delegate: self)
    }
    
    @IBAction func SignUpButtonTouchUpInside_SignIn(_ sender: UIButton) {
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpEmailVC")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    

}

extension SignInViewController {
    func didSuccessSignIn(_ result: SignInResult){
        //self.presentAlert(title: "로그인에 성공하였습니다", message: result.accessToken)
        let TabViewController = UIStoryboard(name: "TabBarStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TabVC")
        self.navigationController?.pushViewController(TabViewController, animated: true)
        self.dismissIndicator()
        //IndicatorView.shared.dismiss()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
