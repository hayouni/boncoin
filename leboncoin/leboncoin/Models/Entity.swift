//
//  Entity.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import Foundation

typealias listingEntities = [listingEntity]

struct listingEntity {
    let image: URL?
    let name: String?
    let price: Int?
    let category: Categories?
}

enum Categories: Int {
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
