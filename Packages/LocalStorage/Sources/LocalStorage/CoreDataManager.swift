
import CoreData

import struct Entities.Product

// MARK: Error
enum LocalStorageError: Error {
    case noData
}

final class CoreDataManager: NSObject {

    // MARK: - Properties
    static let shared = CoreDataManager()
    
    private(set) lazy var context: NSManagedObjectContext = {
        let modelURL = Bundle.module.url(forResource:"DemoApp", withExtension: "momd")!
        let model = NSManagedObjectModel(contentsOf: modelURL)!
        let container = NSPersistentContainer(name:"DemoApp", managedObjectModel: model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container.viewContext
    }()
}

// MARK: - Helpers
extension CoreDataManager {
    
    // MARK: - Save Data
    func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    // MARK: - Remove all items
    func clear<T: NSManagedObject>(_ type: T.Type) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: T.self))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    // MARK: Fetch Request
    func fetchRequest<T: NSManagedObject>(
        type: T.Type,
        predicate: NSPredicate? = nil,
        sortDescriptor: [NSSortDescriptor]? = nil
    ) throws -> [T] {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: T.self))
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptor
        do {
            try context.fetch(fetchRequest)
        } catch let err {
            print(err)
        }
        guard let result = try context.fetch(fetchRequest) as? [T] else {
            throw LocalStorageError.noData
        }
        return result
    }
}
