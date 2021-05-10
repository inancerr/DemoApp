//
//  ListViewModel.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import struct UIKit.IndexPath

import struct Api.Product

protocol ListViewModelOutput: class {
    func reloadList()
    func showProductDetail(_ product: Product)
}

final class ListViewModel {
    
    private(set) var datasource: [Product] = []
    
    weak var output: ListViewModelOutput?
    
    // MARK: - Initialization
    init() {

    }
}

// MARK: Events
extension ListViewModel {
    func getProductList() {
        DemoApp.getProductList { [weak self] (productList) in
            self?.datasource = productList
            self?.output?.reloadList()
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



import Foundation

func getProductList(_ completion: @escaping ([Product]) -> ()) {
    let product = Product(
        product_id: "1",
        name: "Muz",
        image: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/4.jpg",
        price: 60
    )
    let products = [
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product
    ]
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion(products)
    }
}
