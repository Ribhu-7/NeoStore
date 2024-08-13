//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


final class LoginViewModel {
    var eventHandler: ((_ event: Event) -> Void)?
    func getRequest(logs: LoginModel) {
        
        APIManager.shared.manager(modelType: LoginResponse.self, type: EndPointItems.login, requestModel: logs, method: .post){
            result in self.eventHandler?(.stopLoading)
            switch result {
            case .success(let jsonData):
                //self.showAlert(message: "User Login Success")
                //print("json data:\(String(describing: (jsonData as LoginResponse).data?.access_token))")
                if let token = Optional((jsonData as LoginResponse).data?.access_token) {
                    print(token ?? "")
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    
                }

                if let fname = Optional((jsonData as LoginResponse).data?.first_name) {
                    print(fname ?? "")
                    
                    if let lname = Optional((jsonData as LoginResponse).data?.last_name){
                        let fullname = (fname ?? "") + " " + (lname ?? "")
                        UserDefaults.standard.set(fullname, forKey: "fullname")
                    }
                    if let email = Optional((jsonData as LoginResponse).data?.email) {
                        print(email ?? "")
                        UserDefaults.standard.set(email, forKey: "username")
                        
                    }
                  
                }
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                LoginViewController().showAlert(message: "Invalid Credentials")
                print("Error:")
                self.eventHandler?(.error(error))
            }
        }
        
    }
  
    
//    func showHome(){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let homeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
//        self.navigationController?.pushViewController(homeVC, animated: true)
//    }
}

extension LoginViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
