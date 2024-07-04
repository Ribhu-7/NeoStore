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
        
        APIManager.shared.manager(modelType: LoginModel.self, type: EndPointItems.login, requestModel: logs){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "User Login Success")
                print(jsonData)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showHome()
                }
            case .failure(let error):
                self.showAlert(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
        
    }
  
    
    func showHome(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}
