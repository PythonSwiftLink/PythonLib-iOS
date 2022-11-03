// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let framework_path = "Frameworks310"
var package_targets = [Target]()
package_targets.append(
    .target(
        name: "PythonLib-iOS",
        dependencies: ["Python-iOS"],
        path: "Sources/PythonLib",
        linkerSettings: [
            .linkedLibrary("ncurses"),
            .linkedLibrary("ffi"),
            .linkedLibrary("sqlite3"),
            .linkedLibrary("z"),
            .linkedLibrary("panel"),
            
        ]
    )
    
)


package_targets.append(
    .binaryTarget(
        name: "Python-iOS",
        url: "https://github.com/PythonSwiftLink/PythonAppleSupport/archive/refs/tags/3.10-iOS.b6.zip",
        checksum: "ba7546f7a531ffb6f9b243cfbe9ecce8474d49a06f26e3a97fe4b53e52b57a65"
    )
)
let package = Package(
    name: "PythonLib",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "PythonLib",
            targets: ["PythonLib-iOS"]
        ),
    ],
    targets: package_targets
)



//let package = Package(
//    name: "PythonLib",
//    products: [
//        .library(
//            name: "PythonLib",
//            targets: ["PythonLib"]
//        ),
//    ],
//    targets: [
//        .target(
//            name: "PythonLib",
//            dependencies: ["Python"],
//            linkerSettings: [
//                .linkedLibrary("ncurses"),
//                .linkedLibrary("ffi"),
//                .linkedLibrary("sqlite3"),
//                .linkedLibrary("z"),
//                .linkedLibrary("panel"),
//
//            ]
//        ),
//        .binaryTarget(
//            name: "Python",
//            url: "https://github.com/PythonSwiftLink/PythonAppleSupport/archive/refs/tags/3.10-iOS.b6.zip",
//            checksum: "a5e256b619be86b10b93118e6a277f3a9e98dc7eaf57d3059c56fdbd074a0314"
//        ),
//    ]
//)



