
public struct Product: Decodable {
    public let productID, name, imageURL: String
    public let description: String?
    public let price: Double
        
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productID = try container.decode(String.self, forKey: .productID)
        name = try container.decode(String.self, forKey: .name)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        price = try container.decode(Double.self, forKey: .price)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, price, description
        case productID = "product_id"
        case imageURL = "image"
    }
    
    public init(
        productID: String,
        name: String,
        imageURL: String,
        price: Double,
        description: String?
    ) {
        self.productID = productID
        self.name = name
        self.imageURL = imageURL
        self.price = price
        self.description = description
    }
}
