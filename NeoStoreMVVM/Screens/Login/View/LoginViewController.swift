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
    var resp: LoginResponse?
    
    var userDefault: UserClassSettings?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.backButtonTitle = ""
        //let defaults = UserDefaults.standard
//        defaults.set("riseabovehate10@gmail.com", forKey: "username")
//        defaults.set("Abcd@1234", forKey: "password")
        usernameField.text = "riseabovehate10@gmail.com"
        passField.text = "Abcd@1234"
        configuration()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    func configuration(){
        //UserClassSettings.shared.password
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
            
            UserDefaults.standard.set(emailId, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
        } else {
            self.showAlert(message: "Invalid details")
        }
        print(UserDefaults.standard.value(forKey: "username") ?? "")
        print(UserDefaults.standard.value(forKey: "password") ?? "")
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
