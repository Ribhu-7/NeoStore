//
//  EditProfileVM.swift
//  NeoStoreMVVM
//
//  Created by Apple on 26/07/24.
//

import Foundation

final class EditProfileVM {
    func editRequest(logs: EditRequest) {
        
        APIManager.shared.manager(modelType: EditResponse.self, type: EndPointItems.editDetails, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
//                self.showAlert(message: "Account Update Success")
                print(jsonData)
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                    self.showAccount()
//                }
            case .failure(_):
//                self.showAlert(message: "Failed Update")
                print("Error:")
            }
        }
        
    }
    
}
