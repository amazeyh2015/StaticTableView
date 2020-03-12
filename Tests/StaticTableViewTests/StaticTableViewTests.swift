import XCTest
@testable import StaticTableView

final class StaticTableViewTests: XCTestCase {
    func testExample() {
        let tv1 = StaticTableView(style: .plain)
        let tv2 = StaticTableView(style: .grouped)
        XCTAssert(tv1.style == .plain)
        XCTAssert(tv2.style == .grouped)
    }
}
