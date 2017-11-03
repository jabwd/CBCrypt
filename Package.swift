// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBCrypt",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CBCrypt",
            type: .static,
            targets: ["CBCrypt"])
    ],
    dependencies: [
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CBCrypt",
            dependencies: [],
            path: "Sources",
            sources: ["bcrypt.c", "crypt_blowfish.c", "crypt_gensalt.c", "wrapper.c", "x86.S"],
            publicHeadersPath: "."
        ),
        .testTarget(name: "CBCryptTests",
        dependencies: ["CBCrypt"])
    ]
)
