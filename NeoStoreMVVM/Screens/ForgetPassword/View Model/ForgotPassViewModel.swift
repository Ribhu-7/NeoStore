//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension ForgetPassViewController {
    
    func forgotRequest(logs: ForgotRequest) {
        
        APIManager.shared.manager(modelType: ForgotResponse.self, type: EndPointItems.forgotPass, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "Password Sent in Mail")
                print(jsonData)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showLogin()
                }
            case .failure(_):
                self.showAlert(message: "Invalid Credentials")
                print("Error:")
            }
        }
        
    }
  
    
    func showLogin(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let LoginVC = sb.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
}
