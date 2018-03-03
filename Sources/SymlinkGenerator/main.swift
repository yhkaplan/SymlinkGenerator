import SymlinkGeneratorCore
import Commander

let symgen = SymlinkGeneratorCore()

let main = command { (path: String) in
    do {
        print("Generating symlinks for \(path)")
        try symgen
            .readFile(at: path, operation: symgen.extractTargetLinks)
            .forEach { targetLink in
                try symgen.generateSymlink(for: targetLink)
            }
        
    } catch let error {
        print("Error: \(error)") //TODO: localizedDescription causing errors...
    }
}

main.run()
