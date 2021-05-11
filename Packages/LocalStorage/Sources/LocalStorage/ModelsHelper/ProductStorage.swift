
import struct Entities.Product

import class CoreData.NSPredicate
import class CoreData.NSSortDescriptor
import class CoreData.NSManagedObjectModel
import class CoreData.NSManagedObject

import class Foundation.DispatchQueue

final public class ProductStorage {
    
    // MARK: - Properties
    private let manager = CoreDataManager.shared
    
    // MARK: - Initialization
    public init() { }
    
    let queue = DispatchQueue(
        label: "ProductStore.queue",
        qos: .background,
        attributes: .concurrent
    )
    
    // MARK: Save Products
    public func save(
        _ products: [Product]
    ) -> [Product] {
        queue.sync(flags: .barrier) { [weak self] in
            self?.manager.clear(ProductEntity.self)
        }
        queue.sync { [weak self] in
            guard let self = self else { return }
            products.forEach {
                let entity = ProductEntity(context: self.manager.context)
                entity.productID = $0.productID
                entity.name = $0.name
                entity.imageURL = $0.imageURL
                entity.price = $0.price
            }
            self.manager.saveData()
        }
        return products
    }
    
    // MARK: - Fetch Product with productID
    public func fetchProduct(
        _ productID: String
    ) -> Product? {
        queue.sync(flags: .barrier) {
            do {
                let predicate = NSPredicate(format: "productID == %@", productID)
                let result = try manager.fetchRequest(type: ProductEntity.self, predicate: predicate)
                guard let _product = result.first else { return nil }
                return Product(
                    productID: _product.productID ?? "",
                    name: _product.name ?? "",
                    imageURL: _product.imageURLLarge ?? "",
                    price: _product.price,
                    description: _product.productDescription
                )
            } catch {
                print(error)
                return nil
            }
        }
    }
    
    // MARK: - Fetch Products
    public func fetchProducts(
        withDescriptor: [NSSortDescriptor] = [NSSortDescriptor(key: "productID", ascending: false)]
    ) -> [Product]? {
        do {
            let result = try manager.fetchRequest(
                type: ProductEntity.self,
                sortDescriptor: withDescriptor
            )
            return result.map {
                Product(
                    productID: $0.productID ?? "",
                    name: $0.name ?? "",
                    imageURL: $0.imageURLLarge ?? "",
                    price: $0.price,
                    description: $0.productDescription
                )
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    // MARK: - Update Product
    public func updateProductDetail(
        _ product: Product
    ) -> Product {
        do {
            let predicate = NSPredicate(format: "productID == %@", product.productID)
            let result = try manager.fetchRequest(type: ProductEntity.self, predicate: predicate)
            guard let _product = result.first else { return product }
            _product.imageURLLarge = product.imageURL
            _product.productDescription = product.description
            manager.saveData()
        } catch {
            print(error)
        }
        return product
    }
}
