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
                CartViewModel.products = jsonData as? CartModel
                
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
