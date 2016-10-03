

import Foundation

/// Various functions using different inputs to return "User" or "Event" Objects based on various queries
class WebLink {
    
    static var baseURL: String = "http://rocketcheckin.herokuapp.com"
    
    public enum webMethods: String {
        case login = "/login.json" // expects an email and password
        case register = "/register.json" // expects a User Object
        case checkedInEvents = "/checkedinevents.json" // expects a User Object
        case allEvents = "/events.json" // Expects nothing
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
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
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
                print("\n\n\n Added event and got \(data) \n\n\n")
            }
            task.resume()
        }
    }
    
    static func loginMainUserWithCreds(email: String, password: String, completion: @escaping (loginCase) -> (Void)) {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            let session = URLSession.shared
            let url: URL = URL(string: "\(baseURL)\(webMethods.login.rawValue)")!
            var urlrequest: URLRequest = URLRequest.init(url: url)
            
            
            urlrequest.httpMethod = "POST"
            urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let emailPassword: [String: String] = ["password" : password, "email" : email]
            
            urlrequest.httpBody = try? JSONSerialization.data(withJSONObject: emailPassword, options: [])
            
            let task = session.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
                var otherReturnCase: loginCase? = nil
                if error != nil {
                    otherReturnCase = loginCase.Failure("Data Task Returned Error in Login")
                }
                if data != nil {
                    print ("\n\n\n\n\(data)\n\n\n\n")
                    
                    let jsonResult = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                    let errormessage: String? = jsonResult["errorMessage"] as? String
                    if errormessage != nil {
                        otherReturnCase = loginCase.Failure(jsonResult["errorMessage"] as! String)
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
                    if jsonResult["errorMessage"] == nil && jsonResult["user"] == nil {
                        otherReturnCase = loginCase.Failure("something has gone horribly wrong")
                    }
                }
                if otherReturnCase == nil {
                    otherReturnCase = loginCase.Failure("Somethingis nil")
                }
                print("AlmostDone")
                completion(otherReturnCase!)
            }
            task.resume()
        }
    }
    
    static func registerUser(user: User) {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            let session = URLSession.shared
            let url: URL = URL(string: "\(baseURL)\(webMethods.register.rawValue)")!
            var urlrequest: URLRequest = URLRequest.init(url: url)
            urlrequest.httpMethod = "POST"
            urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let userConvertible: [String: Any] = ["firstName" : user.firstName!, "lastName" : user.lastName!, "password" : user.password!, "email" : user.email!, "techSkills" : user.techSkills!, "adminFlag" : user.adminFlag]
            
            urlrequest.httpBody = try? JSONSerialization.data(withJSONObject: userConvertible, options: [])
            
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        }
    }
    
    static func updateAllEvents () {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)\(webMethods.allEvents.rawValue)")!
            var urlRequest = URLRequest.init(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                print(data)
                if data != nil {
                    let json = (try? JSONSerialization.jsonObject(with: data!, options: []) as! [[String : Any]])!
                    
                    for event in json {
                        let description = event["description"] as! String
                        let eventName = event["eventName"] as! String
                        let eventid = event["eventid"] as! Int
                        let location = event["location"] as! String
                        let time = event["time"] as! String
                        EventStore.allTheEvents.append(Event.createEventWithData(name: eventName, location: location, time: time, eventid: eventid, description: description))
                    }
                    EventStore.cleanEventStore(eventStore: &EventStore.allTheEvents)
                }
            }
            task.resume()
        }
    }
    
    static func getUserCheckedInEvents(user: User) {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)\(webMethods.checkedInEvents.rawValue)")!
            var urlRequest = URLRequest.init(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let sentUserObject = ["email" : user.email]
            let jsondata = try? JSONSerialization.data(withJSONObject: sentUserObject, options: [])
            urlRequest.httpBody = jsondata
            
            let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                print(data)
                if data != nil {
                    let json = (try? JSONSerialization.jsonObject(with: data!, options: []) as! [[String : Any]])!
                    
                    for event in json {
                        let description = event["description"] as! String
                        let eventName = event["eventName"] as! String
                        let eventid = event["eventid"] as! Int
                        let location = event["location"] as! String
                        let time = event["time"] as! String
                        EventStore.allTheEvents.append(Event.createEventWithData(name: eventName, location: location, time: time, eventid: eventid, description: description))
                        EventStore.checkedInEvents.insert(eventid)
                        EventStore.cleanEventStore(eventStore: &EventStore.allTheEvents)
                    }
                }
            }
            task.resume()
        }
    }
    
    static func lookUpUserWithIDTest() {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            
            let session = URLSession.shared
            let url: URL = URL(string: "\(baseURL)\(webMethods.login.rawValue)")!
            var urlrequest: URLRequest = URLRequest.init(url: url)
            urlrequest.httpMethod = "POST"
            urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let emailpassword: [String: String] = ["password" : "Test1Test1", "email" : "TestEmail"]
            
            urlrequest.httpBody = try? JSONSerialization.data(withJSONObject: emailpassword, options: [])
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        }
    }
    
    static func registerUserWithIDTest() throws {
        let privatequeue = OperationQueue()
        privatequeue.addOperation {
            let session = URLSession.shared
            let url: URL = URL(string: "\(baseURL)\(webMethods.register.rawValue)")!
            var urlrequest: URLRequest = URLRequest.init(url: url)
            urlrequest.httpMethod = "POST"
            urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let emailpassword: [String: String] = ["password" : "Test2Test2", "email" : "TestEmail2"]
            
            urlrequest.httpBody = try? JSONSerialization.data(withJSONObject: emailpassword, options: [])
            let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                if data != nil {
                    print("\n\n\n\n We got \(data)\n\n\n\n ")
                }
            }
            task.resume()
        }
    }
}


//                 switch itemResult {
//case let .Success(items):
//self.items = items
//print(self.items)
//case let .Failure(error):
//print("Could not retrieve items because: \(error)")
//}
