import SymlinkGeneratorCore
import Commander

let symgen = SymlinkGeneratorCore()

let main = command { (path: String) in
    do {
        print("Generating symlinks for \(path)")
        let targets = try symgen.readSymlinkFile(at: path)
        targets?.forEach { print("\($0)") }
    } catch let error {
        print("Error: \(error)")
    }
}
    
main.run()
