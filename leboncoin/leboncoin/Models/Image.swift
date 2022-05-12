//
//  Image.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 11/05/2022.
//

import Foundation

struct Image: Codable {
    let small, thumb: String?
}

extension Image: Equatable {
    static func == (lhs: Image, rhs: Image) -> Bool {
        return lhs.small == rhs.small &&
        lhs.thumb == rhs.thumb
    }
}

