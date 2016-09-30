
import Foundation

struct User {
    var name: String?
    var email: String?
    var password: String?
    var friends: [String]?
    var events: [UUID]?
    var isadmin: Bool = false
    
    static func createUserWithData(name: String, email: String, password: String, friends: [String], events: [UUID]) -> User {
        var returnUser = User()
        
        returnUser.email = email
        returnUser.name = name
        returnUser.password = password
        returnUser.friends = friends
        returnUser.events = events
        
        return returnUser
    }
    
}
