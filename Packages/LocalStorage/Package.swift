// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalStorage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "LocalStorage",
            targets: ["LocalStorage"]),
    ],
    dependencies: [
        .package(path: "../Packages/Entities"),
    ],
    targets: [
        .target(
            name: "LocalStorage",
            dependencies: [
                .product(
                    name: "Entities",
                    package: "Entities"
                )
            ]
        ),
        .testTarget(
            name: "LocalStorageTests",
            dependencies: ["LocalStorage"]),
    ]
)
