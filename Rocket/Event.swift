
import Foundation

struct Event {
    var name: String?
    var location: String?
    var attendees: [String]?
    var eventID: UUID?
    var description: String?
    
    
    static func createEventWithData(name: String, location: String, attendees: [String], eventID: UUID, description: String) -> Event {
        var newEvent = Event()
        
        newEvent.name = name
        newEvent.location = location
        newEvent.attendees = attendees
        newEvent.eventID = eventID
        newEvent.description = description
        
        return newEvent
    }
    
}
