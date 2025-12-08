// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContactSupportKit-SwiftUI",
    platforms: [
         .iOS(.v15)
    ],
    products: [
        .library(
            name: "ContactSupportKit-SwiftUI",
            targets: ["ContactSupportKit-SwiftUI"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ControlKit/ControlKitBase.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "ContactSupportKit-SwiftUI",
            dependencies: ["ControlKitBase"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ContactSupportKit-SwiftUITests",
            dependencies: ["ContactSupportKit-SwiftUI"]
        ),
    ]
)
