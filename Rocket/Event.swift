
import Foundation

struct Event {
    var name: String?
    var location: String?
    var time: String?
    var eventid: Int?
    var description: String?
    
    
    static func createEventWithData(name: String, location: String, time: String, eventid: Int, description: String) -> Event {
        var newEvent = Event()
        
        newEvent.name = name
        newEvent.location = location
        newEvent.time = time
        newEvent.eventid = eventid
        newEvent.description = description
        
        return newEvent
    }
    
}
