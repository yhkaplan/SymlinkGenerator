import SymlinkGeneratorCore
import Commander

print("Starting, please wait")

let symgen = SymlinkGeneratorCore()

if let contents = symgen.contents {
    print(contents)
} else {
    print("No contents")
}
