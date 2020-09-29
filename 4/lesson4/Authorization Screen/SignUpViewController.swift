import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        let signUpButton = sender as! customButton
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        guard !login.isEmpty && login.contains("@") else {
            signUpButton.shake()
            presentErrorAlert(message: "Incorrect login")
            return
        }

        guard !password.isEmpty && password.count > 5 else {
            signUpButton.shake()
            presentErrorAlert(message: "Incorrect password")
            return
        }
        
        let message = "Sign Up function in not ready yet"
        presentErrorAlert(message: message)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func presentErrorAlert(message: String) {
        
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(alertAction)
        
        present(errorAlert, animated: true)
    }
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
}
