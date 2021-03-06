// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "XMPP",
    products: [
        .library(name: "XMPP", targets: ["XMPP"]),
        .library(name: "PlistCoder", targets: ["PlistCoder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "1.11.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "1.3.2"),
    ],
    targets: [
        .systemLibrary(name: "libxml2", pkgConfig: "libxml-2.0", providers: [.brew(["libxml2"]),.apt(["libxml2-dev"])]),
        .target(name: "XMPP", dependencies: ["libxml2", "PlistCoder", "NIO", "NIOOpenSSL"], exclude: ["Networking/Darwin/"]),
        .target(name: "PlistCoder"),
        .testTarget(name: "XMPPTests", dependencies: ["XMPP"]),
    ]
)
