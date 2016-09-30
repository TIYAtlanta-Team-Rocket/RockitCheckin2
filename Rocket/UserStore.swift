

import Foundation

class UserStore {
    static var store: [User]?
    static var mainUser: User? = nil
    
    static var testStore: [User] = [UserStore.testUser1, UserStore.testUser2, UserStore.testUser3]
    
    
    static var testUser1: User = User.createUserWithData(name: "Test1", email: "Test1@Test1.Test1", password: "Test1Test1", friends: [], events: [])
    static var testUser2: User = User.createUserWithData(name: "Test2", email: "Test2@Test2.Test2", password: "Test2Test2", friends: [], events: [])
    static var testUser3: User = User.createUserWithData(name: "Test3", email: "Test3@Test3.Test3", password: "Test3Test3", friends: [], events: [])
    
    
    func fetchAttendeesForEvent(event: Event, online: Bool) {
        
    }
    
    func fetchFriendsForUser(user: User, online: Bool) {
        
    }
    
    
    
}
