//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension EditAccountController{
    
    func editRequest(logs: EditRequest) {
        
        APIManager.shared.manager(modelType: EditResponse.self, type: EndPointItems.editDetails, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "Account Update Success")
                print(jsonData)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showAccount()
                }
            case .failure(_):
                self.showAlert(message: "Failed Update")
                print("Error:")
            }
        }
        
    }
  
    func showAccount(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let myaccountVC = sb.instantiateViewController(withIdentifier: "myaccountVC")
        self.navigationController?.pushViewController(myaccountVC, animated: true)
    }
}
