//
//  RegisterViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmField: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var btnMale: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Register"
        firstName.delegate = self
        lastName.delegate = self
        emailTxt.delegate = self
        passwordField.delegate = self
        confirmField.delegate = self
        phoneNumber.delegate = self
        configuration()
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        self.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
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
        checkBtn.setImage(UIImage.init(systemName: "square"), for: .normal)
        checkBtn.setImage(UIImage.init(named: "checked_icon"), for: .selected)
        registerBtn.layer.cornerRadius = 20
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case firstName:
                lastName.becomeFirstResponder()
            case lastName:
                emailTxt.becomeFirstResponder()
            case emailTxt:
                passwordField.becomeFirstResponder()
            case passwordField:
                confirmField.becomeFirstResponder()
            case confirmField:
            phoneNumber.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
            return false
    
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
    
    @IBAction func checkClicked(_ sender: UIButton) {
        if checkBtn.isSelected == true {
            checkBtn.isSelected = false
        } else if checkBtn.isSelected == false {
            checkBtn.isSelected = true
        }
        
    }
    
    @IBAction func registerClick(_ sender: Any) {
        guard let fname = self.firstName.text else {return}
        guard let lname = self.lastName.text else {return}
        guard let email = self.emailTxt.text else {return}
        guard let passw = self.passwordField.text else {return}
        guard let confpass = self.passwordField.text else {return}
        guard let pnumber = self.phoneNumber.text else {return}
        
        var gender: String?
        if btnMale.isSelected {
            gender = "M"
        } else if btnFemale.isSelected {
            gender = "F"
        } else {
            gender = ""
        }
        
        if(fname.isValidName && lname.isValidName && email.isValidEmail && passw.isValidPassword && passw == confpass && gender != "" && pnumber.isPhoneNumber && checkBtn.isSelected){
            
            let regs = RegistrationData(gender: gender ,password: passw,confirm_password: confpass, last_name: lname , email: email , phone_no: pnumber ,   first_name: fname )
            self.postRequest(regs: regs)
        }
        else {
            self.showAlert(message: "Invalid details")
        }
    }
}


