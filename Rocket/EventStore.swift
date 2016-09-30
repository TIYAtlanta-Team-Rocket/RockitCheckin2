

import Foundation

struct EventStore {
    static var myEvents: [Event]?
    
    static var tempEvents: [Event] = [EventStore.tempEvent1, EventStore.tempEvent2, EventStore.tempEvent3]
    
    static var tempEvent1 = Event.createEventWithData(name: "Test1", location: "Test1Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test1Desc")
    static var tempEvent2 = Event.createEventWithData(name: "Test2", location: "Test2Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test2Desc")
    static var tempEvent3 = Event.createEventWithData(name: "Test3", location: "Test3Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test3Desc")
    
    static func addEventToStore(event: Event) {
        myEvents?.append(event)
    }
    
    static func fetchEventsForUser(user: User, online: Bool) {
    
    }
    
}
