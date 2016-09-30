

import Foundation

/// Various functions using different inputs to return "User" or "Event" Objects based on various queries
class WebLink {
    
    public enum lada: Error {
        case invalidEmailOrPassword(String)
        case invalidID
        case invalidEvent
        case invalidUser
    }
    
    static func fetchUserWithID(userid: UUID) throws -> User? {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw lada.invalidEmailOrPassword("Invalid Email Or Password")
    }
    
    static func fetchUserWithLogin(email: String, password: String) throws -> User? {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw lada.invalidEmailOrPassword("Invalid Email Or Pass")
        
    }
    
    static func fetchAtendeesForEvent(event: Event) throws -> [User] {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw lada.invalidEvent
        
    }
    
    static func fetchFriendsForUser(user: User) throws -> [User] {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw lada.invalidUser
        
    }
    
    
    
    
    static func fetchAllEvents() throws -> [Event] {
        let session = URLSession.shared
        
        var url: URL = URL(string: "laa")!
        
        var urlrequest: URLRequest = URLRequest(url: url)
        
        let fetcherTask = session.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                let retrievedEvents = data as! [Event]
                //
            }
            
            
            
            return
        }
        fetcherTask.resume()

        
        
        
        
        
        
        throw lada.invalidUser
        
    }
    
}
