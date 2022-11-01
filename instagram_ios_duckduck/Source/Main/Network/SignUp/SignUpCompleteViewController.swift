//
//  SignUpCompleteViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import UIKit

class SignUpCompleteViewController: BaseViewController {
    lazy var signUpDataManager: SignUpDataManager = SignUpDataManager()
    private var userDataModel: SignUpUser = SignUpUser.shared
    
    @IBOutlet weak var uniqueNameConfirmLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uniqueNameConfirmLabel.text = "\(userDataModel.uniqueName) 님으로 가입하시겠어요?"
    }
    
    
    @IBAction func SignUpCompleteButtonTouchUpInside(_ sender: UIButton) {
        let user: User = userDataModel.addUser()
    
        self.showIndicator()
        let signUpInput = SignUpRequest(facebook: false, email: user.email, password: user.email, name: user.name, uniqueName: user.uniqueName)
        signUpDataManager.postSignUp(signUpInput, delegate: self)
    }
    
    @IBAction func SignInButtonTouchUpInside_SignUpComplete(_ sender: UIButton) {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        //self.navigationController?.pushViewController(signInViewController, animated: true)
        self.changeRootViewController(signInViewController)
    }
}
extension SignUpCompleteViewController {
    func didSuccessSignUp(_ result: SignUpResult){
        //self.presentAlert(title: "로그인에 성공하였습니다", message: result.accessToken)
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        self.navigationController?.pushViewController(signInViewController, animated: true)
        self.dismissIndicator()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
