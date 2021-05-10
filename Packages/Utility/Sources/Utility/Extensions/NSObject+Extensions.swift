
import class Foundation.NSObject

public protocol ViewIdentifier: class {
    var viewIdentifier: String { get }
    static var viewIdentifier: String { get }
}

public extension ViewIdentifier {
    static var viewIdentifier: String {
        String(describing: self)
    }
    
    var viewIdentifier: String {
        let typeOfSelf = type(of: self)
        return String(describing: typeOfSelf)
    }
}

extension NSObject: ViewIdentifier {}
