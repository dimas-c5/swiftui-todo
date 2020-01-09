import XCTest
@testable import Show

class ShowTests: XCTestCase {
    func testDelete() {
        var state = ["2", "3", "5", "7"]
        let effects = showReducer(state: &state, action: .delete([2]))

        XCTAssertEqual(state, ["2", "3", "7"])
        XCTAssert(effects.isEmpty)
    }
    func testLoad() {
        var state: [String] = ["A"]
        let effects = showReducer(state: &state, action: .load(["Z"]))

        XCTAssertEqual(state, ["Z"])
        XCTAssertTrue(effects.isEmpty)
    }
}
