

import Foundation

/// Various functions using different inputs to return "User" or "Event" Objects based on various queries
class WebLink {
    
    static var baseURL: String = "http://rocketcheckin.herokuapp.com"
    
    public enum webMethods: String {
        case login = "/login.json" // expects an email and password
        case register = "/register.json" // expects a User Object
        case checkedInEvents = "/checkedinevents.json" // expects a User Object
        case allevents = "/events.json" // Expects nothing
        case eventAttendees = "/attendees.json" // Expects an Event Object
        case addEvent = "/addEvent.json" // takes in event
    }
    

    public enum errorList: Error {
        case invalidEmailOrPassword(String)
        case invalidID
        case invalidEvent
        case invalidUser
    }
    
    public enum loginCase {
        case Success(User)
        case Failure(String)
    }
    
    static func createNewEvent(eventName: String, location: String, time: String, description: String) {
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.addEvent.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let event: [String: String] = ["eventName" : eventName, "location" : location, "time" : time, "description" : description]
        
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: event, options: [])
        } catch {
            return
        }
        
        
        let task = session.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
            print(data)
        }
        task.resume()
    }
    
    static func loginMainUserWithCreds(email: String, password: String, completion: @escaping (loginCase) -> (Void)) {
        
        let returnCase: loginCase
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.login.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        
        
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let emailPassword: [String: String] = ["password" : password, "email" : email]
        
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: emailPassword, options: [])
        } catch {
            returnCase = loginCase.Failure("JSONSerializationError")
        }
        
        let task = session.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
            var otherReturnCase: loginCase? = nil
            if error != nil {
                otherReturnCase = loginCase.Failure("Data Task Returned Error in Login")
            }
            if data != nil {
                print ("\n\n\n\n\(data)\n\n\n\n")
                
                let jsonResult = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                if jsonResult["errormessage"] != nil {
                    otherReturnCase = loginCase.Failure(jsonResult["errormessage"] as! String)
                } else if jsonResult["user"] != nil {
                    let userData = jsonResult["user"] as! [String: AnyObject]
                    let newuserFName = userData["firstName"] as! String
                    let newuserLName = userData["lastName"] as! String
                    let newuserEmail = userData["email"] as! String
                    let newuserpassword = userData["password"] as! String
                    let newuserIsAdmin = userData["adminFlag"] as! Bool
                    let newuserTechSkills = userData["techSkills"] as! String
                    let returnUser = User.createUserWithData(firstName: newuserFName, lastName: newuserLName, email: newuserEmail, password: newuserpassword, techSkills: newuserTechSkills, adminFlag: newuserIsAdmin)
                    if returnUser != nil {
                        otherReturnCase = loginCase.Success(returnUser!)
                    } else {
                        otherReturnCase = loginCase.Failure("Failed to create User")
                    }
                }
                if jsonResult["errormessage"] == nil && jsonResult["user"] == nil {
                    otherReturnCase = loginCase.Failure("something has gone horribly wrong")
                }
            }
            if otherReturnCase == nil {
                otherReturnCase = loginCase.Failure("Somethingis nil")
            }
            completion(otherReturnCase!)
        }
        task.resume()
    }
    
    static func registerUser(user: User) throws {
        let session = URLSession.shared
        let url: URL = URL(string: "\(baseURL)\(webMethods.register.rawValue)")!
        var urlrequest: URLRequest = URLRequest.init(url: url)
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let userConvertible: [String: Any] = ["firstName" : user.firstName!, "lastName" : user.lastName!, "password" : user.password!, "email" : user.email!, "techSkills" : user.techSkills!, "adminFlag" : user.adminFlag]
        do {
            urlrequest.httpBody = try JSONSerialization.data(withJSONObject: userConvertible, options: [])
            
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        } catch let errorthing {
            throw errorthing
        }
        return
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
