//
//  SignUpPasswordViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import UIKit

class SignUpPasswordViewController: BaseViewController {

    private var userDataModel: SignUpUser = SignUpUser.shared
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTouchUpInside_SignUpPass(_ sender: UIButton) {
        userDataModel.addPassword(password: self.passwordTextField.text ?? "") 
    }
    
    
    @IBAction func signInButtonTouchUpInside_SignUpPass(_ sender: UIButton) {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")
        //self.navigationController?.pushViewController(signInViewController, animated: true)
        self.changeRootViewController(signInViewController)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
