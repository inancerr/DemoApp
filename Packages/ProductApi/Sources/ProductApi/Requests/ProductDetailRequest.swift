
import struct Entities.Product
import struct Network.Request

import func Utility.decode

public extension Request where Response == Product {
    static func productDetailRequest(
        _ request: ProductDetailRequest
    ) -> Request<Product> {
        Request(
            path: "developer-application-test/cart/\(request.productID)/detail",
            httpMethod: .get,
            decoder: decode
        )
    }
}

public struct ProductDetailRequest {
    public let productID: String
    
    public init(
        productID: String
    ) {
        self.productID = productID
    }
}
