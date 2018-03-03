//
//  SymlinkGeneratorCoreTests.swift
//  SymlinkGeneratorPackageDescription
//
//  Created by Joshua Kaplan on 2018/03/03.
//

import XCTest
@testable import SymlinkGeneratorCore

class SymlinkGeneratorCoreTests: XCTestCase {
    
    var symlinkGen: SymlinkGeneratorCore!
    
    override func setUp() {
        super.setUp()
        symlinkGen = SymlinkGeneratorCore()
    }
    
    override func tearDown() {
        symlinkGen = nil
        super.tearDown()
    }
    
    func test_readSymlinkFile_readsFile() {
        
    }
}
