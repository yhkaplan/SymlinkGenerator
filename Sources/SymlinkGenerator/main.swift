import SymlinkGeneratorCore
import Commander

let symgen = SymlinkGeneratorCore()

let main = command { (path: String) in
    do {
        print("Generating symlinks for \(path)")
        try symgen.readFile(at: path, operation: symgen.extractTargetLinks)
            .forEach { try symgen.generateSymlinks(targetLink: $0) }
        
    } catch let error {
        print("Error: \(error.localizedDescription)")
    }
}

main.run()
