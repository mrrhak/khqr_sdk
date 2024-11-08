// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "khqr_sdk",
    platforms: [
        .iOS("11.0")
    ],
    products: [
        .library(name: "khqr_sdk", targets: ["khqr_sdk"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "khqr_sdk",
            dependencies: [],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
