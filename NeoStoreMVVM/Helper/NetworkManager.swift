//import UIKit
//import Alamofire
//
//class NetworkManager {
//
//    // Singleton instance
//    static let shared = NetworkManager()
//
//    // Generic request function
//    func makeRequest(
//        url: URL?,
//        method: HTTPMethod,
//        parameters: Parameters? = nil,
//        headers: HTTPHeaders? = nil,
//        completion: @escaping (Result<Any, AFError>) -> Void
//    ) {
//        // Make the request using Alamofire
//        guard let dataurl = url else {return}
//        AF.request(dataurl, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//}
