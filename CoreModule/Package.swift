// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreModule",
    platforms: [
        .iOS(.v14)  // This line specifies minimum iOS 13.0 support
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreModule",
            targets: ["CoreModule"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreModule"),
        .testTarget(
            name: "CoreModuleTests",
            dependencies: ["CoreModule"]),
    ]
)
