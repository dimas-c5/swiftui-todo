import XCTest
@testable import Manage
import Prelude

class ManageTests: XCTestCase {
    func testLoad() {
        Current.fileClient.load = const(.sync { try! JSONEncoder().encode(["X", "Y", "Z"]) })

        var state = ManageViewState(todos: ["X", "Y"])
        var effects = manageReducer(state: &state, action: .load)

        XCTAssertEqual(state.todos, ["X", "Y"])
        XCTAssertEqual(effects.count, 1)

        var nextAction: ManageAction!
        let receivedCompletion = self.expectation(description: "receivedCompletion")

        _ = effects[0].sink(
            receiveCompletion: const(receivedCompletion.fulfill()),
          receiveValue: { action in
            XCTAssertEqual(action, .loaded(["X", "Y", "Z"]))
            nextAction = action
        })
        self.wait(for: [receivedCompletion], timeout: 0)

        effects = manageReducer(state: &state, action: nextAction)

        XCTAssertEqual(state.todos, ["X", "Y", "Z"])
        XCTAssertTrue(effects.isEmpty)
    }

    func testLoaded() {
        var state = ManageViewState(todos: ["A"])
        let effects = manageReducer(state: &state, action: .loaded(["C"]))

        XCTAssertEqual(state.todos, ["C"])
        XCTAssertTrue(effects.isEmpty)
    }

    func testSave() {
        var didSave = false
        Current.fileClient.save = const(.fireAndForget { didSave = true })

        var state = ManageViewState(todos: ["T"])
        let effects = manageReducer(state: &state, action: .save)

        XCTAssertEqual(state.todos, ["T"])
        XCTAssertEqual(effects.count, 1)

        _ = effects[0].sink { _ in XCTFail() }

        XCTAssertTrue(didSave)
    }
}
