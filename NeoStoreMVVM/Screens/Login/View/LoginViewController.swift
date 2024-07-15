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
        
        navigationItem.backButtonTitle = ""
        usernameField.text = "riseabovehate10@gmail.com"
        passField.text = "Abcd@123"
        configuration()
    }
    
    func configuration(){
        usernameField.setContent("Username", "username_icon")
        passField.setContent("Password", "password_icon")
        loginBtn.changeView()
    }
    
    @IBAction func loginClick(_ sender: Any) {
        
        guard let emailId = usernameField.text else {return}
        guard let password = passField.text else {return}
        if (emailId.isValidEmail && password.isValidPassword){
            let logs = LoginModel(email: emailId, password: password)
            self.getRequest(logs: logs)
        } else {
            self.showAlert(message: "Invalid details")
        }
        
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
