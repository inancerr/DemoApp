//
//  XCTestCase+Extensions.swift
//  DemoAppTests
//
//  Created by İnanç Er on 11.05.2021.
//

import XCTest

extension XCTestCase {
    func delay(timeout: Double) {
        let expectation = XCTestExpectation(
            description: "Delay"
        )
        DispatchQueue.main.asyncAfter(
            deadline: .now() + timeout) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100000)
    }
}
