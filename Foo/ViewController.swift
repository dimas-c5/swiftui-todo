import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var todos = [String]()
}

// MARK: - View lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }
}

// MARK: - Tableview datasource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTextCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}

// MARK: - Tableview delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _,_, completion in
            self?.todos.remove(at: indexPath.row)
            tableView.reloadData()
            completion(true)
        }


        action.backgroundColor = .red
        return .init(actions: [action])
    }
}

// MARK: - Text field delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _ = textField.text.map { todos.insert($0, at: 0) }
        textField.text = nil

        tableView.reloadData()
        return true
    }
}
