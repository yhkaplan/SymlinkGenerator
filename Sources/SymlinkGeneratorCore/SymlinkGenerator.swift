import Foundation
import ShellOut
import Files

public class SymlinkGeneratorCore {
    public var contents: String?
    
    public init() {}

    //TODO: To implement change method used to read file
    public func readSymlinkFile(at path: String) throws {
       	contents = try shellOut(to: .readFile(at: "path/path"))
    }

    public func generateSymlinks(links: [String]) throws { //Make custom struct
	for link in links {
	    try shellOut(to: .createSymlink(to: "~/", at: link))
	}
    }
}

