// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymlinkGenerator",
    dependencies: [
		.package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"),
	    .package(url: "https://github.com/Swiftline/Swiftline.git", from: "0.5.0")
    ],
    targets: [
        .target(
            name: "SymlinkGenerator",
            dependencies: ["SymlinkGeneratorCore"]
	    ),
	    .target(
	        name: "SymlinkGeneratorCore",
	        dependencies: ["ShellOut", "Swiftline"]
	    )
    ]
)
