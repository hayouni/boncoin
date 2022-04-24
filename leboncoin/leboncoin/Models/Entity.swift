//
//  Entity.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//

import Foundation

typealias listingEntities = [listingEntity]

struct listingEntity {
    let image: URL?
    let name: String?
    let date: String?
    let description: String?
    let price: Int?
    let isUrgent: Bool?
    let category: Categories?
}

enum Categories: Int, CaseIterable {
    case Véhicule = 1
    case Mode = 2
    case Bricolage = 3
    case Maison = 4
    case Loisirs = 5
    case Immobilier = 6
    case Livres = 7
    case Multimédia = 8
    case Service = 9
    case Animaux = 10
    case Enfants = 11
}
