//
//  Users.swift
//  SimpleMVVM
//
//  Created by Eugene on 30/12/2023.
//

import Foundation


struct Users: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}

