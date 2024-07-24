//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class ProductDetailViewModel {
    
    var products: ProdListData?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts(dataTab: ProductListRequest){
//        APIHelper.shared.helpRequest(modelType: Product.self, type: EndPointItems.getProduct(id)
//        )
        APIManager.shared.manager(modelType: ProductListModel.self, type: EndPointItems.getDetail, requestModel: dataTab, method: .get)
            {response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products.data
                UserDefaults.standard.set(products.data?.rating, forKey: "ProdRating: \(products.data?.id ?? 0)")
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductDetailViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
