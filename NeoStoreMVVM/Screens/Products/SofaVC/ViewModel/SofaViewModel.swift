//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class SofaProdViewModel {
    
    var products: [ProdData] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts(dataTab: ProdRequest){
        APIHelper.shared.helpRequest(modelType: Product.self, type: EndPointItems.getSofa
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

extension SofaProdViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}