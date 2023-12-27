// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDSKit",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SDSKit",
            targets: ["SDSKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        Package.Dependency.package(url: "https://github.com/airbnb/lottie-ios", from: "4.3.4"),
        Package.Dependency.package(url: "https://github.com/SnapKit/SnapKit", from: "5.6.0"),
        Package.Dependency.package(url: "https://github.com/onevcat/Kingfisher", from: "7.10.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SDSKit",
            dependencies: [
                .product(name: "SnapKit", package: "snapkit"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "Kingfisher", package: "kingfisher")
            ],
            resources: [
                .process("Typo/Font"),
            ]
        ),
        .testTarget(
            name: "SDSKitTests",
            dependencies: ["SDSKit"]),
    ]
)
