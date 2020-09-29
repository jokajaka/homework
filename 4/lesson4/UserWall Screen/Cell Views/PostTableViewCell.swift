import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    func configureCell(for post: Post) {
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
        
        postText.text = post.text
        
        guard let imageData = post.image else {
            postImage.image = nil
            return
        }
        postImage.image = UIImage(data: imageData)
    }
}
