// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymlinkGenerator",
    dependencies: [
		.package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"), // Shell commands
	    .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"), // Colored output
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0") // CLI tool
    ],
    targets: [
        .target(
            name: "SymlinkGenerator",
            dependencies: ["SymlinkGeneratorCore", "Rainbow", "Commander"]
	    ),
	    .target(
	        name: "SymlinkGeneratorCore",
	        dependencies: ["ShellOut"]
	    )
    ]
)
