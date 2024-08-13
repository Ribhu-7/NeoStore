//
//  LoginViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate{
    
   @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
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
        self.activityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        
    
    
        self.activityIndicator.startAnimating()
        let userN = UserDefaults.standard.string(forKey: "username")
        let userP = UserDefaults.standard.string(forKey: "password")
        if userN != nil && userP != nil {
            self.showHome()
        } else {
            self.loadingView.isHidden = true
        }
        usernameField.delegate = self
        passField.delegate = self
        configuration()
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        self.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case usernameField:
                passField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
            return false
    }
    
    func configuration(){
        usernameField.setContent("Username", "username_icon")
        passField.setContent("Password", "password_icon")
    
        loginBtn.changeView()
    }
    
    @IBAction func loginClick(_ sender: Any) {
//        self.loadingView.isHidden = false
//        self.loadingView.alpha = 0.5
//        self.activityIndicator.startAnimating()
        guard let emailId = usernameField.text else {return}
        guard let password = passField.text else {return}
        if (emailId.isValidEmail && password.isValidPassword){
            let logs = LoginModel(email: emailId, password: password)
            //self.getRequest(logs: logs)
            initViewModel(req: logs)
            observeEvent()
        } else {
            self.showAlert(message: "Invalid details")
            self.loadingView.isHidden = true
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
                self.loadingView.isHidden = false
                self.loadingView.alpha = 0.5
                self.activityIndicator.startAnimating()
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    self.showHome()
//                    guard let email = self.usernameField.text else {return}
                    guard let pass = self.passField.text else {return}
//                    UserDefaults.standard.set(email, forKey: "username")
                    UserDefaults.standard.set(pass,forKey: "password")
                }
            case .error(let error):
                print(error ?? "")
                self.showAlert(message: "Invalid details")
                self.loadingView.isHidden = true
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
