

import XCTest

class RocketUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
        static var tempEvent1 = Event.createEventWithData(name: "Test1", location: "Test1Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test1Desc")
    
    
        static var tempEvent2 = Event.createEventWithData(name: "Test2", location: "Test2Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test2Desc")
    
    
        static var tempEvent3 = Event.createEventWithData(name: "Test3", location: "Test3Loc", attendees: [UserStore.testUser1.email!, UserStore.testUser2.email!, UserStore.testUser3.email!], eventID: UUID.init(), description: "Test3Desc")
    
    
    
    
    
    

    static func testEventStore
    
}
