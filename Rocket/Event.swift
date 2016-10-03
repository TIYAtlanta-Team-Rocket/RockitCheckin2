
import Foundation

struct Event {
    var name: String?
    var location: String?
    var time: String?
    var eventID: Int?
    var description: String?
    
    
    static func createEventWithData(name: String, location: String, time: String, eventID: Int?, description: String) -> Event {
        var newEvent = Event()
        
        newEvent.name = name
        newEvent.location = location
        newEvent.time = time
        newEvent.eventID = eventID
        newEvent.description = description
        
        return newEvent
    }
    
}
