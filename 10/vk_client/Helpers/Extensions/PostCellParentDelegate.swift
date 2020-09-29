import Foundation

protocol PostCellParentDelegate: AnyObject {
    
    ///Получение имени пользователя по ID из UserPosts.Response.Profiles или UserPosts.Response.Groups
    func getUserName(by id: Int) -> String
    
    ///Получение картинки по ID из UserPosts.Response.Profiles или UserPosts.Response.Groups
    func getProfileImageURL(by id: Int) -> String
}
