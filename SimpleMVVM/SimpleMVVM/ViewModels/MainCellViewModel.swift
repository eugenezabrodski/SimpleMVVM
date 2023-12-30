//
//  MainCellViewModel.swift
//  SimpleMVVM
//
//  Created by Eugene on 30/12/2023.
//

import Foundation


class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: Users) {
        self.name = user.username
        self.email = user.email
    }
}
