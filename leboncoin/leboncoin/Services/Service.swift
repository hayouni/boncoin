//
//  Service.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    func getlistingList(completion: @escaping (listingEntities?) -> Void)
}

class Service: ServiceProtocol {

    static let shared = Service()
    struct K {
        static let urlString = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    }

    /// fetch Recepies List
    /// - Parameter completion: RecipeEntities?
    func getlistingList(completion: @escaping (listingEntities?) -> Void) {
        Network.shared.fetchData(urlString: K.urlString) { (feed : listings?) in
            guard let recipes = feed else {
                completion(nil)
                return
            }
            // use entities to reveale only needed items of object by the viewModel/contoller
            completion(recipes.asEntities)
        }
    }

}
 
