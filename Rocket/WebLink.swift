

import Foundation

/// Various functions using different inputs to return "User" or "Event" Objects based on various queries
class WebLink {
    
    static var baseURL: String = "http://10.0.0.138:8080"
    
    public enum webMethods: String {
        case login = "/login.json"
        case register = "/register.json"
    }
    

    public enum errorList: Error {
        case invalidEmailOrPassword(String)
        case invalidID
        case invalidEvent
        case invalidUser
    }
    
    static func logInWithUserCreds(email: String, password: String) throws {
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.login.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let emailPassword: [String: String] = ["password" : password, "email" : email]
        
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: emailPassword, options: [])
        } catch let JSONSerializationError {
            throw JSONSerializationError
        }
        
        let task = session.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                return
            }
            
            if data != nil {
             //   let parserResult = JSONParser.JSONDataToArray(data: data!)
                //         var newuser = User.createUserWithData(name: String, email: String, password: String, friends: [String], events: [UUID])
                
                ///// STOPPED HERE //////
            }
        }
        task.resume()
    }
    
    static func lookUpUserWithIDTest() throws {
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.login.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let emailpassword: [String: String] = ["password" : "Test1Test1", "email" : "TestEmail"]
        
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: emailpassword, options: [])
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        } catch let errorthing {
            throw errorthing
        }
        throw errorList.invalidEmailOrPassword("Invalid Email Or Password")
    }
    
    static func registerUserWithIDTest() throws {
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.register.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let emailpassword: [String: String] = ["password" : "Test2Test2", "email" : "TestEmail2"]
        
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: emailpassword, options: [])
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        } catch let errorthing {
            throw errorthing
        }
    }
    
    static func fetchUserWithLogin(email: String, password: String) throws -> User? {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw errorList.invalidEmailOrPassword("Invalid Email Or Pass")
        
    }
    
    static func fetchAtendeesForEvent(event: Event) throws -> [User] {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw errorList.invalidEvent
        
    }
    
    static func fetchFriendsForUser(user: User) throws -> [User] {
        let session = URLSession.shared
        var url: URL
        var urlrequest: URLRequest
        
        throw errorList.invalidUser
        
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

        
        
        
        
        
        
        throw errorList.invalidUser
        
    }
    
}


//                 switch itemResult {
//case let .Success(items):
//self.items = items
//print(self.items)
//case let .Failure(error):
//print("Could not retrieve items because: \(error)")
//}
