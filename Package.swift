// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let SymlinkGenerator = "SymlinkGenerator"
let symGenCore = "SymlinkGeneratorCore"
let symGenCoreTests = "SymlinkGeneratorCoreTests"

let package = Package(
    name: SymlinkGenerator,
    dependencies: [
		.package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"), // Shell commands
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0") // CLI tool
    ],
    targets: [
        .target(
            name: SymlinkGenerator,
            dependencies: [symGenCore, "Commander"]
	    ),
	    .target(
	        name: symGenCore,
	        dependencies: ["ShellOut"]
	    ),
        .testTarget(
            name: symGenCoreTests,
            dependencies: [symGenCore]
        )
    ]
)
