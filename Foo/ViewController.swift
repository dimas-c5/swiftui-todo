import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var todos = [String]()
}

// MARK: - Tableivew datasource
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

// MARK: - Actions
private extension ViewController {
    @IBAction func actionButton(_ sender: UIButton) {
        _ = textField.text.map { todos.insert($0, at: 0) }
        tableView.reloadData()
    }
}
