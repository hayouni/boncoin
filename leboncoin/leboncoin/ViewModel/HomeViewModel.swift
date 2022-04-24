//
//  HomeViewModel.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 05/12/2021.
//

import Foundation
protocol HomeViewModelProtocol {
    func numberOfItems() -> Int
    func ListingeModel(at index: IndexPath) -> listingEntity?
    func fetchData(completion: @escaping (Bool) -> ())
}

class HomeViewModel: HomeViewModelProtocol {
    
    
    // MARK: - internal properties
    // list of recipes
    internal var items: listingEntities?
    internal var service: ServiceProtocol?
    
    // MARK: - public function
    init (service: ServiceProtocol) {
        self.service = service
    }
    
    /// get number ofItems
    /// - Returns: Int
    func numberOfItems() -> Int {
        return items?.count ?? 0
    }
    
    /// get recipe Model at index
    /// - Parameter index: IndexPath
    /// - Returns: RecipeEntity
    func ListingeModel(at index: IndexPath) -> listingEntity? {
        return items?[index.row]
    }
    
    
    /// fetch recipes List
    /// - Parameter completion: Bool
    /// - Returns: void
    func fetchData(completion: @escaping (Bool) -> ()) {
        service?.getlistingList { [weak self] recipes in
            self?.items = recipes
            completion(recipes != nil)
        }
    }
}
