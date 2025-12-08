// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContactSupportKit",
    platforms: [
         .iOS(.v15)
    ],
    products: [
        .library(
            name: "ContactSupportKit",
            targets: ["ContactSupportKit"]
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
            name: "ContactSupportKit",
            dependencies: ["ControlKitBase"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ContactSupportKitTests",
            dependencies: ["ContactSupportKit"]
        ),
    ]
)
