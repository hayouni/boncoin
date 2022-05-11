//
//  ServiceMock.swift
//  leboncoinTests
//
//  Created by Saiefeddine HAYOUNI on 27/04/2022.
//

import Foundation
@testable import leboncoin

class ServiceMock: ServiceProtocol {
    
    

    let bundle = Bundle(for: ServiceMock.self)
    func getlistingList(completion: @escaping (listingData?) -> Void) {

        let listing = getlistingList()
        let categorie = getCategorieList()
        
        let listingsEntities = listing.asEntities(categories: categorie)
        let categoriesList = categorie
        completion((listing: listingsEntities, categories: categoriesList))
        
    }
    
    func getlistingList() -> Listings {
        do {
            if let bundlePath = bundle.path(forResource: "Listings", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(Listings.self,
                                                           from: jsonData)
                return decodedData
            }
        } catch {
            return []
        }
        return []

    }
    
    func getCategorieList() -> [Categories] {
        do {
            if let bundlePath = bundle.path(forResource: "Category", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode([Categories].self,
                                                           from: jsonData)
                return decodedData
            }
        } catch {
            return []
        }
        return []

    }
    
    
}
