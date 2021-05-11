
import enum Entities.APIError
import struct Entities.Product

public struct ProductAPI {
    public typealias Completion<Model> = (Result<Model, APIError>) -> Void
    
    public var productList: (@escaping Completion<[Product]>) -> Void
    public var productDetail: (String, @escaping Completion<Product>) -> Void

    public init(
        productList: @escaping (@escaping Completion<[Product]>) -> Void  = { _ in },
        productDetail: @escaping (String, @escaping Completion<Product>) -> Void = { _,_  in }
    ) {
        self.productList = productList
        self.productDetail = productDetail
    }
}
