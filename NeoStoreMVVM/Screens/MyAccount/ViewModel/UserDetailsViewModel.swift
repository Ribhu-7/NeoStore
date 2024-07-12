//
//  ProductViewModel.swift
//  MVVM1
//
//  Created by Apple on 19/06/24.
//

import Foundation


final class UserDetailsViewModel {
    
    var details: UserData?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getDetails(dataTab: ProdRequest){
        APIHelper.shared.helpRequest(modelType: UserModel.self, type: EndPointItems.getUserDetails
        )
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

extension UserDetailsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
