
import class Foundation.DispatchQueue
import struct Foundation.URL

import struct Network.Request
import struct Network.RequestLoader
import func Network.convertError
import let Network.requestLoader
import struct Entities.Product

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
                completion(
                    result
                        .map { $0.products }
                        .mapError(convertError)
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
                DispatchQueue.main.async {
                    completion(
                        result
                            .mapError(convertError)
                    )
                }
            }
        }
    }
}
