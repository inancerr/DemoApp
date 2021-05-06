//
//  File.swift
//  
//
//  Created by İnanç Er on 7.05.2021.
//

public struct Product {
    let product_id, name, image: String
    let price: Int
    
    public init(
        product_id: String,
        name: String,
        image: String,
        price: Int
    ) {
        self.product_id = product_id
        self.name = name
        self.image = image
        self.price = price
    }
}
