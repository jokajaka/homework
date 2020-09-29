import Foundation

struct ProfileInfo: Codable {
    
    var response: [ProfileInfoResponse]
}

struct ProfileInfoResponse: Codable {
    
    var id: Int
    var photo_200: String
    var first_name: String
    var last_name: String
    var sex: Int
    var bdate: String
    var online: Int
    var city: City?
}

struct Country: Codable {
    
    var id: Int
    var title: String
}

struct City: Codable {
    
    var id: Int
    var title: String
}

