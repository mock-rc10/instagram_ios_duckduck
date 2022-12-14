//
//  SignUpUniqueNameViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import UIKit

class SignUpUniqueNameViewController: BaseViewController {

    private var userDataModel: SignUpUser = SignUpUser.shared
    
    @IBOutlet weak var uniqueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTouchUpInside_SignUpUnique(_ sender: UIButton) {
        userDataModel.addUniqueName(unique: uniqueTextField.text ?? "") 
    }
    
    @IBAction func signInButtonTouchUpInside_SignUpUnique(_ sender: UIButton) {
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
