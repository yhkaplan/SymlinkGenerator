import SymlinkGeneratorCore
import Commander

let main = command { (path: String) in
    do {
        print("Generating symlinks for \(path)")
        try readFile(at: path, operation: extractTargetLinks)
            .forEach { targetLink in
                try generateSymlink(for: targetLink)
            }
        
    } catch let error {
        print("Error: \(error)")
    }
}

main.run()
