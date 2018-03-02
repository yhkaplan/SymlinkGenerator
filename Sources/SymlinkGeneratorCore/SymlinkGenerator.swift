import Foundation
import ShellOut

public struct TargetLink {
    let target: String
    let link: String
}

public class SymlinkGeneratorCore {
    public var contents: String?
    public init() {}
    
    public func readSymlinkFile(at path: String) throws -> [TargetLink]? {
        
        let reader = try String(contentsOfFile: path)
        
        let lines = reader.split(separator: "\n")
        var targetLinks: [TargetLink]?
        
        lines.forEach { line in
            let lineArray: [String] = line.components(separatedBy: ",")
            
            if let target = lineArray.first, let link = lineArray.last {
                let targetLink = TargetLink(target: target, link: link)
                targetLinks?.append(targetLink)
            }
        }
        
        return targetLinks
    }

    public func generateSymlinks(targetLinks: [TargetLink]) throws {
        for targetLink in targetLinks {
            try shellOut(to: .createSymlink(to: targetLink.target, at: targetLink.link))
        }
    }
}

