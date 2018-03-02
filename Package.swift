// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymlinkGenerator": [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SymlinkGenerator",
            dependencies: [
		"SymlinkGeneratorCore",
		// This is a CLI Swift utility for input/output
	    	.package(url: "https://github.com/Swiftline/Swiftline.git", majorVersion: 0, minor: 3), 
	    ]
	),
	.target(
	    name: "SymlinkGeneratorCore",
	    dependencies: [
		// This is used for executing shell commands
		.package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0")
	    ]
	)
    ]
)
