import XCTest

import drd_toolkitTests

var tests = [XCTestCaseEntry]()
tests += drd_toolkitTests.allTests()
XCTMain(tests)