

import XCTest
@testable import Rocket


class RocketTests: XCTestCase {
     
    
    static var testUser1 = User.createUserWithData(firstName: "John" , lastName: "Frankenstein", email: "john@drfrank.com", password: "TestTest", techSkills: "I bring people back from the dead")
    
    static var testUser2 = User.createUserWithData(firstName: "Amanda" , lastName: "Hugandkiss", email: "kiss@xoxoxo.biz" , password: "❤️❤️❤️❤️❤️❤️", techSkills: "Daycare, prank calls, etc")
    
    
    func testNotNil() {
        
        XCTAssertNotNil(RocketTests.testUser1.firstName)
        XCTAssertNotNil(RocketTests.testUser1.lastName)
        XCTAssertNotNil(RocketTests.testUser1.email)
        XCTAssertNotNil(RocketTests.testUser1.password)
        XCTAssertNotNil(RocketTests.testUser1.techSkills)
        
        XCTAssertNotNil(RocketTests.testUser1)
        XCTAssertNotNil(RocketTests.testUser2)

        
    }
    
    func testNotBlank() {
        XCTAssertFalse(RocketTests.testUser1.firstName == "")
        XCTAssertFalse(RocketTests.testUser1.lastName == "")
        XCTAssertFalse(RocketTests.testUser1.email == "")
        XCTAssertFalse(RocketTests.testUser1.password == "")
        XCTAssertFalse(RocketTests.testUser1.techSkills == "")

    }
    
    
    func testLessThanFive() {
        
        if (RocketTests.testUser1.firstName?.characters.count)! < 2 {
            XCTFail("Characters less than five")
        }
        
        
    }
    
    
    
    
}






