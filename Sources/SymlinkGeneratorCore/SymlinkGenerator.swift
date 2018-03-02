import Foundation
import ShellOut

public class SymlinkGeneratorCore {
    public var contents: String?
    
    public init() {}

    //TODO: To implement
    public func readSymlinkFile(at path: String) throws {
       	contents = try shellOut(to: .readFile(at: "path/path"))
    }

    public func generateSymlinks(links: [String]) throws { //Make custom struct
	links.forEach { link in
	    try shellOut(to: .createSymlink(to: "~/", at: link))
	}
    }
}

