import XCTest
@testable import ProductApi

final class ProductApiTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ProductApi().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
