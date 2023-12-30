//
//  MainViewModel.swift
//  SimpleMVVM
//
//  Created by Eugene on 29/12/2023.
//

import UIKit

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: [Users]?
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if let users {
                self.dataSource = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.compactMap({ MainCellViewModel($0)})
    }
    
}
