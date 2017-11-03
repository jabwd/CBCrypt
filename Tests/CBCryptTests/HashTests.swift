import Foundation
import XCTest

@testable import CBCrypt

public class HashTests: XCTestCase {
    static var allTests: [(String, (HashTests) -> () throws -> Void)] {
        return [
            ("test_Hash", test_Hash)
        ]
    }
    
    func test_Hash() {
        XCTAssert(true)
        
        let salt = UnsafeMutablePointer<Int8>.allocate(capacity: 64)
        bcrypt_gensalt(4, salt)
        
        let hash = UnsafeMutablePointer<Int8>.allocate(capacity: 64)
        bcrypt_hashpw("HelloWorld", salt, hash)
        
        let result = bcrypt_checkpw("HelloWorld", hash)
        XCTAssert(result == 0)
    }
}
