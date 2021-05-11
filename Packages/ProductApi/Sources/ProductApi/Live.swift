
import class Foundation.DispatchQueue
import struct Foundation.URL

import struct Network.Request
import struct Network.RequestLoader
import let Network.requestLoader

import struct Entities.Product

import class LocalStorage.ProductStorage

// MARK: - Live
public extension ProductAPI {
    static let live = Self(
        productList: productList(_:),
        productDetail: productDetail(_:_:)
    )
}

// MARK: - API Call
extension ProductAPI {
    static func productList(
        _ completion: @escaping Completion<[Product]>
    ) {
        DispatchQueue.global().async {
            requestLoader.load(request: .productListRequest) { result in
                let storage = ProductStorage()
                completion(
                    result
                        .map { $0.products }
                        .map(storage.save)
                        .onNetworkError {
                            let productList = storage.fetchProducts()
                            return .success(productList)
                        }
                )
            }
        }
    }
    
    static func productDetail(
        _ productID: String,
        _ completion: @escaping Completion<Product>
    ) {
        DispatchQueue.global().async {
            requestLoader.load(
                request: .productDetailRequest(
                    .init(productID: productID)
                )
            ) { result in
                let storage = ProductStorage()
                completion(
                    result
                        .map(storage.updateProductDetail)
                        .onNetworkError {
                            let product = storage.fetchProduct(productID)
                            return .success(product)
                        }
                )
            }
        }
    }
}
