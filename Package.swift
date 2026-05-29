// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "libsodium",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "libsodium",
            targets: ["libsodium"]
        ),
    ],
    targets: [
        .target(
            name: "libsodium",
            path: "Sources/Classes",
            exclude: [
                "Makefile.am",
                "Makefile.in",
                "include/Makefile.am",
                "include/Makefile.in",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/sodium"),
                .headerSearchPath("include"),
                .define("NATIVE_LITTLE_ENDIAN", to: "1"),
                .define("HAVE_MADVISE"),
                .define("HAVE_MMAP"),
                .define("HAVE_MPROTECT"),
                .define("HAVE_POSIX_MEMALIGN"),
                .define("HAVE_WEAK_SYMBOLS"),
            ]
        ),
    ]
)
