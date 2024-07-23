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
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.backButtonTitle = ""
        let userN = UserDefaults.standard.string(forKey: "username")
        let userP = UserDefaults.standard.string(forKey: "password")
        if userN != nil && userP != nil {
            self.showHome()
        }
        configuration()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.hidesBackButton = true
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
            //self.getRequest(logs: logs)
            initViewModel(req: logs)
            observeEvent()
        } else {
            self.showAlert(message: "Invalid details")
        }
    }
    
    func initViewModel(req: LoginModel){
        loginViewModel.getRequest(logs: req)
    }
    
    func observeEvent(){
        loginViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    self.showHome()
                    guard let email = self.usernameField.text else {return}
                    guard let pass = self.passField.text else {return}
                    UserDefaults.standard.set(email, forKey: "username")
                    UserDefaults.standard.set(pass,forKey: "password")
                }
            case .error(let error):
                print(error ?? "")
            }
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
    
    func showHome(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}
