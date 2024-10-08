//
//  ForgetPassViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import UIKit

class ForgetPassViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        usernameField.setContent("Username", "username_icon")
        loginBtn.changeView()
    }
    
    
    @IBAction func sendEmail(_ sender: Any) {
        guard let email = usernameField.text else {return}
        let req = ForgotRequest(email: email)
        self.forgotRequest(logs: req)
            
    }
    

   

}
