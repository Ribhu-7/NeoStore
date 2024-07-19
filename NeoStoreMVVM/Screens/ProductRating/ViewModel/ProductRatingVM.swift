//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension ProductRatingController{
    
    func rateRequest(logs: RatingRequest) {
        
        APIManager.shared.manager(modelType: RatingResponse.self, type: EndPointItems.setRating, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                self.showAlert(message: "Success")
                print(jsonData)
                if let Pid = Optional((jsonData as RatingResponse).data?.id){
                    if let rating = Optional((jsonData as RatingResponse).data?.rating) {
                        print("Rating:",rating ?? "")
                        UserDefaults.standard.set(rating, forKey: "prodRating \(Pid ?? 0)")
                    }
                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                    self.showLogin()
//                }
            case .failure(_):
                self.showAlert(message: "Failed Update")
                print("Error:")
            }
        }
        
    }
  
//    func showLogin(){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let LoginVC = sb.instantiateViewController(withIdentifier: "LoginVC")
//        self.navigationController?.pushViewController(LoginVC, animated: true)
//    }
}
