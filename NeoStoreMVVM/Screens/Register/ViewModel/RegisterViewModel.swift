//
//  RegisterModelExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension String{
    var isPhoneNumber : Bool {
        if self.count < 10 {
            return false
        }
        return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
        
    }
    var isValidEmail : Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    var isValidPassword : Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: self)
    }
    var isValidName : Bool {
        if self.count < 3{
            return false
        }
        return self.allSatisfy{$0.isLetter}
    }
    
}

extension RegisterViewController {
    
    func postRequest(regs: RegistrationData) {
        
        APIManager.shared.request(modelType: RegisterModel.self, type: EndPointItems.register, register: regs){
            (isSuccess , str) in
            if isSuccess {
                self.showAlert(message: "User registration "+str)
                print("user registered")
                

            } else {
                self.showAlert(message: "Registration"+str)
            }
        }
        self.showLogin()
    }
    func showAlert(message: String){
        let alert = UIAlertController(title: nil,message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        {
            (action) in (self.dismiss(animated: true,completion: nil))
        }
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
        
    }
    
    func showLogin(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
