// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "khqr_sdk",
    platforms: [
        .iOS("11.0")
    ],
    products: [
        .library(name: "khqr-sdk", targets: ["khqr_sdk"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BakongKHQR",
            path: "Sources/BakongKHQR",
            publicHeadersPath: "Classes"
        ),
        .target(
            name: "khqr_sdk",
            dependencies: ["BakongKHQR"],
            path: "Sources/khqr_sdk",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
    ]
)
