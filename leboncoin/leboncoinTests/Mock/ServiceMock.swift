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

    func getlistingList(completion: @escaping (listingEntities?) -> Void) {
        do {
            if let bundlePath = bundle.path(forResource: "Listings", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(Listings.self,
                                                           from: jsonData)
                completion(decodedData.asEntities)
            }
        } catch {
            print(error)
            completion([])
        }
    }
}
