//
//  File.swift
//  
//
//  Created by İnanç Er on 10.05.2021.
//

import struct Entities.Product

public struct ProductListResponse: Decodable {
    let products: [Product]
}
