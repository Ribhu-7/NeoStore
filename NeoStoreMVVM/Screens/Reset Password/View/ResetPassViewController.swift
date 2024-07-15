//
//  ResetPassViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import UIKit

class ResetPassViewController: UIViewController {
    
    
    @IBOutlet weak var oldPassword: UITextField!
    
    
    @IBOutlet weak var newPassword: UITextField!
    
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var resetPass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Reset Password"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        configuration()

        
    }
    
    func configuration(){
        oldPassword.setContent("Current Password", "password_icon")
        newPassword.setContent("New Password", "password_icon")
        confirmPassword.setContent("Confirm Password", "password_icon")
        resetPass.changeView()
        
    }
    
    @objc func searchClicked(){
        
    }

    @IBAction func resetPassClick(_ sender: Any) {
        guard let oldPass = oldPassword.text else {return}
        guard let newPass = newPassword.text else {return}
        guard let confirmPass = confirmPassword.text else {return}
        
        if newPass == confirmPass {
            let req = ResetRequest(old_password: oldPass, password: newPass, confirm_password: confirmPass)
            self.resetRequest(logs: req)
        }
    }
    

}
