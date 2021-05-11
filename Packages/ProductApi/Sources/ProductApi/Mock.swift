
import Foundation
import Entities

public extension ProductAPI {
    
    static let productAPIMock = Self(
        productList: { completion in
            completion(.success(productList))
        },
        productDetail: { _, completion  in
            completion(.success(productDetail))
        }
    )
    
    static let error = Self(
        productList: { completion in
            completion(.failure(APIError.unknown))
        },
        productDetail: { _, completion  in
            completion(.failure(APIError.unknown))
        }
    )
    
    static var productList: [Product] {
        [
            Product(
                productID: "1",
                name: "Apples",
                imageURL: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg",
                price: 120,
                description: nil
            ),
            Product(
                productID: "2",
                name: "Oranges",
                imageURL: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/2.jpg",
                price: 167,
                description: nil
            ),
            Product(
                productID: "3",
                name: "Bananas",
                imageURL: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/3.jpg",
                price: 88,
                description: nil
            )
        ]
    }
    
    static var productDetail: Product {
        Product(
            productID: "1",
            name: "Apples",
            imageURL: "https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg",
            price: 120,
            description: nil
        )
    }
}
