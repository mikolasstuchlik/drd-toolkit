import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(drd_toolkitTests.allTests),
    ]
}
#endif