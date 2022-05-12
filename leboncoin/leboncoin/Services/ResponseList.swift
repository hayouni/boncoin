//
//  ResponseList.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 11/05/2022.
//

import Foundation

public struct ResponseList<T: Decodable & Equatable>: Decodable {
    public var list: [T]
    
    public init(from decoder: Decoder) throws {
        var list = [T]()
        var container = try decoder.unkeyedContainer()
        
        while !container.isAtEnd {
            if let decodedElement = try? container.decode(T.self) {
                list.append(decodedElement)
            } else {
                _ = try? container.decode(EmptyCodable.self)
            }
        }
        
        self.list = list
    }
    
    public init() {
        self.list = []
    }
}

private struct EmptyCodable: Decodable {}
