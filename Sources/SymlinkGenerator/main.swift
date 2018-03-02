import SymlinkGeneratorCore
import Commander

let symgen = SymlinkGeneratorCore()

print("Starting, please specify path to symlink file")

command (
    Argument<String>("path", description: "Path to symlink file")
) { path in
    do {
        let targets = try symgen.readSymlinkFile(at: path)
        targets?.forEach { print("\($0)") }
    } catch let error {
        print("Error: \(error)")
    }
}.run()
