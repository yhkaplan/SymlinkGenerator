import Foundation
import ShellOut

public struct TargetLink {
    public let target: String
    public let link: String
}

public enum SymlinkError: Error {
    case noTargetLinksFound
}

public class SymlinkGeneratorCore {
    public init() {}
    
    public func readFile(at path: String, operation: (String) throws -> [TargetLink]) throws -> [TargetLink] {
        let fileContents = try String(contentsOfFile: path)
        return try operation(fileContents)
    }
    
    public func extractTargetLinks(with fileContents: String) throws -> [TargetLink] {
        
        return try fileContents
            .split(separator: "\n")
            .map { line throws -> TargetLink in
                
                let lineArray: [String] = line.components(separatedBy: ",")
                
                guard let target = lineArray.first, let link = lineArray.last else {
                    throw SymlinkError.noTargetLinksFound
                }
                
                return TargetLink(target: target, link: link)
            }
    }

    public func generateSymlinks(targetLink: TargetLink) throws {
        try shellOut(to: .createSymlink(to: targetLink.target, at: targetLink.link))
    }
}

