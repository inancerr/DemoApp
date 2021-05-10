//
//  ListViewModel.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.DispatchQueue

import struct UIKit.IndexPath

import struct Entities.Product

import struct ProductApi.ProductAPI

protocol ListViewModelOutput: class {
    func reloadList()
    func showProductDetail(_ product: Product)
}

final class ListViewModel {
    
    private(set) var datasource: [Product] = []
    
    weak var output: ListViewModelOutput?
    private let productAPI: ProductAPI
    
    // MARK: - Initialization
    init(productAPI: ProductAPI) {
        self.productAPI = productAPI
    }
}

// MARK: Events
extension ListViewModel {
    func getProductList() {
        productAPI.productList { [weak self] (result) in
            switch result {
            case .success(let productList):
                self?.datasource = productList
                DispatchQueue.main.async {
                    self?.output?.reloadList()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// Select an item with IndexPath
    /// - Parameter indexPath: IndexPath of selected item
    func didSelectItemAt(
        _ indexPath: IndexPath
    ) {
        let product = datasource[indexPath.row]
        output?.showProductDetail(product)
    }
}
