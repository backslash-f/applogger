// swift-tools-version:6.3.3

import PackageDescription

let package = Package(
    name: "AppLogger",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(
            name: "AppLogger",
            targets: ["AppLogger"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "AppLogger",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AppLoggerTests",
            dependencies: ["AppLogger"]
        )
    ]
)
