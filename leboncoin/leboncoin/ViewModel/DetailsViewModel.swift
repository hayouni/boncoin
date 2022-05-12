//
//  DetailsViewModel.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 24/04/2022.
//

import Foundation

protocol DetailsViewModelProtocol {
    var image: URL? { get }
    var name: String? { get }
    var date: String? { get }
    var price: Int? { get }
    var description: String? { get }
    var category: String? { get }
}


class DetailsViewModel: DetailsViewModelProtocol {
    
    
    // MARK: - internal properties
    // list of listings
    internal var item: listingEntity?
    
    init (item: listingEntity?) {
        self.item = item
    }
    
    /// get number ofItems
    /// - Returns: Int
    var image: URL? {
        item?.image
    }
    
    var name: String? {
        item?.name
    }
    
    var date: String? {
        item?.date
    }
    
    var price: Int? {
        item?.price
    }
    
    var category: String? {
        item?.category?.name
    }
    
    var description: String? {
        item?.description
    }
}
