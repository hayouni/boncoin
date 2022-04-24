//
//  Recipes.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 05/12/2021.
//
import UIKit

typealias listings = [listing]

// MARK: - Recipe
struct listing: Codable {
    let listingId, categoryId, price: Int?
    let title: String?
    let image: Image?

    enum CodingKeys: String, CodingKey {
        case listingId = "id"
        case categoryId = "category_id"
        case image = "images_url"
        case price
        case title
     }
}
struct Image: Codable {
    let small, thumb: String?
}
