//
//  DetailViewModel.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.DispatchQueue

import struct UIKit.IndexPath

import struct Entities.Product

import struct ProductApi.ProductAPI

protocol DetailViewModelOutput: class {
    func displayProductDetail(_ product: Product)
}

final class DetailViewModel {
    
    private(set) var datasource: [String] = []
    
    weak var output: DetailViewModelOutput?
    private let productAPI: ProductAPI
    
    // MARK: - Initialization
    init(productAPI: ProductAPI) {
        self.productAPI = productAPI
    }
}

// MARK: Events
extension DetailViewModel {
    func getProductDetail(
        _ productID: String
    ) {
        productAPI.productDetail(productID) { [weak self] (result) in
            switch result {
            case .success(let product):
                DispatchQueue.main.async {
                    self?.output?.displayProductDetail(product)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
