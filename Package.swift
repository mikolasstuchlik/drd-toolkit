// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "drd-toolkit",

    dependencies: [
    ],
    
    targets: [

        .target(name: "RPGSpolecne", dependencies: []),
        .target(name: "AltarDrD", dependencies: ["RPGSpolecne"]),
        .target(name: "WizardsDnD", dependencies: ["RPGSpolecne"]),
        .target(name: "RPGUIKit", dependencies: []),
        .target(name: "drd-toolkit", dependencies: ["AltarDrD", "WizardsDnD", "RPGUIKit"]),

        .testTarget(
            name: "drd-toolkitTests",
            dependencies: ["drd-toolkit"]),
    ]
)
