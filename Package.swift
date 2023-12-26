// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "AppLogger",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "AppLogger",
            targets: ["AppLogger"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppLogger",
            dependencies: []),
        .testTarget(
            name: "AppLoggerTests",
            dependencies: ["AppLogger"]),
    ]
)
