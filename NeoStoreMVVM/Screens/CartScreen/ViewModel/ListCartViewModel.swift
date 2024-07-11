//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class ListCartViewModel {
    
    var products: [ListCartData] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchCart(dataTab: CartRequest){
        APIHelper.shared.helpRequest(modelType: ListCartModel.self, type: EndPointItems.getCart
        )
        {response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products.data
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ListCartViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
