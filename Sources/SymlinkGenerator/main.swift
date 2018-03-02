import SymlinkGeneratorCore
import Commander
import Files

print("Starting, please wait".red)

let symgen = SymlinkGeneratorCore()

if let contents = symgen.contents {
    print(contents)
} else {
    print("No contents")
}
