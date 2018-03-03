import SymlinkGeneratorCore
import Commander

let symgen = SymlinkGeneratorCore()

let main = command { (path: String) in
    do {
        print("Generating symlinks for \(path)")
        let results = try symgen.readFile(at: "path", operation: symgen.extractTargetLinks)
    } catch let error {
        print("Error: \(error)")
    }
}
    
main.run()
