//
//  NetworkDataFetch.swift
//  SimpleMVVM
//
//  Created by Eugene on 30/12/2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchUsers(responce: @escaping ([Users]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([Users].self, from: data)
                    responce(users, nil)
                } catch let jsonError {
                    print("Failure", jsonError)
                }
            case .failure(_):
                responce(nil, .canNotParseData)
            }
        }
    }
}
