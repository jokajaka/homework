import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let realm = try! Realm()
    var isAuthorized: String!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        isAuthorized = UserDefaults.standard.string(forKey: "lastUser")

        if UserDefaults.standard.string(forKey: "isFirstLaunch") == nil {
                      
            let users = Generator.generateUsers()
            try! realm.write {
                realm.add(users)
            }
            UserDefaults.standard.set("firstLaunch", forKey: "isFirstLaunch")
        }
        
        if let userID = UserDefaults.standard.string(forKey: "lastUser") {
            
            let userID = userID
            let user = getUserByID(ID: userID)!
            
            let storyboard = UIStoryboard(name: "UserWall", bundle: nil)
            let navController = storyboard.instantiateInitialViewController() as! UINavigationController
            let viewController = navController.children.first as! PostsTableViewController
            viewController.user = user
            
            self.window?.rootViewController = navController
            
        } else {
            
            let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! AuthorizationViewController
            self.window?.rootViewController = viewController
        }
    }
    
    func getUserByID(ID: String) -> User? {
        
        let users = realm.objects(User.self)
        
        for user in users {
            if user.userID == ID { return user }
        }
        return nil
    }
}

