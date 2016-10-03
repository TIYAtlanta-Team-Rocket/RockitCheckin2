

import Foundation

struct EventStore {
    static var allTheEvents: [Event] = []
    // number of events in the Event list View
    
    static var checkedInEvents: Set = [0]
    
    static var mainEvent: Event? = nil
    
    
    // number of events that have been "checked into"
    
    // static var tempEvents: [Event] = [EventStore.tempEvent1, EventStore.tempEvent2, EventStore.tempEvent3]
    
//    static var tempEvent1 = Event.createEventWithData(name: "Test1", location: "Test1Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test1Desc")
//    
//    
//    static var tempEvent2 = Event.createEventWithData(name: "Test2", location: "Test2Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test2Desc")
//    
//    
//    static var tempEvent3 = Event.createEventWithData(name: "Test3", location: "Test3Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test3Desc")
//    
    static func addEventToStore(event: Event, store: inout [Event]) {
        store.append(event)
    }
    
    static func cleanEventStore(eventStore: inout [Event]) {
    var dedupedEventStore = eventStore
        var positionOne = 0
        var positionTwo = 0
        while positionOne < dedupedEventStore.count - 1 {
            positionTwo = positionOne + 1
            while positionTwo < dedupedEventStore.count - 1 {
            }
            if dedupedEventStore[positionOne].eventid == dedupedEventStore[positionTwo].eventid {
                dedupedEventStore.remove(at: positionTwo)
            }
            positionOne += 1
        }
        eventStore = dedupedEventStore
    }
    
    static func fetchEventsForUser(user: User, online: Bool) {
    
    }
    
}
