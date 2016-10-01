
import Foundation

struct NewUser {
    var name: String?
    var email: String?
    var password: String?
    var friends: [String]?
    var events: [UUID]?
    var isadmin: Bool = false
    
    static func createUserWithData(name: String, email: String, password: String, friends: [String], events: [UUID]) -> NewUser {
        var returnNewUser = NewUser()
        
        returnNewUser.email = email
        returnNewUser.name = name
        returnNewUser.password = password
        returnNewUser.friends = friends
        returnNewUser.events = events
        
        return returnNewUser
    }
    
}
