//
//  HomeViewModel.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//

import Foundation
protocol HomeViewModelProtocol {
    func numberOfItems() -> Int
    func ListingeModel(at index: IndexPath) -> listingEntity?
    func fetchData(completion: @escaping (Bool) -> ())
    func filterByCategory(caretory: Categories? ,completion: @escaping () -> ())
}

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - internal properties
    // list of  listings
    private var items: listingEntities?
    internal var searchedItems: listingEntities?
    internal var service: ServiceProtocol?
    
    // MARK: - public function
    init (service: ServiceProtocol) {
        self.service = service
    }
    
    /// get number ofItems
    /// - Returns: Int
    func numberOfItems() -> Int {
        return searchedItems?.count ?? 0
    }
    
    /// get ListingeModel at index
    /// - Parameter index: IndexPath
    /// - Returns: listingEntity
    func ListingeModel(at index: IndexPath) -> listingEntity? {
        return searchedItems?[index.row]
    }
    
    
    /// fetch  List
    /// - Parameter completion: Bool
    /// - Returns: void
    func fetchData(completion: @escaping (Bool) -> ()) {
        service?.getlistingList { [weak self] listingsItems in
            if let listingsItems = listingsItems {
                self?.items = self?.sortItem(items: listingsItems)
                self?.searchedItems = self?.sortItem(items: listingsItems)
            }
            completion(listingsItems != nil)
        }
    }
    
    /// sort list of item by date and isUrgent
    /// - Parameter items: listingEntities
    /// - Returns: sorted listingEntities
    func sortItem(items: listingEntities) -> listingEntities {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        
        let sortedUrgentItems = items.filter { $0.isUrgent == true }
            .sorted {
                dateFormatter.date(from: $0.date!)! > dateFormatter.date(from: $1.date!)!
            }
        
        let sortedNonUrgentItems = items.filter { $0.isUrgent == false }
            .sorted {
                dateFormatter.date(from: $0.date!)! > dateFormatter.date(from: $1.date!)!
            }
        
        return sortedUrgentItems + sortedNonUrgentItems
    }
    
    /// filter the items by category
    /// - Parameters:
    ///   - caretory: Categories
    ///   - completion: void
    func filterByCategory(caretory: Categories?,completion: @escaping () -> ()) {
        guard caretory != nil else {
            searchedItems = items
            completion()
            return
        }
        searchedItems = items?.filter { $0.category == caretory }
        completion()
    }
    
}
