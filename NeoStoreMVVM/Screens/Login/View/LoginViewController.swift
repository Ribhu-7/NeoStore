//
//  LoginViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import UIKit


class LoginViewController: UIViewController {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameField.setContent("Username", "username_icon")
        passField.setContent("Password", "password_icon")
        loginBtn.changeView()
        navigationItem.backButtonTitle = ""
        
    }
    
    @IBAction func forgotPass(_ sender: Any) {
        
        let forgotVC = sb.instantiateViewController(withIdentifier: "ForgotVC")
        self.navigationController?.pushViewController(forgotVC, animated: true)
    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
        let registerVC = sb.instantiateViewController(withIdentifier: "RegisterVC")
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}
