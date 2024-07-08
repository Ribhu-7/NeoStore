//
//  RegisterModelExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension RegisterViewController {
    
    func postRequest(regs: RegistrationData) {
        APIManager.shared.manager(modelType: RegisterModel.self, type: EndPointItems.register, requestModel: regs , method: .post) {
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "User Registration Success")
                print(jsonData)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showLogin()
                }
            case .failure(let error):
                self.showAlert(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    func showLogin(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
