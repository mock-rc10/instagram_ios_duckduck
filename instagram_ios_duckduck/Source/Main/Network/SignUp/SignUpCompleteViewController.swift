//
//  SignUpCompleteViewController.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import UIKit

class SignUpCompleteViewController: BaseViewController {

    private var userDataModel: SignUpUser = SignUpUser.shared
    
    @IBOutlet weak var uniqueNameConfirmLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uniqueNameConfirmLabel.text = userDataModel.uniqueName
    }
    
    
    @IBAction func SignUpCompleteButtonTouchUpInside(_ sender: UIButton) {
        userDataModel.addUser()
        print(userDataModel.userList)
    }
    
    @IBAction func SignInButtonTouchUpInside_SignUpComplete(_ sender: UIButton) {
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
