//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension LoginViewController {
    
    func getRequest(logs: LoginModel) {
        
        APIManager.shared.manager(modelType: LoginResponse.self, type: EndPointItems.login, requestModel: logs, method: .post){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "User Login Success")
                //print("json data:\(String(describing: (jsonData as LoginResponse).data?.access_token))")
                if let token = Optional((jsonData as LoginResponse).data?.access_token) {
                    print(token ?? "")
                    UserDefaults.standard.set(token, forKey: "accessToken")
                }
//
                if let emailId = Optional((jsonData as LoginResponse).data?.email){
                    UserDefaults.standard.set(emailId, forKey: "emailId")
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showHome()
                }
                
            case .failure(_):
                self.showAlert(message: "Invalid Credentials")
                print("Error:")
                
            }
        }
        
    }
  
    
    func showHome(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}
