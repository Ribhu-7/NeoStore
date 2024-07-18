//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class OrderDetailsVM {
    
    var details: OrderDetailsData?
    var eventHandler: ((_ event: Event) -> Void)?
  
    
    func getOrderDetails(dataTab: OrderDetailsRequest , id: Int){

        APIHelper.shared.helpRequest(modelType: OrderDetails.self, type: EndPointItems.orderDetail(id))
        {response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let details):
                self.details = details.data
               
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension OrderDetailsVM {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
