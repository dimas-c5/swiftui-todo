import XCTest
@testable import Manage

class ManageTests: XCTestCase {
    func testLoaded() {
        var state = ManageViewState(todos: ["A"])
        let effects = manageReducer(state: &state, action: .loaded(["C"]))

        XCTAssertEqual(state.todos, ["C"])
        XCTAssertTrue(effects.isEmpty)
    }
}
