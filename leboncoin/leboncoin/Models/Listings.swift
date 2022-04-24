//
//  listing.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//
import UIKit

typealias Listings = [Listing]

// MARK: - listing
struct Listing: Codable {
    let listingId, categoryId, price: Int?
    let title, date, description: String?
    let image: Image?
    let isUrgent: Bool?

    enum CodingKeys: String, CodingKey {
        case listingId = "id"
        case categoryId = "category_id"
        case image = "images_url"
        case price
        case description
        case date = "creation_date"
        case isUrgent = "is_urgent"
        case title
        
     }
}
struct Image: Codable {
    let small, thumb: String?
}
