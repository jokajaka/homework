import Foundation
import UIKit
import RealmSwift

class Post: Object {
    
    @objc dynamic var postID = UUID().uuidString
    @objc dynamic var postDate: Date?
    @objc dynamic var image: Data?
    @objc dynamic var text: String?
    
    //MARK: - С реалмом слишком сложно, не осилил
    @objc static func changePost(with UUID: String, for newPost: Post) {
    }
    @objc static func removePost(with UUID: String) {
    }
}
