//
//  ListTests.swift
//  ListTests
//
//  Created by İnanç Er on 5.05.2021.
//

import XCTest
@testable import DemoApp
@testable import ProductApi
@testable import Entities
@testable import LocalStorage

class ListTests: XCTestCase {
    
    var reloadListCalled: Bool = false
    var showDetailOfProduct: Product?
    
    override func setUp() {
    }
    
    override func tearDown() {
        reloadListCalled = false
        showDetailOfProduct = nil
        CoreDataManager.shared.clear(ProductEntity.self)
    }
}

// MARK: - Get Product List Tests
extension ListTests {
    func test_getProductTest_success() {
        let viewModel = ListViewModel(
            productAPI: .productAPIMock
        )
        viewModel.output = self
        
        viewModel.getProductList()
        
        delay(timeout: 3)
        XCTAssertEqual(true, reloadListCalled)
    }
    
    func test_getProductTest_error() {
        let viewModel = ListViewModel(
            productAPI: .error
        )
        viewModel.output = self
        
        viewModel.getProductList()
        
        delay(timeout: 5)
        XCTAssertEqual(false, reloadListCalled)
    }
}

// MARK: - Show Product Detail Test
extension ListTests {
    func test_showProductDetail() {
        let viewModel = ListViewModel(
            productAPI: .productAPIMock
        )
        viewModel.output = self
        viewModel.getProductList()
        
        delay(timeout: 3)
        viewModel.didSelectItemAt(
            .init(row: 0, section: 0)
        )
        XCTAssertNotNil(showDetailOfProduct)
    }
}

extension ListTests: ListViewModelOutput {
    func reloadList() {
        reloadListCalled = true
    }
    
    func showProductDetail(
        _ product: Product
    ) {
        showDetailOfProduct = product
    }
}
