import UIKit

class StatusEditingViewController: UIViewController {
    
    weak var statusDelegate: StatusPassingDelegate!
    var previousText: String!

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        statusDelegate.statusTextChanged(with: textView.text)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = previousText
    }
}

protocol StatusPassingDelegate: AnyObject {
    func statusTextChanged(with text: String)
}
