//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


final class CartViewModel {
    
    static var products: CartModel?
    func addtoCart(cartreq: CartRequest) {
        
        APIManager.shared.manager(modelType: CartModel.self, type: EndPointItems.addtoCart, requestModel: cartreq , method: .post){
            result in
            switch result {
            case .success(let jsonData):
                print(jsonData)

                if let totalCart = Optional((jsonData as CartModel).total_carts){
                    UserDefaults.standard.set(totalCart, forKey: "CartTotal")
                }
                
            case .failure(_):
                
                print("Error:")
            }
        }
        
    }
}
