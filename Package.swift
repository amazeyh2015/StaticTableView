// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StaticTableView",
    platforms: [
        .iOS(.v13), .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "StaticTableView",
            targets: ["StaticTableView"]),
    ],
    targets: [
        .target(
            name: "StaticTableView",
            dependencies: []),
        .testTarget(
            name: "StaticTableViewTests",
            dependencies: ["StaticTableView"]),
    ]
)
