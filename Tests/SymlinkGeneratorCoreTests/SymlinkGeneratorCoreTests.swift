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
    var targetLink1: TargetLink!
    var targetLink2: TargetLink!
    var mockFileContents: String!
    
    override func setUp() {
        super.setUp()
        symgen = SymlinkGeneratorCore()
        
        targetLink1 = TargetLink(target: "~/target/one/test", link: "/link/to/file_one.file")
        targetLink2 = TargetLink(target: "~/target/two/test", link: "/link/to/file_two.file")
        mockFileContents = """
        \(targetLink1.target), \(targetLink1.link)
        \(targetLink2.target), \(targetLink2.link)
        """
    }
    
    override func tearDown() {
        symgen = nil
        super.tearDown()
    }
    
    func test_extractTargetLinks_canParseFirstString() {
        do {
            let targetLinks = try symgen.extractTargetLinks(with: mockFileContents)
            guard let testTargetLink1 = targetLinks.first else {
                XCTFail("Test failed: Nothing parsed")
                return
            }
            
            XCTAssertEqual(targetLink1.target, testTargetLink1.target)
            XCTAssertEqual(targetLink1.link, testTargetLink1.link)
            
        } catch let error {
            XCTFail("Test failed: \(error.localizedDescription)")
        }
    }
    
    func test_extractTargetLinks_canParseSecondString() {
        do {
            let targetLinks = try symgen.extractTargetLinks(with: mockFileContents)
            
            guard let testTargetLink2 = targetLinks.last else {
                XCTFail("Test failed: Nothing parsed")
                return
            }
            
            XCTAssertEqual(targetLink2.target, testTargetLink2.target)
            XCTAssertEqual(targetLink2.link, testTargetLink2.link)
            
        } catch let error {
            XCTFail("Test failed: \(error.localizedDescription)")
        }
    }
}
