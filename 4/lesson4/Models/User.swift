import Foundation
import UIKit
import RealmSwift

class User: Object {
    
    @objc dynamic var userID = UUID().uuidString
    @objc dynamic var login: String!
    @objc dynamic var password: String!

    var posts = List<Post>()
    
    @objc dynamic var status: String?
    @objc dynamic var userPhoto: Data?
    @objc dynamic var name: String?
    @objc dynamic var shortInfo: String?
    @objc dynamic var birthDay: String?
    @objc dynamic var studiedAt: String?
    
}
