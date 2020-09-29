import UIKit

class MainViewController: UIViewController {

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
    
    let statusEditingViewControllerIdentifier = "statusEditingVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPhoto.layer.cornerRadius = userPhoto.frame.height / 2
        userPhoto.clipsToBounds = true
        
        technokratosLogo.layer.cornerRadius = technokratosLogo.frame.height / 2
        technokratosLogo.clipsToBounds = true
        
        flatstackLogo.layer.cornerRadius = flatstackLogo.frame.height / 2
        flatstackLogo.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        statusView.addGestureRecognizer(tapGestureRecognizer)
        
        randomFieldsInitialisation()
    }
    
    @objc func tapGesture() {
        
        let statusEditingVC = storyboard?.instantiateViewController(identifier: statusEditingViewControllerIdentifier) as! StatusEditingViewController
        statusEditingVC.statusDelegate = self
        statusEditingVC.previousText = statusLabel.text
        
        present(statusEditingVC, animated: true, completion: nil)
    }
    
    func randomFieldsInitialisation() {
        
        userPhoto.image = UIImage(named: "user\(Int.random(in: 1...4))")
        
        let nameSamples = ["Никита Лужбин", "Петр Аркадьевич", "Геннадий Паровозов", "Василий Уткин"]
        nameLabel.text = nameSamples.randomElement()
        
        let changedTitle = String((nameLabel.text?.split(separator: " ").first)!)
        title = changedTitle
        
        let isActiveSamples = ["online", "offline"]
        isActiveLabel.text = isActiveSamples.randomElement()
        
        let shortInfoSamples = ["19 years old, Kazan", "20 years old, Moscow", "30 years old, Ufa"]
        shortInfo.text = shortInfoSamples.randomElement()
        
        let statusSamples = ["🍪", "🍇", "🌲", "🎷", "🎸"]
        statusLabel.text = statusSamples.randomElement()
        
        let birthdaySamples = ["8 July 2000", "20 November 2005", "1 May 1991"]
        birthDayLabel.text = birthdaySamples.randomElement()
        
        let studiedAtSamples = ["КФУ", "КАИ", "МГУ", "МГИМО"]
        studiedAtLabel.text = studiedAtSamples.randomElement()
        
        let languagesSample = ["Русский", "English"]
        languagesLabel.text = languagesSample.randomElement()
        
        let citySamples = ["Kazan", "Moscow", "Ufa", "Surgut"]
        livingCityLabel.text = citySamples.randomElement()
        
        let vkPageSamples = ["id111111111", "id222222222", "id333333333"]
        vkPageLabel.text = vkPageSamples.randomElement()
        
        let phoneNumberSamples = ["79111111111", "79222222222", "79333333333"]
        phoneNumberLabel.text = phoneNumberSamples.randomElement()
        
        let userGifts = [gift1, gift2, gift3, gift4]
        for userGift in userGifts {
            userGift?.image = UIImage(named: "gift\(Int.random(in: 1...5))")
        }
    }
}

extension MainViewController: StatusPassingDelegate {
    
    func statusTextChanged(with text: String) {
        self.statusLabel.text = text
    }
}
