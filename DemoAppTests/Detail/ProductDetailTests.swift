//
//  ProductDetailTests.swift
//  ProductDetailTests
//
//  Created by İnanç Er on 11.05.2021.
//

import XCTest
@testable import DemoApp
@testable import ProductApi
@testable import Entities
@testable import LocalStorage

class ProductDetailTests: XCTestCase {
    
    var showDetailOfProduct: Product?
    
    override func setUp() {
    }
    
    override func tearDown() {
        showDetailOfProduct = nil
        CoreDataManager.shared.clear(ProductEntity.self)
    }
}

// MARK: - Get Product List Tests
extension ProductDetailTests {
    func test_getProductTest_success() {
        let viewModel = DetailViewModel(
            productAPI: .productAPIMock
        )
        viewModel.output = self
        
        viewModel.getProductDetail("1")
        
        delay(timeout: 3)
        XCTAssertNotNil(showDetailOfProduct)
    }
    
    func test_getProductTest_error() {
        let viewModel = DetailViewModel(
            productAPI: .error
        )
        viewModel.output = self
        
        viewModel.getProductDetail("1")

        delay(timeout: 5)
        XCTAssertNil(showDetailOfProduct)
    }
}

extension ProductDetailTests: DetailViewModelOutput {
    func displayProductDetail(
        _ product: Product
    ) {
        showDetailOfProduct = product
    }
}
