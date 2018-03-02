import SymlinkGeneratorCore
import Rainbow
import Commander

print("Starting, please wait".red)

let symgen = SymlinkGeneratorCore()

if let contents = symgen.contents {
    print(contents.green)
} else {
    print("No contents")
}
