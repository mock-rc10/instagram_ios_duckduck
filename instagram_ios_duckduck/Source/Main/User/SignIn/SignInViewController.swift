//
//  SignInViewController.swift
//  Pods
//
//  Created by 권유정 on 2022/10/31.
//

import UIKit
import FacebookLogin

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
        let input = SignInRequest(identity: emailTextField.text! ?? "", password: passwordTextField.text! ?? "")
        signInDataManager.postSignIn(input, delegate: self)
    }
    
    @IBAction func facebookButtonTouchUpInside(_ sender: UIButton) {
        let manager = LoginManager()
        manager.logIn(permissions: ["public_profile"], from: self){
            result, error in
            if let error = error{
                print("Process error: \(error)")
                return
            }
            guard let result = result else{
                print("No Result")
                return
            }
            if result.isCancelled{
                print("Login Cancelled")
                return
            }
            // result properties
            //  - token : 액세스 토큰
            //  - isCancelled : 사용자가 로그인을 취소했는지 여부
            //  - grantedPermissions : 부여 된 권한 집합
            //  - declinedPermissions : 거부 된 권한 집합
        }
        if let token = AccessToken.current,
           !token.isExpired{
            //로그인 여부 또는 액세스 토큰 확인
            print("Facebook Access Token: \(token)")
            let TabViewController = UIStoryboard(name: "TabBarStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TabVC")
            self.navigationController?.pushViewController(TabViewController, animated: true)
            self.dismissIndicator()
            
        }
        
    }
    
    @IBAction func SignUpButtonTouchUpInside_SignIn(_ sender: UIButton) {
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpEmailVC")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    

    
}

extension SignInViewController {
    func didSuccessSignIn(_ result: SignInResult){
        //self.presentAlert(title: "로그인에 성공하였습니다", message: result.accessToken)
        UserDefaults.standard.set(result.accessToken, forKey: "accessToken")
        let TabViewController = UIStoryboard(name: "TabBarStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TabVC")
        self.navigationController?.pushViewController(TabViewController, animated: true)
        self.dismissIndicator()
        //IndicatorView.shared.dismiss()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
