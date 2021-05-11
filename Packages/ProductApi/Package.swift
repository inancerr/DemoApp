// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductApi",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ProductApi",
            targets: ["ProductApi"]),
    ],
    dependencies: [
        .package(path: "../Packages/Entities"),
        .package(path: "../Packages/Network"),
        .package(path: "../Packages/LocalStorage"),
        .package(path: "../Packages/Utility")
    ],
    targets: [
        .target(
            name: "ProductApi",
            dependencies: [
                .product(
                    name: "EntitiesDyn",
                    package: "Entities"
                ),
                .product(
                    name: "Network",
                    package: "Network"
                ),
                .product(
                    name: "LocalStorage",
                    package: "LocalStorage"
                ),
                .product(
                    name: "Utility",
                    package: "Utility"
                )
            ]),
        .testTarget(
            name: "ProductApiTests",
            dependencies: ["ProductApi"]),
    ]
)
