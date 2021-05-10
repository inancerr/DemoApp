//
//  File.swift
//  
//
//  Created by İnanç Er on 7.05.2021.
//

public struct Product {
    public let product_id, name, image: String
    public let price: Double
    
    public init(
        product_id: String,
        name: String,
        image: String,
        price: Double
    ) {
        self.product_id = product_id
        self.name = name
        self.image = image
        self.price = price
    }
}
