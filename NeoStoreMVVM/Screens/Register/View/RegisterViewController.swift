//
//  RegisterViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import UIKit

class RegisterViewController: UIViewController {

   
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmField: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    @IBOutlet weak var btnMale: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Register"
        configuration()
    }
    

    func configuration(){
        firstName.setContent("First Name", "username_icon")
        lastName.setContent("Last Name", "username_icon")
        emailTxt.setContent("Email", "email_icon")
        passwordField.setContent("Password", "password_icon")
        confirmField.setContent("Confirm Password", "password_icon")
        phoneNumber.setContent("Phone Number", "cellphone_icon")
        phoneNumber.keyboardType = .numberPad
        btnMale.setImage(UIImage.init(named: "chkn"), for: .normal)
        btnFemale.setImage(UIImage.init(named: "chkn"), for: .normal)
        btnMale.setImage(UIImage.init(named: "chky"), for: .selected)
        btnFemale.setImage(UIImage.init(named: "chky"), for: .selected)
        registerBtn.layer.cornerRadius = 20
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        if sender === btnMale{
            btnMale.isSelected = true
            btnFemale.isSelected = false
        } else if sender === btnFemale{
            btnFemale.isSelected = true
            btnMale.isSelected = false
        }
    }
   
}
