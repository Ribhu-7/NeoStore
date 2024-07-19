//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


final class DeleteCartViewModel {
    
    static var products: CartModel?
    func deleteCart(cartreq: DelCartRequest) {
        
        APIManager.shared.manager(modelType: CartModel.self, type: EndPointItems.deleteCart, requestModel: cartreq , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                print(jsonData)
                //CartViewModel.products = jsonData as? CartModel
                if let totalCart = Optional((jsonData as CartModel).total_carts){
                    UserDefaults.standard.set(totalCart, forKey: "CartTotal")
                }
            case .failure(_):
                
                print("Error:")
            }
        }
        
    }
  
    
//    func showCart(){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
//
//    }
}
