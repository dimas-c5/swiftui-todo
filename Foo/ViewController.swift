import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
}

// MARK: - View Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Actions
private extension ViewController {
    @IBAction func actionButton(_ sender: UIButton) {
        mainLabel.text = textField.text
    }
}
