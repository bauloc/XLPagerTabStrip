// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XLPagerTabStrip",
    products: [
        .library(
            name: "XLPagerTabStrip",
            targets: ["XLPagerTabStrip"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "XLPagerTabStrip",
            dependencies: ["FXPageControl"],
            path: "Sources/XLPagerTabStrip"
        ),
        .target(
            name: "FXPageControl",
            path: "Sources/FXPageControl",
            publicHeadersPath: "."
        ),
        .testTarget(
            name: "XLPagerTabStripTests",
            dependencies: ["XLPagerTabStrip"]),
    ]
)
