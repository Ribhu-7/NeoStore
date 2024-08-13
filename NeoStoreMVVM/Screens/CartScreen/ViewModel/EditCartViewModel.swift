
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
    
    func editCart(dataTab: EditCartRequest) {
        
        APIManager.shared.manager(modelType: CartModel.self, type: EndPointItems.editCart, requestModel: dataTab , method: .post)
            {
             response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let jsonData):
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
