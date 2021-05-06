// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Api",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Api",
            targets: ["Api"]),
        .library(
            name: "ApiDyn",
            type: .dynamic,
            targets: ["Api"])
    ],
    dependencies: [
        .package(path: "../Packages/Network"),
    ],
    targets: [
        .target(
            name: "Api",
            dependencies: [
                .product(
                    name: "Network",
                    package: "Network"
                )
            ]),
        .testTarget(
            name: "ApiTests",
            dependencies: ["Api"]),
    ]
)
