

import XCTest
@testable import Rocket


class RocketTests: XCTestCase {
     
    
    static var testUser1 = User.createUserWithData(firstName: "John" , lastName: "Frankenstein", email: "john@drfrank.com", password: "TestTest", techSkills: "I bring people back from the dead", adminFlag: true)!
    
    static var testUser2 = User.createUserWithData(firstName: "Amanda" , lastName: "Hugandkiss", email: "kiss@xoxoxo.biz" , password: "❤️❤️❤️❤️❤️❤️", techSkills: "Daycare, prank calls, etc", adminFlag: false)!
    
    //static var emojiTest =
    
    
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
    
    
    func testLessThanTwo() {
        
        if (RocketTests.testUser1.firstName?.characters.count)! < 2 {
            XCTFail("Characters less than five")
        }
        
        
    }
    
    func testIsAdmin() {
            XCTAssertTrue(RocketTests.testUser1.adminFlag, "You are an admin")
          //  XCTAssertTrue(RocketTests.testUser2.isAdmin, "You are not an admin")
    }
    
//    func testHasEmoji() {
//        
//        for emoji in emojiTest {
//            if RocketTests.testUser1.firstName?.contains(emoji) {
//                
//          }
//
//        }
    
    }
    
    
    // test to see if the email has an @ sign
    // test to see if there is emoji in the email/pass etc
    //
    
    







