
import struct Entities.Product
import struct Network.Request

import func Utility.decode

public extension Request where Response == ProductListResponse {
    static var productListRequest: Request<ProductListResponse> {
        Request(
            path: "developer-application-test/cart/list",
            httpMethod: .get,
            decoder: decode
        )
    }
}
