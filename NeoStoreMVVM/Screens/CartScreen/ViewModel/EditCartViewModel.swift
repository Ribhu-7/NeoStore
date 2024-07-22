////
////  LoginViewModel.swift
////  NeoStoreMVVM
////
////  Created by Apple on 03/07/24.
////
//
//import Foundation
//import UIKit
//
//
//final class EditCartViewModel {
//
//    static var products: CartModel?
//    func editCart(cartreq: EditCartRequest) {
//
//        APIManager.shared.manager(modelType: CartModel.self, type: EndPointItems.editCart, requestModel: cartreq , method: .post){
//            result in
//            switch result {
//            case .success(let jsonData):
//                print(jsonData)
//                //CartViewModel.products = jsonData as? CartModel
////                if let totalCart = Optional((jsonData as CartModel).total_carts){
////                    UserDefaults.standard.set(totalCart, forKey: "CartTotal")
////                }
//
//            case .failure(_):
//
//                print("Error:")
//            }
//        }
//
//    }
//
//
////    func showCart(){
////        let sb = UIStoryboard(name: "Main", bundle: nil)
////        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
////
////    }
//}

//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class EditCartViewModel {
    
    var products: [ListCartData] = []
    var model: Int?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func editCart(dataTab: EditCartRequest){
        APIManager.shared.manager(modelType: CartModel.self, type: EndPointItems.editCart, requestModel: dataTab , method: .post)
        {response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let jsonData):
//                self.products = products.data
//                UserDefaults.standard.set(products.total, forKey: "CartAmt")
                print(jsonData)
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension EditCartViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
