import UIKit
import RealmSwift

class PostsTableViewController: UITableViewController {
    
    public var user: User!
    public var posts = List<Post>()
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCells()
        posts = user.posts
        title = user.name?.components(separatedBy: " ").first!
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        UserDefaults.standard.set(nil, forKey: "lastUser")
        UserDefaults.standard.set(false, forKey: "isAuthorized")
        
        let storyBoard = UIStoryboard(name: "Authorization", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController() as! AuthorizationViewController
        UIApplication.setRootView(viewController)
    }
    
    func setupCells() {
        
        let nibUserInfoTableViewCell = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        tableView.register(nibUserInfoTableViewCell, forCellReuseIdentifier: "userInfoCell")
        
        let nibPhotosTableViewCell = UINib(nibName: "PhotosTableViewCell", bundle: nil)
        tableView.register(nibPhotosTableViewCell, forCellReuseIdentifier: "photosCell")

        let nibAddPostTableViewCell = UINib(nibName: "AddPostTableViewCell", bundle: nil)
        tableView.register(nibAddPostTableViewCell, forCellReuseIdentifier: "addPostCell")

        let nibPostTableViewCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nibPostTableViewCell, forCellReuseIdentifier: "postCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 3:
            return posts.count
        default:
            return 1
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! UserInfoTableViewCell
            cell.cellSegueDelegate = self
            cell.setup(for: user)
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as! PhotosTableViewCell
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPostCell", for: indexPath) as! AddPostTableViewCell
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
            cell.configureCell(for: posts[indexPath.row])
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
            
        case 0:
            return 1

        case 1:
            return 8
            
        case 2:
            return 8
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 1 { return 115 }
        if indexPath.section == 2 { return 60 }

        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {
            performSegue(withIdentifier: "showPostInfoSegue", sender: posts[indexPath.row])
        }
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailedPostTableViewController = segue.destination as? DetailedPostTableViewController {
            detailedPostTableViewController.post = sender as? Post
        }
        
        if let userDetailedViewController = segue.destination as? MainViewController {
            userDetailedViewController.user = user
        }
    }
}

//MARK: - cellSegueDelegate

extension PostsTableViewController: CellSegueDelegate {
    
    func performSegue() {
        performSegue(withIdentifier: "showDetailedUserInfoSegue", sender: self)
    }
}
