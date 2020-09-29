import UIKit
import RealmSwift

class LogInViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let realm = try! Realm()
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        guard checkValidation(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            presentAlert(message: "Incorrect format")
            return
        }
        
        guard checkIsUserRegistered(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            presentAlert(message: "User doesn't exist")
            return
        }
        
        let users = realm.objects(User.self)
        let user = users.first { (User) -> Bool in
            User.login == login && User.password == password
        }
        
        let storyBoard = UIStoryboard(name: "UserWall", bundle: nil)
        let userWallNavController = storyBoard.instantiateInitialViewController() as! UINavigationController
        let postsTableViewController = userWallNavController.children.first as! PostsTableViewController
        postsTableViewController.user = user
        
        UserDefaults.standard.set("\(user!.userID)", forKey: "lastUser")
        
        UIApplication.setRootView(userWallNavController)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    func checkValidation(login: String, password: String) -> Bool {
        
        if !login.contains("@") { return false }
        if password.count < 6 { return false }
        
        let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for letter in password {
            if digits.contains(letter) { return true }
        }
        return false
    }
    
    func checkIsUserRegistered(login: String, password: String) -> Bool {
        
        let users = realm.objects(User.self)
        
        for user in users {
            if user.login == login && user.password == password { return true }
        }
        return false
    }
    
    //MARK:- Alert Controllers
    
    func presentAlert(message: String) {
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Of", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
