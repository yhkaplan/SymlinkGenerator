//
//  SymlinkGeneratorCoreTests.swift
//  SymlinkGeneratorPackageDescription
//
//  Created by Joshua Kaplan on 2018/03/03.
//

import XCTest
@testable import SymlinkGeneratorCore

class SymlinkGeneratorCoreTests: XCTestCase {
    
    var symgen: SymlinkGeneratorCore!
    
    override func setUp() {
        super.setUp()
        symgen = SymlinkGeneratorCore()
    }
    
    override func tearDown() {
        symgen = nil
        super.tearDown()
    }
    
    func test_extractTargetLinks_canParseString() {
        let tarLink1 = TargetLink(target: "~/target/one/test", "link: /link/to/file_one.file")
        
        let mockFileContents = """
        \(tarLink1.target), \(tarLink1.link)
        ~/target/two/test, /link/to/file_two.file
        """
        
        do {
            let targetLinks = symgen.extractTargetLinks(with: mockFileContents)
            guard let testTargetLink = targetLinks.first else {
                XCTFail("Test failed: Nothing parsed")
                return
            }
            
            XCTAssertEqual(tarLink1.target, testTargetLink.target)
            
        } catch let error {
            XCTFail("Test failed: \(error.localizedDescription)")
        }
    }
}
