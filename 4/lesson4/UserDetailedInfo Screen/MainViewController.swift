import UIKit

class MainViewController: UIViewController {
    
    var user: User!
    let statusEditingViewControllerIdentifier = "statusEditingVC"

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isActiveLabel: UILabel!
    @IBOutlet weak var shortInfo: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var studiedAtLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var livingCityLabel: UILabel!
    @IBOutlet weak var vkPageLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var flatstackLogo: UIImageView!
    @IBOutlet weak var technokratosLogo: UIImageView!
    @IBOutlet weak var gift1: UIImageView!
    @IBOutlet weak var gift2: UIImageView!
    @IBOutlet weak var gift3: UIImageView!
    @IBOutlet weak var gift4: UIImageView!
    @IBOutlet weak var statusView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupFotUser()
    }
    
    func setupUI() {
        
        userPhoto.layer.cornerRadius = userPhoto.frame.height / 2
        userPhoto.clipsToBounds = true
        
        technokratosLogo.layer.cornerRadius = technokratosLogo.frame.height / 2
        technokratosLogo.clipsToBounds = true
        
        flatstackLogo.layer.cornerRadius = flatstackLogo.frame.height / 2
        flatstackLogo.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        statusView.addGestureRecognizer(tapGestureRecognizer)
        
        title = user.name?.components(separatedBy: " ").first
    }
    
    func setupFotUser() {
        
        nameLabel.text = user.name
        userPhoto.image = UIImage(data: user.userPhoto!)
        shortInfo.text = user.shortInfo
        statusLabel.text = user.status
        birthDayLabel.text = user.birthDay
        studiedAtLabel.text = user.studiedAt
    }
    
    @objc func tapGesture() {
        
        let statusEditingVC = storyboard?.instantiateViewController(identifier: statusEditingViewControllerIdentifier) as! StatusEditingViewController
        statusEditingVC.statusDelegate = self
        statusEditingVC.previousText = statusLabel.text
        
        present(statusEditingVC, animated: true, completion: nil)
    }
    
}

//MARK:- Status Passing Delegate

extension MainViewController: StatusPassingDelegate {
    
    func statusTextChanged(with text: String) {
        self.statusLabel.text = text
    }
}
