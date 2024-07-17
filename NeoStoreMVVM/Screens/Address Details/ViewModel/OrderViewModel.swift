//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension AddressListViewController {
    
    func orderRequest(logs: OrderRequest) {
        
        APIManager.shared.manager(modelType: OrderModel.self, type: EndPointItems.order, requestModel: logs , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                //self.showAlert(message: "User Login Success")
                print(jsonData)
                //resp?.data.access_token
                
                //let act = jsonData
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.showOrders()
                }
            case .failure(_):
                //self.showAlert(message: "Invalid Credentials")
                print("Error:")
            }
        }
        
    }
  
    
    func showOrders(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let orderList = sb.instantiateViewController(withIdentifier: "orderList")
        self.navigationController?.pushViewController(orderList, animated: true)
    }
}
