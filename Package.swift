// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "XMPP",
    
    // TODO: We could support a broader range if using Swift-NIO directly for all platforms
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .tvOS(.v12),
        // .watchOS(.v6)
    ],
    
    products: [
        .library(name: "XMPP",  type: .dynamic, targets: ["XMPP"]),
        .executable(name: "XMPPDemo", targets: ["XMPPDemo"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/Guang1234567/swift-nio.git", .branch("master")),
        .package(url: "https://github.com/Guang1234567/swift-nio-ssl.git", .branch("master")),
    ],
    
    targets: [
        // Dependencies
        .target(name: "XFoundationCompat"),

        // Core lib
        .target(name: "XMPP", dependencies: ["NIO", "NIOSSL", "XFoundationCompat"]),

        // Demo and tests
        .target(name: "XMPPDemo", dependencies: ["XMPP"]),
        .testTarget(name: "XMPPTests", dependencies: ["XMPP"]),
    ]
)
