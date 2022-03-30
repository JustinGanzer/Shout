// swift-tools-version:5.0
// Managed by ice

import PackageDescription

let package = Package(
    name: "Shout",
    products: [
        .library(name: "Shout", targets: ["Shout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueSocket", from: "1.0.46"),
        .package(url: "https://github.com/JustinGanzer/Libssh2Prebuild.git", from: "1.10.1")
    ],
    targets: [
        //installing via a provider works as well, but unused for now
        //.systemLibrary(name: "CSSH", pkgConfig: "libssh2", providers: [.brew(["libssh2","openssl"])]),
        .target(name: "Shout", dependencies: ["CSSH", "Socket"]),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"]),
    ]
)

#if os(watchOS)
package.targets.removeAll(where: { $0.name == "ShoutTests"})
#endif
