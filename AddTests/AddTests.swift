import XCTest
@testable import Add

class AddTests: XCTestCase {
    func TestAdd() {
        var state: [String] = ["A"]
        let effects = addReducer(state: &state, action: .add("B"))

        XCTAssertEqual(state, ["A", "B"])
        XCTAssertTrue(effects.isEmpty)
    }
}
