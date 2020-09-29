import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortInfoLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    
    weak var cellSegueDelegate: CellSegueDelegate!
    
    @IBAction func showDetailedUserInfoButtonPressed(_ sender: Any) {
        cellSegueDelegate.performSegue()
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        userImage.layer.cornerRadius = userImage.frame.height / 2
//        editProfileButton.layer.cornerRadius = editProfileButton.frame.height / 2
//        self.selectionStyle = .none
//    }
//
    func setup(for user: User) {
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        editProfileButton.layer.cornerRadius = editProfileButton.frame.height / 2
        self.selectionStyle = .none
        
        nameLabel.text = user.name
        shortInfoLabel.text = user.shortInfo
        userImage.image = UIImage(data: user.userPhoto!)
    }
}

protocol CellSegueDelegate: AnyObject {
    
    func performSegue()
}
