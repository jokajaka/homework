import Foundation
import UIKit
import RealmSwift

class Generator {
    
    static func generateUsers() -> [User] {
        
        let user1: User = {
            let user = User()
            user.login = "qwerty1@gmail.com"
            user.password = "qwerty1"
            user.birthDay = "8 July 2000"
            user.status = "Hello World"
            user.userPhoto = #imageLiteral(resourceName: "examplePhoto9.jpg").pngData()
            user.name = "Ivan Ivanov"
            user.shortInfo = "19 years old, Kazan"
            user.studiedAt = "КФУ (бывш. КГУ им. Ульянова-Ленина)"
            
            let post1 = Post()
            post1.image = UIImage(named: "examplePhoto1")!.jpegData(compressionQuality: 0.5)
            post1.text = "Кодзима гений"
            
            let post2 = Post()
            post2.image = UIImage(named: "examplePhoto2")!.jpegData(compressionQuality: 0.5)
            post2.text = "Elon Musk"
            
            let posts = List<Post>()
            posts.append(post1)
            posts.append(post2)
            
            user.posts = posts
            
            return user
        }()
        
        let user2: User = {
            let user = User()
            user.login = "qwerty2@gmail.com"
            user.password = "qwerty2"
            user.birthDay = "10 may 1995"
            user.status = "🍪"
            user.userPhoto = #imageLiteral(resourceName: "examplePhoto10.jpg").pngData()
            user.name = "Vasya Vasiliev"
            user.shortInfo = "23 years old, Moscow"
            user.studiedAt = "МФТИ"
            
            let post1 = Post()
            post1.image = UIImage(named: "examplePhoto3")!.jpegData(compressionQuality: 0.5)
            
            let post2 = Post()
            post2.image = UIImage(named: "examplePhoto4")!.jpegData(compressionQuality: 0.5)
            post2.text = ""
            
            let post3 = Post()
            post3.image = UIImage(named: "examplePhoto7")!.jpegData(compressionQuality: 0.5)
            post3.text = ""
            
            let posts = List<Post>()
            posts.append(post1)
            posts.append(post2)
            posts.append(post3)
            
            user.posts = posts
            
            return user
        }()
        
        let user3: User = {
            let user = User()
            user.login = "qwerty3@gmail.com"
            user.password = "qwerty3"
            user.birthDay = "28 jan 2002"
            user.status = "qwerty"
            user.userPhoto = #imageLiteral(resourceName: "user3.jpg").pngData()
            user.name = "Misha Miheev"
            user.shortInfo = "16 years old, Surgut"
            user.studiedAt = "УрФУ"
            
            let post1 = Post()
            post1.image = UIImage(named: "examplePhoto5")!.jpegData(compressionQuality: 0.5)
            
            let post2 = Post()
            post2.image = UIImage(named: "examplePhoto6")!.jpegData(compressionQuality: 0.5)
            
            let post3 = Post()
            post3.image = UIImage(named: "examplePhoto8")!.jpegData(compressionQuality: 0.5)
            
            let post4 = Post()
            post3.image = UIImage(named: "examplePhoto9")!.jpegData(compressionQuality: 0.5)
            
            let posts = List<Post>()
            posts.append(post1)
            posts.append(post2)
            posts.append(post3)
            posts.append(post4)
            
            user.posts = posts
            
            return user
        }()
        
        return [user1, user2, user3]
    }
}
