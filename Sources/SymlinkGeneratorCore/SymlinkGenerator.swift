import Foundation
import ShellOut

public struct TargetLink {
    let target: String
    let link: String
}

public enum SymlinkError: Error {
    case couldNotReadFile
    case noTargetLinksFound
}

//TODO: way too much trying and throwing here.
public func readFile(at path: String, operation: (String) throws -> [TargetLink]) throws -> [TargetLink] {
    let fileContents = try String(contentsOfFile: path)
    return try operation(fileContents)
}

public func extractTargetLinks(with fileContents: String) throws -> [TargetLink] {
    
    return try fileContents
        .split(separator: "\n")
        .map { line throws -> TargetLink in
            
            let lineArray: [String] = line.components(separatedBy: ", ")
            
            guard let target = lineArray.first, let link = lineArray.last else {
                throw SymlinkError.noTargetLinksFound
            }
            
            return TargetLink(target: target, link: link)
        }
}

public func generateSymlink(for targetLink: TargetLink) throws {
    try shellOut(to: "ln -sv \(targetLink.target) \(targetLink.link)", at: "~/")
}
