// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utility",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Utility",
            targets: ["Utility"]),
        .library(
            name: "UtilityDyn",
            type: .dynamic,
            targets: ["Utility"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Utility",
            dependencies: []),
        .testTarget(
            name: "UtilityTests",
            dependencies: ["Utility"]),
    ]
)
