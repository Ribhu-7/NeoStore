//
//  APIManager.swift
//  NeoStoreMVVM
//
//  Created by Apple on 02/07/24.
//

import Foundation
import Alamofire
import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidDecoding
    case invalidURL
    case invalidData
    case network(_ error: Error?)
}

typealias Handler<T> = (Result<T,DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        register: RegistrationData,
        completion: @escaping (Bool, String) -> ()
    )
    {
        guard let url = type.url else{
            completion(false ,"invalid url")
            return
        }
        
        AF.request(url , method: .post,parameters: register,encoder: URLEncodedFormParameterEncoder.default, headers: nil).response{
            response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do{
                    if response.response?.statusCode == 200 {
                        let jsonData = try JSONSerialization.jsonObject(with: data!,options: [])
                        print(jsonData)
                        
                        completion(true,"Success!")
                    } else if response.response?.statusCode == 200 {
                        completion(false,"Unsuccesfull")
                    }
                    
                } catch{
                    completion(false,"Unsucessful")
                    print(error.localizedDescription)
                }
            case .failure:
                completion(false , "Unsuccessful")
            }
        }
    }
}

