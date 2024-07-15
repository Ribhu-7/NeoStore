//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension ResetPassViewController{
    
    func resetRequest(logs: ResetRequest) {
        
        APIManager.shared.manager(modelType: ResetResponse.self, type: EndPointItems.resetPass, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "Password Update Success")
                print(jsonData)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showLogin()
                }
            case .failure(_):
                self.showAlert(message: "Failed Update")
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
