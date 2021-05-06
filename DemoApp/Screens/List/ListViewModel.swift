//
//  ListViewModel.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import struct UIKit.IndexPath

import struct Api.Product

protocol ListViewModelOutput: class {
    func showProductDetail(_ product: Product)
}

final class ListViewModel {
    
    private(set) var datasource: [String] = []
    
    weak var output: ListViewModelOutput?
    
    init() {
        
    }
}

// MARK: Events
extension ListViewModel {
    func didSelectItemAt(
        _ indexPath: IndexPath
    ) {
        let product = Product(
            product_id: "1",
            name: "Muz",
            image: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg",
            price: 60
        )
        output?.showProductDetail(product)
    }
}
