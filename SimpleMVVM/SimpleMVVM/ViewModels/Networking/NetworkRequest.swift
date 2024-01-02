//
//  NetworkRequest.swift
//  SimpleMVVM
//
//  Created by Eugene on 30/12/2023.
//

import Foundation


class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    completionHandler(.success(data))
                }
            }
        }
    }
}
