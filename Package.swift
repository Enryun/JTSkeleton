// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JTSkeleton",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "JTSkeleton",
            targets: ["JTSkeleton"]),
    ],
    targets: [
        .target(
            name: "JTSkeleton",
            path: "./Sources/JTSkeleton"
        ),
    ]
)
