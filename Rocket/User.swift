
import Foundation

struct User {
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var techSkills: String?
    var adminFlag: Bool = false
    
    static func createUserWithData(firstName: String, lastName: String, email: String, password: String, techSkills: String, adminFlag: Bool) -> User? {
        var returnUser = User()
        
        returnUser.email = email
        returnUser.firstName = firstName
        returnUser.lastName = lastName
        returnUser.password = password
        returnUser.techSkills = techSkills
        returnUser.adminFlag = adminFlag
        return returnUser
    }
    
}
