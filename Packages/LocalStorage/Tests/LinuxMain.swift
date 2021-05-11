import XCTest

import LocalStorageTests

var tests = [XCTestCaseEntry]()
tests += LocalStorageTests.allTests()
XCTMain(tests)
